//
//  Status.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/13/13.
//
//

#import <Foundation/Foundation.h>

@interface Status : NSObject
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *userDescription;

- (id)initWithAttributes:(NSDictionary *)attributes;
@end
