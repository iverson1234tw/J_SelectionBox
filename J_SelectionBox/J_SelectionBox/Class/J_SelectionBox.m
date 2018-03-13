//
//  J_SelectionBox.m
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import "J_SelectionBox.h"

@implementation J_SelectionBox

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _upperBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        [_upperBtn setBackgroundColor:self.backgroundColor];
        [_upperBtn addTarget:self action:@selector(numberChange:) forControlEvents:UIControlEventTouchUpInside];
        _upperBtn.tag = 1;
        [self addSubview:_upperBtn];
        
        UIImageView *upArrow = [[UIImageView alloc]initWithFrame:CGRectMake(_upperBtn.frame.size.width/2 - 10, _upperBtn.frame.size.height/2 - 10, 20, 20)];
        upArrow.contentMode = UIViewContentModeScaleAspectFit;
        upArrow.image = [UIImage imageNamed:@"icon_keyboard_arrow_up_grey72.png"];
        upArrow.userInteractionEnabled = NO;
        
        [_upperBtn addSubview:upArrow];
        
        _middleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _upperBtn.frame.origin.y + _upperBtn.frame.size.height, frame.size.width, frame.size.height - 60)];
        _middleLabel.textColor = [UIColor colorWithRed:3.0/255.0 green:108.0/255.0 blue:129.0/255.0 alpha:1.0];
        _middleLabel.font = [UIFont fontWithName:@"Verdana" size:25];
        [_middleLabel setTextAlignment:NSTextAlignmentCenter];
        [_middleLabel setText:[NSString stringWithFormat:@"%i",_startedNum]];
        
        [self addSubview:_middleLabel];
        
        _downerBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, _middleLabel.frame.origin.y + _middleLabel.frame.size.height, frame.size.width, _upperBtn.frame.size.height)];
        [_downerBtn setBackgroundColor:self.backgroundColor];
        _downerBtn.tag = 2;
        [_downerBtn addTarget:self action:@selector(numberChange:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_downerBtn];
        
        UIImageView *downArrow = [[UIImageView alloc]initWithFrame:CGRectMake(_downerBtn.frame.size.width/2 - 10, _downerBtn.frame.size.height/2 - 10, 20, 20)];
        downArrow.contentMode = UIViewContentModeScaleAspectFit;
        downArrow.image = [UIImage imageNamed:@"icon_keyboard_arrow_down_grey72.png"];
        downArrow.userInteractionEnabled = NO;
        
        [_downerBtn addSubview:downArrow];
        
    }
    
    return self;
}

- (void)numberChange:(UIButton *)sender {
    
    _startedNum = [[_middleLabel text] intValue];
    
    if (sender.tag == 1) {
        
        _startedNum = _startedNum + 1;
        
    } else {
        
        _startedNum = _allowNegativeNumber ? _startedNum - 1 : (_startedNum == 0 ? _startedNum : _startedNum - 1);
        
    }
    
    [_downerBtn setHidden:_hideLowerArrowWhenZero ? (_startedNum == 0 ? YES : NO) : NO];
    [_middleLabel setText:[NSString stringWithFormat:@"%i",_startedNum]];
    [self changeValue:_middleLabel];
    
}

- (void)setHideLowerArrowWhenZero:(BOOL)hideLowerArrowWhenZero {
    
    if (_hideLowerArrowWhenZero != hideLowerArrowWhenZero) {
        
        _hideLowerArrowWhenZero = hideLowerArrowWhenZero;
        
        [_downerBtn setHidden:_hideLowerArrowWhenZero ? (_startedNum == 0 ? YES : NO) : NO];
        
    }
    
}

- (void)setAllowNegativeNumber:(BOOL)allowNegativeNumber {
    
    if (_allowNegativeNumber != allowNegativeNumber) {
        
        _allowNegativeNumber = allowNegativeNumber;
        
    }
    
}

#pragma mark - Delegate -

- (void)changeValue:(UILabel *)label {
    
    if ([self.delegate respondsToSelector:@selector(buttonValueDidChange:)]) {
        
        [self.delegate buttonValueDidChange:label];
        
    }
    
}

@end
