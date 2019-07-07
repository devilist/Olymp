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

//- (id)init {
//    self = [super init];
//    if (self) {
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadViewControllers];
}

- (void)loadViewControllers {
    UIViewController *controllerHome = [[HomeViewController alloc] init];
    UIViewController *controllerEvents = [[EventsViewController alloc] init];
    UIViewController *controllerSchedule = [[ScheduleViewController alloc] init];
    UIViewController *controllerCountDown = [[CountDownViewController alloc] init];
    UIViewController *controllerAbout = [[AboutUsViewController alloc] init];
    UINavigationController *navEvents = [[UINavigationController alloc] initWithRootViewController:controllerEvents];
    UINavigationController *navSchedule = [[UINavigationController alloc] initWithRootViewController:controllerSchedule];

    self.viewControllers = @[controllerHome, navEvents, navSchedule, controllerCountDown, controllerAbout];

    // 改变tab字体大小
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    attr[NSForegroundColorAttributeName] = [UIColor grayColor];

    NSMutableDictionary *selectAttr = [NSMutableDictionary dictionary];
    selectAttr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    selectAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];

    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttr forState:UIControlStateSelected];
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
