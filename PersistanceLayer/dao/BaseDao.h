//
//  BaseDao.h
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//


#include "sqlite3.h"
#include "DBHelper.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseDao : NSObject {
    sqlite3 *db;
}

-(BOOL)openDB;


@end

NS_ASSUME_NONNULL_END
