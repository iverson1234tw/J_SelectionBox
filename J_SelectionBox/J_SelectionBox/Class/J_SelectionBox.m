//
//  J_SelectionBox.m
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import "J_SelectionBox.h"

@implementation J_SelectionBox {
    UIImageView *upArrow;
    UIImageView *downArrow;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _upperBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        [_upperBtn setBackgroundColor:self.backgroundColor];
        [_upperBtn addTarget:self action:@selector(numberChange:) forControlEvents:UIControlEventTouchUpInside];
        _upperBtn.tag = 1;
        [self addSubview:_upperBtn];
        
        upArrow = [[UIImageView alloc]initWithFrame:CGRectMake(_upperBtn.frame.size.width/2 - 10, _upperBtn.frame.size.height/2 - 10, 20, 20)];
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
        
        downArrow = [[UIImageView alloc]initWithFrame:CGRectMake(_downerBtn.frame.size.width/2 - 10, _downerBtn.frame.size.height/2 - 10, 20, 20)];
        downArrow.contentMode = UIViewContentModeScaleAspectFit;
        downArrow.image = [UIImage imageNamed:@"icon_keyboard_arrow_down_grey72.png"];
        downArrow.userInteractionEnabled = NO;
        
        [_downerBtn addSubview:downArrow];
        
    }
    
    return self;
}

#pragma mark - 設置下方說明Label -

- (void)setIntroduceLabelWithText:(NSString *)text withTextColor:(UIColor *)textC withBackgroundColor:(UIColor *)backC atPosition:(J_IntroduceLabelPosition)position {

    if (position == J_IntroduceLabelAtTop) {
        
        UILabel *introLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, -30, self.frame.size.width, 30)];
        introLabel.backgroundColor = backC;
        introLabel.textColor = textC;
        introLabel.text = text;
        introLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:introLabel];
        
    } else {
        
        UILabel *introLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height, self.frame.size.width, 30)];
        introLabel.backgroundColor = backC;
        introLabel.textColor = textC;
        introLabel.text = text;
        introLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:introLabel];
        
    }
    
}

- (void)setStartedNum:(int)startedNum {
    
    if (_startedNum != startedNum) {
        
        _startedNum = startedNum;
        
        [_middleLabel setText:[NSString stringWithFormat:@"%i",_startedNum]];
        
    }
    
}

- (void)setUpperBtnImgColor:(UIColor *)upperBtnImgColor {
    
    UIImage *image = [UIImage imageNamed:@"icon_keyboard_arrow_up_grey72.png"];
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [upperBtnImgColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    upArrow.image = flippedImage;
    
}

- (void)setDowerBtnImgColor:(UIColor *)dowerBtnImgColor {
    
    UIImage *image = [UIImage imageNamed:@"icon_keyboard_arrow_down_grey72.png"];
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [dowerBtnImgColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    downArrow.image = flippedImage;
    
}

- (void)setMiddleTextColor:(UIColor *)middleTextColor {
    
    if (_middleLabel.textColor != middleTextColor) {
        
        _middleLabel.textColor = middleTextColor;
        
    }
    
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

#pragma mark - Delegate -

- (void)changeValue:(UILabel *)label {
    
    if ([self.delegate respondsToSelector:@selector(buttonValueDidChange:)]) {
        
        [self.delegate buttonValueDidChange:label];
        
    }
    
}

@end
