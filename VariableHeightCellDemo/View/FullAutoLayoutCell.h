//
//  AutoLayoutOnlyCell.h
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/13/13.
//
//

#import <UIKit/UIKit.h>
@class Status;
@interface FullAutoLayoutCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (nonatomic) Status *status;

+ (CGFloat)heightForStatus:(Status *)status forWidth:(CGFloat)width;
+ (UINib *)nib;
+ (NSString *)reuseIdentifier;
@end
