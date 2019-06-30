//
//  EventsDao.h
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"
#import "BaseDao.h"

NS_ASSUME_NONNULL_BEGIN

@interface EventsDao : BaseDao<Events*>

//- (int)create:(Events *)model;
//
//- (int)remove:(Events *)model;
//
//- (int)modify:(Events *)model;
//
//- (NSMutableArray *)findAll;
//
//- (Events *)findById:(Events *)model;


@end

NS_ASSUME_NONNULL_END
