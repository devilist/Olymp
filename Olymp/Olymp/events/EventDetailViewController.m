//
// Created by ZengPu on 2019-07-07.
// Copyright (c) 2019 Zi Mu. All rights reserved.
//

#import "EventDetailViewController.h"
#import "ERUIUtils.h"

@interface EventDetailViewController ()

@property(strong, nonatomic) UILabel *eventNamelable;
@property(strong, nonatomic) UIImageView *eventIconImg;
@property(strong, nonatomic) UITextView *keyInfoTextView;
@property(strong, nonatomic) UITextView *basicInfoTextView;
@property(strong, nonatomic) UITextView *olymInfoTextView;

@end

@implementation EventDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [[ERUIUtils sharedInstance] printSize];
    CGFloat navBarHeight = self.navigationController.navigationBar.frame.size.height;
    NSLog(@"navBarHeight: %f", navBarHeight);

    CGFloat imgTop = [[UIApplication sharedApplication] statusBarFrame].size.height +
            self.navigationController.navigationBar.frame.size.height + 16;

    CGRect screen = [[UIScreen mainScreen] bounds];
    self.view.backgroundColor = [UIColor whiteColor];
    self.eventIconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, imgTop, 102, 102)];
    self.eventIconImg.image = [UIImage imageNamed:self.events.EventIcon];
    [self.view addSubview:self.eventIconImg];

    self.eventNamelable = [[UILabel alloc] initWithFrame:CGRectMake(160, imgTop + 60, 200, 30)];
    self.eventNamelable.text = self.events.EventName;
    self.eventNamelable.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:self.eventNamelable];

    self.keyInfoTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, self.eventIconImg.frame.origin.y + 120, screen.size.width - 20, 90)];
    self.keyInfoTextView.editable = NO;
    self.keyInfoTextView.text = self.events.KeyInfo;
    [self.view addSubview:self.keyInfoTextView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.keyInfoTextView.frame.origin.y + 100, 200, 30)];
    label.text = @"The Basics";
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];

    self.basicInfoTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, label.frame.origin.y + 30, screen.size.width - 20, 90)];
    self.basicInfoTextView.editable = NO;
    self.basicInfoTextView.text = self.events.BasicsInfo;
    [self.view addSubview:self.basicInfoTextView];

    label = [[UILabel alloc] initWithFrame:CGRectMake(10, self.basicInfoTextView.frame.origin.y + 100, 300, 30)];
    label.text = @"Olympic past and present";
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];

    self.olymInfoTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, label.frame.origin.y + 30, screen.size.width - 20, 90)];
    self.olymInfoTextView.editable = NO;
    self.olymInfoTextView.text = self.events.KeyInfo;
    [self.view addSubview:self.olymInfoTextView];


}


@end