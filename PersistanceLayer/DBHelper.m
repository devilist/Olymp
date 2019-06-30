//
//  DBHelper.m
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "DBHelper.h"

@implementation DBHelper

+ (const char *)applicationDocumentsDirectoryFile:(NSString *)fileName {
    NSString *documentDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory,
            NSUserDomainMask, TRUE) lastObject];
    NSString *path = [documentDirectory stringByAppendingPathComponent:fileName];

    const char *cpath = [path UTF8String];

    return cpath;
}

+ (void)initDB {
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[DBHelper class]];
    NSString *configTablePath = [frameworkBundle pathForResource:@"DBConfig" ofType:@"plist"];
    NSDictionary *configTable = [[NSDictionary alloc] initWithContentsOfFile:configTablePath];
    NSNumber *dbConfigVersion = configTable[@"DB_VERSION"];
    if (dbConfigVersion == nil) dbConfigVersion = 0;
    int versionNumber = [DBHelper dbVersionNumber];

    if ([dbConfigVersion integerValue] != versionNumber) {
        const char *dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
        if (sqlite3_open(dbFilePath, &db) == SQLITE_OK) {
            NSString *createTablePath = [frameworkBundle pathForResource:@"create_db" ofType:@"sql"];
            NSString *sql = [[NSString alloc] initWithContentsOfFile:createTablePath encoding:NSUTF8StringEncoding error:nil];
            sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
            NSString *usql = [[NSString alloc] initWithFormat:@"updateDBVersionInfo set version_number = %i", [dbConfigVersion intValue]];
            sqlite3_exec(db, [usql UTF8String], NULL, NULL, NULL);
        } else {
            NSLog(@"数据库打开失败");
        }
    }

}

+ (int)dbVersionNumber {
    int versionNumber = -1;
    const char *dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
    if (sqlite3_open(dbFilePath, &db) == SQLITE_OK) {
        NSString *sql = @"create table if not exists DBVersionInfo(version_number int)";
        sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
        NSString *qsql = @"select version_number from DBVersionInfo";
        const char *cqsql = [qsql UTF8String];

        sqlite3_stmt *statement;
        if (sqlite3_prepare_v2(db, cqsql, -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_ROW) {
                NSLog(@"有数据");
                versionNumber = sqlite3_column_int(statement, 0);
            } else {
                NSLog(@"无数据");
                NSString *insertSql = @"insert into DBVersionInfo(version_number) values(-1)";
                const char *cInsertSql = [insertSql UTF8String];
                sqlite3_exec(db, cInsertSql, NULL, NULL, NULL);
            }
        }
        sqlite3_finalize(statement);
        sqlite3_close(db);
    } else {
        sqlite3_close(db);
    }
    return versionNumber;
}

@end
