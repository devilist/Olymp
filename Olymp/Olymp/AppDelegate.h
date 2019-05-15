//
//  AppDelegate.h
//  Olymp
//
//  Created by Zi Mu on 2019/5/15.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

