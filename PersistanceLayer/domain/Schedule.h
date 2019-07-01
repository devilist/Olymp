//
//  Schedule.h
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Events.h"

NS_ASSUME_NONNULL_BEGIN

@interface Schedule : NSObject

@property(nonatomic, assign) int ScheduleID;
@property(nonatomic, strong) NSString *GameDate;
@property(nonatomic, strong) NSString *GameTime;
@property(nonatomic, strong) NSString *GameInfo;
@property(nonatomic, strong) NSString *BasicsInfo;
@property(nonatomic, strong) Events *Event;

@end

NS_ASSUME_NONNULL_END
