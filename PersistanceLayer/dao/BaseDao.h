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

@interface BaseDao<T> : NSObject {
    sqlite3 *db;
}

- (BOOL)openDB;

- (int)create:(T)model;

- (int)remove:(T)model;

- (int)modify:(T)model;

- (NSMutableArray *)findAll;

- (T)findById:(T)model;


@end

NS_ASSUME_NONNULL_END
