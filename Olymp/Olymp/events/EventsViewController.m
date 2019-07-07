//
//  EventsViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "EventsViewController.h"
#import "EventsViewCell.h"
#import <PersistanceLayer/EventsDao.h>

#import "EventDetailViewController.h"

@interface EventsViewController () <UICollectionViewDelegate, UICollectionViewDataSource> {
    NSInteger COL_NUM;
}

@property(strong, nonatomic) NSArray *events;
@property(strong, nonatomic) UICollectionView *collectionView;

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
    [self setupCollectionView];
    [self loadData];

}

- (void)loadData {
    if (self.events == nil || [self.events count] == 0) {
        EventsDao *dao = [EventsDao sharedInstance];
        self.events = [dao findAll];
        [self.collectionView reloadData];
    }
}

- (void)setupCollectionView {
    COL_NUM = (NSInteger) ([UIScreen mainScreen].bounds.size.width / 106);

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(101, 101);
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    layout.minimumInteritemSpacing = 1;

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame
                                             collectionViewLayout:layout];

    [self.collectionView registerClass:[EventsViewCell class] forCellWithReuseIdentifier:@"eventCellIdentifier"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

    [self.view addSubview:self.collectionView];

}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return COL_NUM;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    unsigned long num = [self.events count] % COL_NUM;
    if (num == 0) return [self.events count] / COL_NUM;
    else return [self.events count] / COL_NUM + 1;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                           cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EventsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"eventCellIdentifier"
                                                                     forIndexPath:indexPath];
    NSInteger index = indexPath.section * COL_NUM + indexPath.row;
//    NSLog(@"section: %i, path: %i,index: %i, count: %i", (int) indexPath.section, (int) indexPath.row, (int) index, (int) self.events.count);
    if (index < self.events.count) {
        Events *events = self.events[index];
//        NSLog(@"index: %i, icon: %@", (int) index, events.EventIcon);
        cell.imageView.image = [UIImage imageNamed:events.EventIcon];
    } else {
        cell.imageView.image = nil;
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    NSInteger index = indexPath.section * COL_NUM + indexPath.row;
    Events *events = self.events[index];
    EventDetailViewController *controller = [[EventDetailViewController alloc] init];
    controller.events = events;
    [self.navigationController pushViewController:controller animated:YES];
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
