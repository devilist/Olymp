//
//  ScheduleDao.m
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "ScheduleDao.h"

@implementation ScheduleDao


- (int)create:(Schedule *)model {
    return [super create:model];
}

- (int)remove:(Schedule *)model {
    return [super remove:model];
}

- (int)modify:(Schedule *)model {
    return [super modify:model];
}

- (NSMutableArray *)findAll {
    return [super findAll];
}

- (Schedule *)findById:(Schedule *)model {
    return [super findById:model];
}


@end
