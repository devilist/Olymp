//
//  DBHelper.h
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

#define DB_FILE_NAME @"app.db"

static sqlite3 *db;

NS_ASSUME_NONNULL_BEGIN

@interface DBHelper : NSObject

+ (const char *)applicationDocumentsDirectoryFile:(NSString *)fileName;

+(void)initDB;

+(int)dbVersionNumber;

@end

NS_ASSUME_NONNULL_END
