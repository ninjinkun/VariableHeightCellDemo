//
//  StatusLayout.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import <Foundation/Foundation.h>
@class Status;
@interface StatusLayout : NSObject
@property (nonatomic) CGRect nameRect;
@property (nonatomic) CGRect userDescrtiptionRect;
@property (nonatomic) CGRect statusRect;
@property (nonatomic) CGFloat height;

- (void)caluculateLayoutWithStatus:(Status *)status forWidth:(CGFloat)width;
@end
