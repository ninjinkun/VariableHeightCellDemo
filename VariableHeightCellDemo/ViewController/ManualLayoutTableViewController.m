//
//  ManualLayoutTableViewController.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import "ManualLayoutTableViewController.h"
#import "TwitterTimelineManager.h"
#import "ManualLayoutCell.h"
#import "StatusLayout.h"

@implementation ManualLayoutTableViewController {
    NSArray *_statuses;
    NSArray *_layouts;
    NSInteger _benchmarkTotalCount;
    NSInteger _benchmarkLayoutTotalCount;
    float _benchmarkTotalTime;
    float _benchmarkLayoutTotalTime;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"==== %@ ====", NSStringFromClass([self class]));
    [self.tableView registerClass:[ManualLayoutCell class]  forCellReuseIdentifier:[ManualLayoutCell reuseIdentifier]];
    [[TwitterTimelineManager sharedManager] accountWithBlock:^(ACAccount *account, NSError *error) {
        [[TwitterTimelineManager sharedManager] getTimelineWithBlock:^(NSArray *statuses, NSError *error) {
            _statuses = statuses;
            NSMutableArray *layouts = [@[] mutableCopy];
            [_statuses enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                NSDate *startDate = [NSDate date];
                StatusLayout *layout = [[StatusLayout alloc] init];
                [layout caluculateLayoutWithStatus:obj forWidth:self.view.frame.size.width];
                [layouts addObject:layout];
                float wasteTime = [startDate timeIntervalSinceNow] * -1000;
                _benchmarkLayoutTotalTime += wasteTime;
                _benchmarkLayoutTotalCount++;
                if (_benchmarkLayoutTotalCount % 10 == 0) {
                    NSLog(@"deffer avg %f ms", _benchmarkLayoutTotalTime / (float)_benchmarkLayoutTotalCount);
                }
            }];
            _layouts = [layouts copy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManualLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:[ManualLayoutCell reuseIdentifier] forIndexPath:indexPath];
    Status *status = _statuses[indexPath.row];
    StatusLayout *layout = _layouts[indexPath.row];
    cell.status = status;
    cell.layout = layout;
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _statuses.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDate *startDate = [NSDate date];
    StatusLayout *layout = _layouts[indexPath.row];
    CGFloat height = layout.height;

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
