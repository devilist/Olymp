//
//  EventsViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "EventsViewController.h"

@interface EventsViewController ()

@end

@implementation EventsViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"str_events", @"项目");
        self.tabBarItem.image = [UIImage imageNamed:@"ic_events"];
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
