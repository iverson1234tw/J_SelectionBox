//
//  OptionalCell.m
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import "OptionalCell.h"

@implementation OptionalCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _backView = [UIView new];
        
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
}

- (void)initialize {
    
    _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    _backView.backgroundColor = [UIColor whiteColor];
    
    [self.contentView addSubview:_backView];
    
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15, _backView.frame.size.height/2 - 15, _backView.frame.size.width/2 + 50, 30)];
    _titleLabel.font = [UIFont fontWithName:@"Helvetica-Light" size:15.0];
    _titleLabel.textColor = [UIColor darkGrayColor];
    
    [_backView addSubview:_titleLabel];
    
    _swithControl = [[UISegmentedControl alloc]initWithItems:@[@"OFF",@"ON"]];
    _swithControl.frame = CGRectMake(_backView.frame.size.width - 115, _titleLabel.frame.origin.y, 100, _titleLabel.frame.size.height);
    _swithControl.tintColor = [UIColor darkGrayColor];
    
    [_backView addSubview:_swithControl];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
    
}

@end
