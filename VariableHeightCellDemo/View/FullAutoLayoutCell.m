//
//  AutoLayoutOnlyCell.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/13/13.
//
//

#import "FullAutoLayoutCell.h"
#import "Status.h"
@implementation FullAutoLayoutCell

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
    static FullAutoLayoutCell *cell;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [[self nib] instantiateWithOwner:nil options:nil][0];
    });
    cell.status = status;
    [cell layoutIfNeeded];
    return cell.baseView.frame.size.height;
}

+ (NSString *)reuseIdentifier
{
    return @"FullAutoLayoutCell";
}

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"FullAutoLayoutCell" bundle:nil];
}

@end
