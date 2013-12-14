//
//  TwitterTimelineManager.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/13/13.
//
//

#import "TwitterTimelineManager.h"
#import "Status.h"
@implementation TwitterTimelineManager {
    NSOperationQueue *_queue;
    ACAccount *_account;
}

+ (instancetype)sharedManager
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc] init];
    }
    return self;
}

- (void)accountWithBlock:(void (^)(ACAccount *account, NSError *error))block
{
    if (_account) {
        if (block) {
            block(_account, nil);
        }
        return;
    }
    ACAccountStore *accountStore = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [accountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [accountStore
     requestAccessToAccountsWithType:accountType
     options:nil
     completion:^(BOOL granted, NSError *error) {
         if (granted) {
             NSArray *accounts = [accountStore accountsWithAccountType:accountType];
             if (accounts.count > 0) {
                 _account = accounts[0];
                 if (block) {
                     block(_account, nil);
                 }
             }
         }
         if (error) {
             if (block) {
                 block(nil, error);
             }
         }
     }];
}

- (NSURLSession *)getTimelineWithBlock:(void (^)(NSArray *statuses, NSError *error))block
{

    NSString *url = @"https://api.twitter.com/1.1/search/tweets.json";
    SLRequest *req = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:url] parameters:@{ @"q" : @"cocoa_kansai", @"count" : @"100" }];
    req.account = _account;
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:req.preparedURLRequest
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (!error) {
                    NSError *jsonError;
                    NSArray *rawStatuses = [NSJSONSerialization  JSONObjectWithData:data options:0 error:&jsonError];
                    NSMutableArray *statuses = [@[] mutableCopy];
                    [[rawStatuses valueForKeyPath:@"statuses"] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                        [statuses addObject:[[Status alloc] initWithAttributes:obj]];
                    }];
                    if (block) {
                        block([statuses copy], nil);
                    }
                }
                else {
                    if (block) {
                        block(nil, error);
                    }
                }

    }] resume];
    return session;
}


@end
