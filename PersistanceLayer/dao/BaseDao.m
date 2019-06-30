//
//  BaseDao.m
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "BaseDao.h"

@implementation BaseDao

- (id)init {
    self = [super init];
    if (self) {
        [DBHelper initDB];
    }
    return self;
}


- (BOOL)openDB {
    const char *dbFilePath = [DBHelper applicationDocumentsDirectoryFile:DB_FILE_NAME];
    NSLog(@"DBFile path is: %s", dbFilePath);
    if (sqlite3_open(dbFilePath, &db) != SQLITE_OK) {
        sqlite3_close(db);
        return FALSE;
    }
    return TRUE;
}

- (int)create:(id)model {
    return 0;
}

- (int)remove:(id)model {
    return 0;
}

- (int)modify:(id)model {
    return 0;
}

- (NSMutableArray *)findAll {
    return nil;
}

- (id)findById:(id)model {
    return NULL;
}


@end
