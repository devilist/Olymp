//
//  RootTabBarViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "HomeViewController.h"
#import "EventsViewController.h"
#import "ScheduleViewController.h"
#import "CountDownViewController.h"
#import "AboutUsViewController.h"

@interface RootTabBarViewController ()

@end

@implementation RootTabBarViewController

- (id)init {
    self = [super init];
    if (self) {
        UIViewController *controllerHome = [[HomeViewController alloc] init];
        UIViewController *controllerEvents = [[EventsViewController alloc] init];
        UIViewController *controllerSchedule = [[ScheduleViewController alloc] init];
        UIViewController *controllerCountDown = [[CountDownViewController alloc] init];
        UIViewController *controllerAbout = [[AboutUsViewController alloc] init];

        self.viewControllers = @[controllerHome, controllerEvents, controllerSchedule, controllerCountDown, controllerAbout];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
