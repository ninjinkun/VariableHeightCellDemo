//
//  ManualHeightAutoLayoutViewController.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import "ManualHeightAutoLayoutViewController.h"
#import "ManualHeightAutoLayoutCell.h"
#import "TwitterTimelineManager.h"

@implementation ManualHeightAutoLayoutViewController {
    NSArray *_statuses;
    NSInteger _benchmarkTotalCount;
    float _benchmarkTotalTime;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"==== %@ ====", NSStringFromClass([self class]));
    [self.tableView registerNib:[ManualHeightAutoLayoutCell nib] forCellReuseIdentifier:[ManualHeightAutoLayoutCell reuseIdentifier]];
    [[TwitterTimelineManager sharedManager] accountWithBlock:^(ACAccount *account, NSError *error) {
        [[TwitterTimelineManager sharedManager] getTimelineWithBlock:^(NSArray *statuses, NSError *error) {
            _statuses = statuses;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManualHeightAutoLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:[ManualHeightAutoLayoutCell reuseIdentifier] forIndexPath:indexPath];
    Status *status = _statuses[indexPath.row];
    cell.status = status;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _statuses.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *startDate = [NSDate date];
    Status *status = _statuses[indexPath.row];
    CGFloat height = [ManualHeightAutoLayoutCell heightForStatus:status forWidth:self.view.bounds.size.width];
    float wasteTime = [startDate timeIntervalSinceNow] * -1000;
    _benchmarkTotalTime += wasteTime;
    _benchmarkTotalCount++;
    if (_benchmarkTotalCount % 10 == 0) {
        NSLog(@"avg %f ms", _benchmarkTotalTime / (float)_benchmarkTotalCount);
    }

    return height;
}

#ifdef DEFFER
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}
#endif

@end
