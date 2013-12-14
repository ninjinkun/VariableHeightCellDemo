//
//  StatusLayout.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import "StatusLayout.h"
#import "Status.h"

@implementation StatusLayout

- (void)caluculateLayoutWithStatus:(Status *)status forWidth:(CGFloat)width
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

    CGRect nameRect = [status.name boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE], } context:nil];
    nameRect.origin = CGPointMake(LEFT_MARGIN, y);
    self.nameRect = nameRect;

    y += nameRect.size.height;
    y += NAME_USER_DESCRIPTION_MARGIN;

    CGRect userDescrtiptionRect = [status.userDescription boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:USER_DESCRIPTION_FONT_SIZE] } context:nil];
    userDescrtiptionRect.origin = CGPointMake(LEFT_MARGIN, y);
    self.userDescrtiptionRect = userDescrtiptionRect;

    y += userDescrtiptionRect.size.height;
    y += USER_DESCRIPTION_STATUS_MARGIN;

    CGRect statusRect = [status.status boundingRectWithSize:CGSizeMake(contentWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:STATUS_FONT_SIZE] } context:nil];
    statusRect.origin = CGPointMake(LEFT_MARGIN, y);
    self.statusRect = statusRect;

    y += statusRect.size.height;
    y += BOTTOM_MARGIN;

    self.height = y;
}

@end
