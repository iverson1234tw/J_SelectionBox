//
//  J_SelectionBox.m
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import "J_SelectionBox.h"

@implementation J_SelectionBox {
    NSTimer *timer; // 快速加減定時器
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

- (void)addLongPressGestureToBtn {
    
    UILongPressGestureRecognizer *upLongPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(upLongPress:)];
    UILongPressGestureRecognizer *downLongPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(downLongPress:)];
    
    [_upperBtn addGestureRecognizer:upLongPress];
    [_downerBtn addGestureRecognizer:downLongPress];
    
    _longPressDurationTime = 0.01; // 預設0.01秒
    
}

- (void)setEnableLongPress:(BOOL)enableLongPress {
    
    if (_enableLongPress != enableLongPress) {
        
        _enableLongPress = enableLongPress;
        
        [self addLongPressGestureToBtn];
        
    }
    
}

// 單次點擊加減
- (void)numberChange:(UIButton *)sender {
    
    if (sender.tag == 1) {
        
        [self increase];
        
    } else {
        
        [self decrease];
        
    }
    
}

// 長按加
- (void)upLongPress:(UILongPressGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"Long Press Began");
        
        timer = [NSTimer scheduledTimerWithTimeInterval:_longPressDurationTime target:self selector:@selector(increase) userInfo:nil repeats:YES];
        
        [timer fire];
        
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"Long Press Stop");
        
        [timer invalidate];
        
    }
    
}

// 長按減
- (void)downLongPress:(UILongPressGestureRecognizer *)gesture {
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        
        NSLog(@"Long Press Began");
        
        timer = [NSTimer scheduledTimerWithTimeInterval:_longPressDurationTime target:self selector:@selector(decrease) userInfo:nil repeats:YES];
        
        [timer fire];
        
    }
    
    if (gesture.state == UIGestureRecognizerStateEnded) {
        
        NSLog(@"Long Press Stop");
        
        [timer invalidate];
        
    }
    
}

#pragma mark - 加減邏輯 -

- (void)increase {
    
    _startedNum = [[_middleLabel text] intValue];
    
    _startedNum = _startedNum + 1;
    
    [_middleLabel setText:[NSString stringWithFormat:@"%i",_startedNum]];
    [self changeValue:_middleLabel];
    
}

- (void)decrease {
    
    _startedNum = [[_middleLabel text] intValue];
    
    _startedNum = _allowNegativeNumber ? _startedNum - 1 : (_startedNum == 0 ? _startedNum : _startedNum - 1);
    
    // 當 _hideLowerArrowWhenZero == true , 歸零時要隱藏下按鈕
    [_downerBtn setHidden:_hideLowerArrowWhenZero ? (_startedNum == 0 ? YES : NO) : NO];
    [_middleLabel setText:[NSString stringWithFormat:@"%i",_startedNum]];
    [self changeValue:_middleLabel];
    
}

- (void)setLongPressDurationTime:(CGFloat)longPressDurationTime {
    
    if (_longPressDurationTime != longPressDurationTime) {
        
        _longPressDurationTime = longPressDurationTime;
        
    }
    
}

#pragma mark - 設置上/下介紹文字 -

- (void)setShowIntroduceLabel:(BOOL)showIntroduceLabel {
    
    if (_showIntroduceLabel != showIntroduceLabel) {
        
        _showIntroduceLabel = showIntroduceLabel;
        
        [self setIntro];
        
    }
    
}

- (void)setIntro {
    
    if (_showIntroduceLabel) {
        
        [_introduceLabel removeFromSuperview];
        
        _introduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _j_introPositon == J_IntroduceLabelAtTop ? _upperBtn.frame.origin.y - 30 : _downerBtn.frame.origin.y + _downerBtn.frame.size.height, self.frame.size.width, 30)];
        _introduceLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_introduceLabel];
        
    } else {
        
        [_introduceLabel removeFromSuperview];
        
    }
    
}

- (void)setJ_introPositon:(J_IntroduceLabelPosition)j_introPositon {
    
    if (_j_introPositon != j_introPositon) {
        
        _j_introPositon = j_introPositon;
        
        [self setIntro];
        
    }
    
}

- (void)setIntroduceLabel:(UILabel *)introduceLabel {
    
    _introduceLabel = introduceLabel;
    
}

- (void)setStartedNum:(int)startedNum {
    
    if (_startedNum != startedNum) {
        
        _startedNum = startedNum;
        
        [_middleLabel setText:[NSString stringWithFormat:@"%i",_startedNum]];
        
    }
    
}

- (void)setUpperBtnImgColor:(UIColor *)upperBtnImgColor {
    
    upArrow.image = [self setImage:[UIImage imageNamed:@"icon_keyboard_arrow_up_grey72.png"] withColor:upperBtnImgColor];
    
}

- (void)setDowerBtnImgColor:(UIColor *)dowerBtnImgColor {
    
    downArrow.image = [self setImage:[UIImage imageNamed:@"icon_keyboard_arrow_down_grey72.png"] withColor:dowerBtnImgColor];
    
}

- (void)setMiddleTextColor:(UIColor *)middleTextColor {
    
    if (_middleLabel.textColor != middleTextColor) {
        
        _middleLabel.textColor = middleTextColor;
        
    }
    
}

- (void)setMiddleLabelBackgroundColor:(UIColor *)middleLabelBackgroundColor {
    
    if (_middleLabel.backgroundColor != middleLabelBackgroundColor) {
        
        _middleLabel.backgroundColor = middleLabelBackgroundColor;
        
    }
    
}

- (void)setUpperBtnBackgroundColor:(UIColor *)upperBtnBackgroundColor {
    
    if (_upperBtn.backgroundColor != upperBtnBackgroundColor) {
     
        _upperBtn.backgroundColor = upperBtnBackgroundColor;
     
    }
    
}

- (void)setDownerBtnBackgroundColor:(UIColor *)downerBtnBackgroundColor {
    
    if (_downerBtn.backgroundColor != downerBtnBackgroundColor) {
        
        _downerBtn.backgroundColor = downerBtnBackgroundColor;
        
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
        
        _startedNum = _startedNum < 0 ? 0 : _startedNum;
        _middleLabel.text = [NSString stringWithFormat:@"%i",_startedNum];
        
    }
    
}

#pragma mark - Delegate -

- (void)changeValue:(UILabel *)label {
    
    if ([self.delegate respondsToSelector:@selector(buttonValueDidChange:)]) {
        
        [self.delegate buttonValueDidChange:label];
        
    }
    
}

#pragma mark - UsefulMethod -

- (UIImage *)setImage:(UIImage *)setImg withColor:(UIColor *)color {
    
    UIImage *image = setImg;
    
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClipToMask(context, rect, image.CGImage);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIImage *flippedImage = [UIImage imageWithCGImage:img.CGImage
                                                scale:1.0 orientation: UIImageOrientationDownMirrored];
    
    return flippedImage;
}

@end
