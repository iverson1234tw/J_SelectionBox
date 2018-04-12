# J_SelectionBox
A customize selection box by Josh

![image](https://github.com/iverson1234tw/J_SelectionBox/blob/master/J_Box.png?raw=true)

## J_SelectionBox information
J_SelectionBox supports iOS 8 and above.

## How to use J_SelectionBox
* Drag the "Class" folder into your project

Next:
```objective-c
#import "J_SelectionBox.h"
```

Simple Usage:
```objective-c
  J_SelectionBox *exampleBox = [[J_SelectionBox alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];  
  
  [self.view addSubview:exampleBox];
```

## Properties
```objective-c
@property (strong, nonatomic) UIButton *upperBtn; // 上按鈕
@property (strong, nonatomic) UILabel *middleLabel; // 中間Label
@property (strong, nonatomic) UIButton *downerBtn; // 下按鈕

@property (nonatomic) int startedNum; // 初始數值
@property (nonatomic) BOOL hideLowerArrowWhenZero; // 當數值為0，下箭頭隱藏
@property (nonatomic) BOOL allowNegativeNumber; // 允許負數
@property (strong, nonatomic) UIColor *upperBtnImgColor; // 設定上方箭頭顏色
@property (strong, nonatomic) UIColor *dowerBtnImgColor; // 設定下方箭頭顏色
@property (strong, nonatomic) UIColor *middleTextColor; // 中間文字顏色
@property (strong, nonatomic) UIColor *middleLabelBackgroundColor; // 中間背景色
@property (strong, nonatomic) UIColor *upperBtnBackgroundColor; // 上按鈕背景色
@property (strong, nonatomic) UIColor *downerBtnBackgroundColor; // 下按鈕背景色

@property (nonatomic) BOOL enableLongPress; // 是否開啟長按快速加減功能
@property (nonatomic, assign) CGFloat longPressDurationTime; // 長按的加減時間間隔，預設0.01秒

#pragma mark - 介紹導覽列 -

@property (nonatomic, assign) J_IntroduceLabelPosition j_introPositon; // 導覽列位置
@property (nonatomic) BOOL showIntroduceLabel; // 使否顯示介紹導覽列
@property (strong, nonatomic) UILabel *introduceLabel; // 介紹導覽列
```

## Delegate Method
```objective-c
@property (nonatomic,weak)id<J_SelectionBoxDelegate>delegate;
```

Detect when the number changed
```objective-c
@interface ViewController () <J_SelectionBoxDelegate>

#pragma mark - J_SelectionBoxDelegate -

- (void)buttonValueDidChange:(UILabel *)label {
    
    // You can do something here when label text changed
    
}
```
