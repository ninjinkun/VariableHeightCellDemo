//
//  TwitterTimelineManager.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/13/13.
//
//

#import <Foundation/Foundation.h>
@import Accounts;
@import Social;

@interface TwitterTimelineManager : NSObject
+ (instancetype)sharedManager;
- (void)accountWithBlock:(void (^)(ACAccount *account, NSError *error))block;
- (NSURLSession *)getTimelineWithBlock:(void (^)(NSArray *statuses, NSError *error))block;
@end
