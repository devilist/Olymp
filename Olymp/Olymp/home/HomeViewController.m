//
//  HomeViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"str_home", @"首页");
        self.tabBarItem.image = [UIImage imageNamed:@"ic_home"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *imageBg = [UIImage imageNamed:@"bg_home"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = imageBg;
    [imageView setContentMode:UIViewContentModeScaleAspectFit];

    [self.view addSubview:imageView];


    // Do any additional setup after loading the view.
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
