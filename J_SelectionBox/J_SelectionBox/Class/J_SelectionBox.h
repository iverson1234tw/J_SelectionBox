//
//  J_SelectionBox.h
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//



#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, J_IntroduceLabelPosition)
{
    J_IntroduceLabelAtTop = 0,
    J_IntroduceLabelAtBottom
};

@protocol J_SelectionBoxDelegate <NSObject>

@optional

- (void)buttonValueDidChange:(UILabel *)label;

@end

@interface J_SelectionBox : UIView

@property (nonatomic,weak)id<J_SelectionBoxDelegate>delegate;

@property (strong, nonatomic) UIButton *upperBtn;
@property (strong, nonatomic) UILabel *middleLabel;
@property (strong, nonatomic) UIButton *downerBtn;

@property (nonatomic) int startedNum; // 初始化數值
@property (nonatomic) BOOL hideLowerArrowWhenZero; // 當數值為0，下箭頭隱藏
@property (nonatomic) BOOL allowNegativeNumber; // 允許負數
@property (strong, nonatomic) UIColor *upperBtnImgColor; // 設定上方箭頭顏色
@property (strong, nonatomic) UIColor *dowerBtnImgColor; // 設定下方箭頭顏色
@property (strong, nonatomic) UIColor *middleTextColor; // 中間文字顏色
@property (strong, nonatomic) UIColor *middleLabelBackgroundColor; // 中間背景色
@property (strong, nonatomic) UIColor *upperBtnBackgroundColor; // 上按鈕背景色
@property (strong, nonatomic) UIColor *downerBtnBackgroundColor; // 下按鈕背景色

#pragma mark - 長按加減 -
@property (nonatomic) BOOL enableLongPress; // 是否開啟長按快速加減功能
@property (nonatomic, assign) CGFloat longPressDurationTime; // 長按的加減時間間隔

#pragma mark - 介紹導覽列 -

@property (nonatomic, assign) J_IntroduceLabelPosition j_introPositon;
@property (nonatomic) BOOL showIntroduceLabel;
@property (strong, nonatomic) UILabel *introduceLabel;

@end
