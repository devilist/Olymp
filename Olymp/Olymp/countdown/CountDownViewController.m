//
//  CountDownViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "CountDownViewController.h"

@interface CountDownViewController ()

@end

@implementation CountDownViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"str_countdown", @"倒计时");
        self.tabBarItem.image = [UIImage imageNamed:@"ic_countdown"];
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
