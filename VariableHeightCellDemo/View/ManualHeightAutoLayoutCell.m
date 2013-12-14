//
//  ManualHeightAutoLayoutCell.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import "ManualHeightAutoLayoutCell.h"
#import "Status.h"
@implementation ManualHeightAutoLayoutCell

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
    static const CGFloat TOP_MARGIN = 12.f;
    static const CGFloat LEFT_MARGIN = 12.f;
    static const CGFloat RIGHT_MARING = 12.f;
    static const CGFloat BOTTOM_MARGIN = 12.f;
    static const CGFloat NAME_USER_DESCRIPTION_MARGIN = 12.f;
    static const CGFloat USER_DESCRIPTION_STATUS_MARGIN = 12.f;
    static const CGFloat TITLE_FONT_SIZE = 16.f;
    static const CGFloat USER_DESCRIPTION_FONT_SIZE = 11.f;
    static const CGFloat STATUS_FONT_SIZE = 11.f;
    
    CGFloat contentWidth = width - LEFT_MARGIN - RIGHT_MARING;

    CGFloat y = TOP_MARGIN;

    CGRect nameRect = [status.name boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE] } context:nil];

    y += nameRect.size.height;
    y += NAME_USER_DESCRIPTION_MARGIN;

    CGRect userDescriptionRect = [status.userDescription boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:USER_DESCRIPTION_FONT_SIZE] } context:nil];

    y += userDescriptionRect.size.height;
    y += USER_DESCRIPTION_STATUS_MARGIN;

    CGRect statusRect = [status.status boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:STATUS_FONT_SIZE] } context:nil];

    y += statusRect.size.height;
    y += BOTTOM_MARGIN;
    
    return y;
}


+ (NSString *)reuseIdentifier
{
    return @"ManualHeightAutoLayoutCell";
}

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"ManualHeightAutoLayoutCell" bundle:nil];
}

@end
