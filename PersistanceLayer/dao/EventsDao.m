//
//  EventsDao.m
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "EventsDao.h"

@implementation EventsDao


- (int)create:(Events *)model {

    if ([self openDB]) {
        NSString *sqlStr = @"INSERT INTO Events (EventName, EventIcon,KeyInfo,BasicsInfo,OlympicInfo) VALUES (?,?,?,?,?)";
        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            const char *cEventName = [model.EventName UTF8String];
            const char *cEventIcon = [model.EventIcon UTF8String];
            const char *cKeyInfo = [model.KeyInfo UTF8String];
            const char *cBasicsInfo = [model.BasicsInfo UTF8String];
            const char *cOlympicInfo = [model.OlympicInfo UTF8String];

            sqlite3_bind_text(statement, 1, cEventName, -1, NULL);
            sqlite3_bind_text(statement, 2, cEventIcon, -1, NULL);
            sqlite3_bind_text(statement, 3, cKeyInfo, -1, NULL);
            sqlite3_bind_text(statement, 4, cBasicsInfo, -1, NULL);
            sqlite3_bind_text(statement, 5, cOlympicInfo, -1, NULL);

            if (sqlite3_step(statement) != SQLITE_DONE) {
                sqlite3_finalize(statement);
                sqlite3_close(db);
                NSLog(@"插入数据失败。");
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return 0;
}

- (int)remove:(Events *)model {
    if ([self openDB]) {
        NSString *sqlScheduleStr = [[NSString alloc] initWithFormat:@"DELETE from Schedule where EventID=%i", model.EventID];
        // 开启事务，立刻提交之前事物
        sqlite3_exec(db, "BEGIN IMMEDIATE TRANSACTION", NULL, NULL, NULL);
        char *err;
        if (sqlite3_exec(db, [sqlScheduleStr UTF8String], NULL, NULL, &err) != SQLITE_OK) {
            // 回滚事务
            sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
            NSAssert(FALSE, @"删除数据失败");
        }

        NSString *sqlEventStr = [[NSString alloc] initWithFormat:@"DELETE from Events where EventID=%i", model.EventID];
        if (sqlite3_exec(db, [sqlEventStr UTF8String], NULL, NULL, &err) != SQLITE_OK) {
            // 回滚事务
            sqlite3_exec(db, "ROLLBACK TRANSACTION", NULL, NULL, NULL);
            NSAssert(FALSE, @"删除数据失败");
        }
        // 提交事务
        sqlite3_exec(db, "COMMIT TRANSACTION", NULL, NULL, NULL);
        sqlite3_close(db);
    }
    return 0;
}

- (int)modify:(Events *)model {
    if ([self openDB]) {

        NSString *sqlStr = @"UPDATE Events set EventName=?, EventIcon=?,KeyInfo=?,BasicsInfo=?,OlympicInfo=? where EventID =?";

        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [sqlStr UTF8String], -1, &statement, NULL) == SQLITE_OK) {

            const char *cEventName = [model.EventName UTF8String];
            const char *cEventIcon = [model.EventName UTF8String];
            const char *cKeyInfo = [model.KeyInfo UTF8String];
            const char *cBasicsInfo = [model.BasicsInfo UTF8String];
            const char *cOlympicInfo = [model.OlympicInfo UTF8String];

            //绑定参数开始
            sqlite3_bind_text(statement, 1, cEventName, -1, NULL);
            sqlite3_bind_text(statement, 2, cEventIcon, -1, NULL);
            sqlite3_bind_text(statement, 3, cKeyInfo, -1, NULL);
            sqlite3_bind_text(statement, 4, cBasicsInfo, -1, NULL);
            sqlite3_bind_text(statement, 5, cOlympicInfo, -1, NULL);
            sqlite3_bind_int(statement, 6, model.EventID);

            //执行
            if (sqlite3_step(statement) != SQLITE_DONE) {
                sqlite3_finalize(statement);
                sqlite3_close(db);
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
        NSString *qsql = @"SELECT EventName, EventIcon,KeyInfo,BasicsInfo,OlympicInfo,EventID FROM Events";
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //执行
            while (sqlite3_step(statement) == SQLITE_ROW) {

                Events *events = [[Events alloc] init];

                char *cEventName = (char *) sqlite3_column_text(statement, 0);
                char *cEventIcon = (char *) sqlite3_column_text(statement, 1);
                char *cKeyInfo = (char *) sqlite3_column_text(statement, 2);
                char *cBasicsInfo = (char *) sqlite3_column_text(statement, 3);
                char *cOlympicInfo = (char *) sqlite3_column_text(statement, 4);

                events.EventName = [[NSString alloc] initWithUTF8String:cEventName];
                events.EventIcon = [[NSString alloc] initWithUTF8String:cEventIcon];
                events.KeyInfo = [[NSString alloc] initWithUTF8String:cKeyInfo];
                events.BasicsInfo = [[NSString alloc] initWithUTF8String:cBasicsInfo];
                events.OlympicInfo = [[NSString alloc] initWithUTF8String:cOlympicInfo];

                events.EventID = sqlite3_column_int(statement, 5);

                [listData addObject:events];
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return listData;

}

- (Events *)findById:(Events *)model {
    if ([self openDB]) {
        NSString *qsql = @"SELECT EventName, EventIcon,KeyInfo,BasicsInfo,OlympicInfo,EventID FROM Events  where EventID =?";
        sqlite3_stmt *statement;
        //预处理过程
        if (sqlite3_prepare_v2(db, [qsql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            //绑定参数开始
            sqlite3_bind_int(statement, 1, model.EventID);
            //执行
            if (sqlite3_step(statement) == SQLITE_ROW) {

                Events *events = [[Events alloc] init];

                char *cEventName = (char *) sqlite3_column_text(statement, 0);
                char *cEventIcon = (char *) sqlite3_column_text(statement, 1);
                char *cKeyInfo = (char *) sqlite3_column_text(statement, 2);
                char *cBasicsInfo = (char *) sqlite3_column_text(statement, 3);
                char *cOlympicInfo = (char *) sqlite3_column_text(statement, 4);

                events.EventName = [[NSString alloc] initWithUTF8String:cEventName];
                events.EventIcon = [[NSString alloc] initWithUTF8String:cEventIcon];
                events.KeyInfo = [[NSString alloc] initWithUTF8String:cKeyInfo];
                events.BasicsInfo = [[NSString alloc] initWithUTF8String:cBasicsInfo];
                events.OlympicInfo = [[NSString alloc] initWithUTF8String:cOlympicInfo];
                events.EventID = sqlite3_column_int(statement, 5);

                sqlite3_finalize(statement);
                sqlite3_close(db);
                return events;
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    }
    return nil;
}

@end
