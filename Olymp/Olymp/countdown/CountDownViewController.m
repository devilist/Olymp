//
//  CountDownViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "CountDownViewController.h"
#import "ERUIUtils.h"

@interface CountDownViewController ()

@end

@implementation CountDownViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"str_countdown", @"倒计时");
        self.tabBarItem.image = [UIImage imageNamed:@"ic_countdown"];
//        self.tabBarItem.imageInsets = UIEdgeInsetsMake(-6, 0, 6, 0);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[ERUIUtils sharedInstance] printSize];
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    NSLog(@"navBarHeight: %f", navBarHeight);

    UIImage *imageBg = [UIImage imageNamed:@"bg_countdown"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.image = imageBg;
    [imageView setContentMode:UIViewContentModeScaleAspectFill];

    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat labelWidth = screen.size.width, labelHeight = 50, labelTop = 270;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, labelTop, labelWidth, labelHeight)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:50];
    label.textColor = [UIColor whiteColor];

    [self.view addSubview:imageView];
    [self.view addSubview:label];

    NSDateComponents *components = [[NSDateComponents alloc] init];
    components.day = 24;
    components.month = 7;
    components.year = 2020;

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDate *desDate = [calendar dateFromComponents:components];
    NSDate *today = [NSDate date];

    NSDateComponents *diffComponent = [calendar components:NSCalendarUnitDay fromDate:today toDate:desDate options:NSCalendarWrapComponents];
    NSInteger diff = [diffComponent day];
    label.text = [NSString stringWithFormat:NSLocalizedString(@"str_left_days", @"倒计时"), (long)diff];

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
