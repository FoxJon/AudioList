//
//  ALAiPadTableViewCell.m
//  AudioList
//
//  Created by Jonathan Fox on 5/8/14.
//  Copyright (c) 2014 Jon Fox. All rights reserved.
//

#import "ALATableViewCell.h"
#import "ALAData.h"

@implementation ALATableViewCell
{
    UILabel * name;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        name = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 30)];
    //    name.text = @"NAME";
        name.textColor = [UIColor darkGrayColor];
        name.font = [UIFont systemFontOfSize: 20];
        
        [self.contentView addSubview:name];
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setIndex:(NSInteger)index
{
    _index = index;

    NSDictionary * albumInfo = [[ALAData MainData] allListItems][index];
    
    name.text = albumInfo[@"Album Name"];
}

@end
