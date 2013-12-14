//
//  ManualLayoutCell.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import <Foundation/Foundation.h>
@class Status;
@class StatusLayout;
@interface ManualLayoutCell : UITableViewCell
@property (nonatomic) UILabel *userDescriptionLabel;
@property (nonatomic) UILabel *statusLabel;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) Status *status;
@property (nonatomic) StatusLayout *layout;
+ (NSString *)reuseIdentifier;
@end
