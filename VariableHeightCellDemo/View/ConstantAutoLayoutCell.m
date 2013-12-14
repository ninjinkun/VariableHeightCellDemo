//
//  PartialAutoLayoutCell.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import "ConstantAutoLayoutCell.h"
#import "Status.h"
@implementation ConstantAutoLayoutCell

-(void)setStatus:(Status *)status
{
    _status = status;
    self.nameLabel.text = status.name;
    self.userDescriptionLabel.text = status.userDescription;
    self.statusLabel.text = status.status;
    [self setNeedsLayout];
}

+ (CGFloat)heightForStatus:(Status *)status forWidth:(CGFloat)width
{
    static ConstantAutoLayoutCell *cell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [[self nib] instantiateWithOwner:nil options:nil][0];
    });

    CGFloat y = cell.topConstraint.constant;

    CGRect nameRect = [status.name boundingRectWithSize:CGSizeMake(cell.nameLabel.bounds.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : cell.nameLabel.font } context:nil];

    y += nameRect.size.height;
    y += cell.nameUserDescriptionConstraint.constant;

    CGRect userDescriptionRect = [status.userDescription boundingRectWithSize:CGSizeMake(cell.userDescriptionLabel.bounds.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : cell.userDescriptionLabel.font } context:nil];

    y += userDescriptionRect.size.height;
    y += cell.userDescriptionStatusConstraint.constant;

    CGRect statusRect = [status.status boundingRectWithSize:CGSizeMake(cell.statusLabel.bounds.size.width, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : cell.statusLabel.font } context:nil];
    
    y += statusRect.size.height;
    y += cell.bottomConstraint.constant;

    return y;
}

+ (NSString *)reuseIdentifier
{
    return @"ConstantAutoLayoutCell";
}

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"ConstantAutoLayoutCell" bundle:nil];
}

@end
