//
//  PartialAutoLayoutCell.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import <UIKit/UIKit.h>
@class Status;
@interface ConstantAutoLayoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *nameUserDescriptionConstraint;
@property (weak, nonatomic) IBOutlet UILabel *userDescriptionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *userDescriptionStatusConstraint;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint; // row priority
@property (nonatomic) Status *status;
+ (CGFloat)heightForStatus:(Status *)status forWidth:(CGFloat)width;
+ (NSString *)reuseIdentifier;
+ (UINib *)nib;
@end
