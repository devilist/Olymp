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
    return [super create:model];
}

- (int)remove:(Events *)model {
    return [super remove:model];
}

- (int)modify:(Events *)model {
    return [super modify:model];
}

- (NSMutableArray *)findAll {
    return [super findAll];
}

- (Events *)findById:(Events *)model {
    return [super findById:model];
}


@end
