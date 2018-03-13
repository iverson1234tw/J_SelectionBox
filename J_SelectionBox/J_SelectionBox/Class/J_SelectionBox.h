//
//  J_SelectionBox.h
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol J_SelectionBoxDelegate <NSObject>

@optional

- (void)buttonValueDidChange:(UILabel *)label;

@end

@interface J_SelectionBox : UIView

@property (strong, nonatomic) UIButton *upperBtn;
@property (strong, nonatomic) UILabel *middleLabel;
@property (strong, nonatomic) UIButton *downerBtn;

@property (nonatomic) BOOL hideLowerArrowWhenZero; // 當數值為0，下箭頭隱藏
@property (nonatomic) BOOL allowNegativeNumber; // 允許負數

@property (nonatomic) int startedNum;

@property (nonatomic,weak)id<J_SelectionBoxDelegate>delegate;

@end
