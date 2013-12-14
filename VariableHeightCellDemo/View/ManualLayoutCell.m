//
//  ManualLayoutCell.m
//  VariableHeightCellDemo
//
//  Created by 浅野 慧 on 12/14/13.
//
//

#import "ManualLayoutCell.h"
#import "Status.h"
#import "StatusLayout.h"
@implementation ManualLayoutCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        static const CGFloat TITLE_FONT_SIZE = 16.f;
        static const CGFloat USER_DESCRIPTION_FONT_SIZE = 11.f;
        static const CGFloat STATUS_FONT_SIZE = 11.f;

        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:TITLE_FONT_SIZE];
        [self.contentView addSubview:self.nameLabel];
        self.userDescriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.userDescriptionLabel.textColor = [UIColor darkGrayColor];
        self.userDescriptionLabel.font = [UIFont systemFontOfSize:USER_DESCRIPTION_FONT_SIZE];
        self.userDescriptionLabel.numberOfLines = 0;
        [self.contentView addSubview:self.userDescriptionLabel];
        self.statusLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.statusLabel.font = [UIFont systemFontOfSize:STATUS_FONT_SIZE];
        self.statusLabel.numberOfLines = 0;
        [self.contentView addSubview:self.statusLabel];
    }
    return self;
}

-(void)setStatus:(Status *)status
{
    _status = status;
    self.nameLabel.text = status.name;
    self.userDescriptionLabel.text = status.userDescription;
    self.statusLabel.text = status.status;
    [self setNeedsLayout];
}

- (void)setLayout:(StatusLayout *)layout
{
    _layout = layout;
    [self setNeedsLayout];
}

- (void)setNeedsLayout
{
    [super setNeedsLayout];
    self.nameLabel.frame = _layout.nameRect;
    self.userDescriptionLabel.frame = _layout.userDescrtiptionRect;
    self.statusLabel.frame = _layout.statusRect;
}

+ (NSString *)reuseIdentifier
{
    return @"ManualLayoutCell";
}

@end
