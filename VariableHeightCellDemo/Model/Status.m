//
//  Status.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/13/13.
//
//

#import "Status.h"

@implementation Status

- (id)initWithAttributes:(NSDictionary *)attributes
{
    self = [super init];

    if (self) {
        self.name = [attributes valueForKeyPath:@"user.name"];
        self.userDescription = [attributes valueForKeyPath:@"user.description"];
        self.status = attributes[@"text"];
    }
    return self;
}

@end
