//
//  AboutUsViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@end

@implementation AboutUsViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"str_about", @"关于我们");
        self.tabBarItem.image = [UIImage imageNamed:@"ic_about"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *imageBg = [UIImage imageNamed:@"bg_about"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:imageBg];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = imageBg;
    [imageView setContentMode:UIViewContentModeScaleAspectFill];

    [self.view addSubview:imageView];
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
