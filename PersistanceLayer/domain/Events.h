//
//  Events.h
//  PersistanceLayer
//
//  Created by ZengPu on 2019/6/30.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Events : NSObject

@property(nonatomic, assign) int EventID;
@property(nonatomic, strong) NSString *EventName;
@property(nonatomic, strong) NSString *EventIcon;
@property(nonatomic, strong) NSString *KeyInfo;
@property(nonatomic, strong) NSString *BasicsInfo;
@property(nonatomic, strong) NSString *OlympicInfo;

@end

NS_ASSUME_NONNULL_END
