//
//  ScheduleViewController.m
//  Olymp
//
//  Created by ZengPu on 2019/7/6.
//  Copyright © 2019 Zi Mu. All rights reserved.
//

#import "ScheduleViewController.h"
#import "EventDetailViewController.h"

#import <PersistanceLayer/Schedule.h>
#import <PersistanceLayer/ScheduleDao.h>
#import <PersistanceLayer/EventsDao.h>

@interface ScheduleViewController ()


@property(strong, nonatomic) NSDictionary *data;
@property(strong, nonatomic) NSArray *gameDataList;

@end

@implementation ScheduleViewController

- (id)init {
    self = [super init];
    if (self) {
        self.title = NSLocalizedString(@"str_schedule", @"日程");
        self.tabBarItem.image = [UIImage imageNamed:@"ic_schedule"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
}

- (void)loadData {
    if (self.data == nil || [self.data count] == 0) {
        self.data = [self readData];
        NSArray *keys = [self.data allKeys];
        self.gameDataList = [keys sortedArrayUsingSelector:@selector(compare:)];
    }
}

- (NSMutableDictionary *)readData {
    ScheduleDao *dao = [ScheduleDao sharedInstance];
    NSMutableArray *schedules = [dao findAll];
    NSMutableDictionary *resDict = [[NSMutableDictionary alloc] init];
    EventsDao *eventsDao = [EventsDao sharedInstance];

    for (Schedule *schedule in schedules) {
        Events *event = [eventsDao findById:schedule.Event];
        schedule.Event = event;
        NSArray *allKey = [resDict allKeys];
        if ([allKey containsObject:schedule.GameDate]) {
            NSMutableArray *value = resDict[schedule.GameDate];
            [value addObject:schedule];
        } else {
            NSMutableArray *value = [[NSMutableArray alloc] init];
            [value addObject:schedule];
            resDict[schedule.GameDate] = value;
        }
    }
    return resDict;
}

#pragma mark - source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *date = self.gameDataList[section];

    return [self.data[date] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"scheduleCellIdentifier"];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scheduleCellIdentifier"
                                                            forIndexPath:indexPath];
    NSString *date = self.gameDataList[indexPath.section];
    NSArray *schedules = self.data[date];
    Schedule *schedule = schedules[indexPath.row];
    NSString *subTitle = [[NSString alloc] initWithFormat:@"%@ | %@", schedule.GameInfo, schedule.Event.EventName];
    cell.textLabel.text = schedule.GameTime;
    cell.detailTextLabel.text = subTitle;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.data allKeys] count];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *date = self.gameDataList[section];
    return date;
}


- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in self.gameDataList) {
        NSString *title = [item substringFromIndex:5];
        [listTitles addObject:title];
    }
    return listTitles;
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
