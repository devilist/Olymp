//
//  ScheduleDao.m
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "ScheduleDao.h"

@implementation ScheduleDao

static ScheduleDao *sharedSingleton = nil;


+ (ScheduleDao *)sharedInstance {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedSingleton = (ScheduleDao *) [[super alloc] init];
    });
    return sharedSingleton;
}

- (int)create:(Schedule *)model {
    if ([self openDB]) {

        NSString *sqlStr = @"INSERT INTO Schedule (GameDate, GameTime,GameInfo,EventID) VALUES (?,?,?,?)";

        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {

            const char *cGameDate = [model.GameDate UTF8String];
            const char *cGameTime = [model.GameTime UTF8String];
            const char *cGameInfo = [model.GameInfo UTF8String];

            //绑定参数开始
            sqlite3_bind_text(statement, 1, cGameDate, -1, NULL);
            sqlite3_bind_text(statement, 2, cGameTime, -1, NULL);
            sqlite3_bind_text(statement, 3, cGameInfo, -1, NULL);
            sqlite3_bind_int(statement, 4, model.Event.EventID);

            //执行插入
            if (sqlite3_step(statement) != SQLITE_DONE) {
                sqlite3_finalize(statement);
                sqlite3_close(db);
                NSAssert(NO, @"插入数据失败。");
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }

    return 0;
}

- (int)remove:(Schedule *)model {
    if ([self openDB]) {
        NSString *sqlStr = @"DELETE  from Schedule where ScheduleID =?";
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //绑定参数开始
            sqlite3_bind_int(statement, 1, model.ScheduleID);
            //执行
            if (sqlite3_step(statement) != SQLITE_DONE) {
                sqlite3_finalize(statement);
                sqlite3_close(db);
                NSAssert(NO, @"删除数据失败。");
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }

    return 0;
}

- (int)modify:(Schedule *)model {
    if ([self openDB]) {

        NSString *sqlStr = @"UPDATE Schedule set GameInfo=?,EventID=?,GameDate =?, GameTime=? where ScheduleID=?";
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            const char *cGameDate = [model.GameDate UTF8String];
            const char *cGameTime = [model.GameTime UTF8String];
            const char *cGameInfo = [model.GameInfo UTF8String];

            //绑定参数开始
            sqlite3_bind_text(statement, 1, cGameInfo, -1, NULL);
            sqlite3_bind_int(statement, 2, model.Event.EventID);
            sqlite3_bind_text(statement, 3, cGameDate, -1, NULL);
            sqlite3_bind_text(statement, 4, cGameTime, -1, NULL);
            sqlite3_bind_int(statement, 5, model.ScheduleID);

            //执行
            if (sqlite3_step(statement) != SQLITE_DONE) {
                NSAssert(NO, @"修改数据失败。");
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;
}

- (NSMutableArray *)findAll {
    NSMutableArray *listData = [[NSMutableArray alloc] init];

    if ([self openDB]) {
        NSString *qsql = @"SELECT GameDate, GameTime,GameInfo,EventID,ScheduleID FROM Schedule";
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //执行
            while (sqlite3_step(statement) == SQLITE_ROW) {
                Schedule *schedule = [[Schedule alloc] init];
                Events *event = [[Events alloc] init];
                schedule.Event = event;

                char *cGameDate = (char *) sqlite3_column_text(statement, 0);
                char *cGameTime = (char *) sqlite3_column_text(statement, 1);
                char *cGameInfo = (char *) sqlite3_column_text(statement, 2);

                schedule.GameDate = [[NSString alloc] initWithUTF8String:cGameDate];
                schedule.GameTime = [[NSString alloc] initWithUTF8String:cGameTime];
                schedule.GameInfo = [[NSString alloc] initWithUTF8String:cGameInfo];
                schedule.Event.EventID = sqlite3_column_int(statement, 3);
                schedule.ScheduleID = sqlite3_column_int(statement, 4);

                [listData addObject:schedule];
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);

    }
    return listData;
}

- (Schedule *)findById:(Schedule *)model {
    if ([self openDB]) {

        NSString *qsql = @"SELECT GameDate, GameTime,GameInfo,EventID,ScheduleID FROM Schedule where ScheduleID=?";
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //绑定参数开始
            sqlite3_bind_int(statement, 1, model.ScheduleID);
            //执行
            if (sqlite3_step(statement) == SQLITE_ROW) {

                Schedule *schedule = [[Schedule alloc] init];
                Events *event = [[Events alloc] init];
                schedule.Event = event;

                char *cGameDate = (char *) sqlite3_column_text(statement, 0);
                char *cGameTime = (char *) sqlite3_column_text(statement, 1);
                char *cGameInfo = (char *) sqlite3_column_text(statement, 2);

                schedule.GameDate = [[NSString alloc] initWithUTF8String:cGameDate];
                schedule.GameTime = [[NSString alloc] initWithUTF8String:cGameTime];
                schedule.GameInfo = [[NSString alloc] initWithUTF8String:cGameInfo];

                schedule.Event.EventID = sqlite3_column_int(statement, 3);
                schedule.ScheduleID = sqlite3_column_int(statement, 4);

                sqlite3_finalize(statement);
                sqlite3_close(db);

                return schedule;
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return nil;
}

@end
