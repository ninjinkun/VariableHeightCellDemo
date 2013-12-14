//
//  ManualHeightAutoLayoutCell.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import <UIKit/UIKit.h>

@class Status;
@interface ManualHeightAutoLayoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic) Status *status;
+ (CGFloat)heightForStatus:(Status *)status forWidth:(CGFloat)width;
+ (NSString *)reuseIdentifier;
+ (UINib *)nib;
@end
