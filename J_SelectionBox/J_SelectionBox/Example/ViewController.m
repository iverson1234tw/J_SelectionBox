//
//  ViewController.m
//  J_SelectionBox
//
//  Created by iverson1234tw on 2018/3/13.
//  Copyright © 2018年 JoshChen. All rights reserved.
//

#import "ViewController.h"
#import "J_SelectionBox.h"
#import "OptionalCell.h"
#import "ColorCell.h"
#import "NoneCell.h"

@interface ViewController () <J_SelectionBoxDelegate, UITableViewDelegate, UITableViewDataSource> {
    J_SelectionBox *exampleBox1;
    J_SelectionBox *exampleBox2;
    J_SelectionBox *exampleBox3;
    J_SelectionBox *exampleBox4;
}
@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController {
    UIView *headerView;
    UISegmentedControl *headerSegment;
    NSArray *headerGrop;
    OptionalCell *opCell;
    ColorCell *colorCell;
    NoneCell *noneCell;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    [self setBoxes];
    
    headerGrop = [[NSArray alloc] initWithObjects:exampleBox1,exampleBox2,exampleBox3,exampleBox4, nil];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, exampleBox1.frame.origin.y + exampleBox1.frame.size.height + 40, SCREEN_WIDTH, SCREEN_HEIGHT - _navBar.frame.size.height - exampleBox1.frame.size.height - 50) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

- (void)setBoxes {
    
    // 範例一
    exampleBox1 = [[J_SelectionBox alloc]initWithFrame:CGRectMake(0, _navBar.frame.origin.y + _navBar.frame.size.height + 10, ceilf(SCREEN_WIDTH/4), 120)];
    exampleBox1.delegate = self;
    exampleBox1.hideLowerArrowWhenZero = false;
    exampleBox1.allowNegativeNumber = true;
    exampleBox1.upperBtnBackgroundColor = J_Gray;
    exampleBox1.downerBtnBackgroundColor = J_Gray;
    exampleBox1.middleLabelBackgroundColor = [UIColor whiteColor];
    exampleBox1.upperBtnImgColor = [UIColor whiteColor];
    exampleBox1.dowerBtnImgColor = [UIColor whiteColor];
    exampleBox1.middleTextColor = [UIColor blackColor];
    exampleBox1.showIntroduceLabel = true;
    exampleBox1.j_introPositon = J_IntroduceLabelAtBottom;
    exampleBox1.introduceLabel.backgroundColor = [UIColor blackColor];
    exampleBox1.introduceLabel.text = @"Box1";
    exampleBox1.introduceLabel.textColor = [UIColor whiteColor];
    exampleBox1.enableLongPress = true;
    
    [self.view addSubview:exampleBox1];
    
    // 範例二
    exampleBox2 = [[J_SelectionBox alloc]initWithFrame:CGRectMake(exampleBox1.frame.origin.x + exampleBox1.frame.size.width, exampleBox1.frame.origin.y, exampleBox1.frame.size.width, exampleBox1.frame.size.height)];
    exampleBox2.delegate = self;
    exampleBox2.hideLowerArrowWhenZero = false;
    exampleBox2.allowNegativeNumber = true;
    exampleBox2.upperBtnBackgroundColor = [UIColor lightGrayColor];
    exampleBox2.downerBtnBackgroundColor = [UIColor lightGrayColor];
    exampleBox2.middleLabelBackgroundColor = [UIColor whiteColor];
    exampleBox2.upperBtnImgColor = [UIColor whiteColor];
    exampleBox2.dowerBtnImgColor = [UIColor whiteColor];
    exampleBox2.middleTextColor = [UIColor blackColor];
    exampleBox2.showIntroduceLabel = true;
    exampleBox2.j_introPositon = J_IntroduceLabelAtBottom;
    exampleBox2.introduceLabel.backgroundColor = [UIColor grayColor];
    exampleBox2.introduceLabel.text = @"Box2";
    exampleBox2.introduceLabel.textColor = [UIColor whiteColor];
    exampleBox2.enableLongPress = true;
    
    [self.view addSubview:exampleBox2];
    
    // 範例三
    exampleBox3 = [[J_SelectionBox alloc]initWithFrame:CGRectMake(exampleBox2.frame.origin.x + exampleBox2.frame.size.width, exampleBox2.frame.origin.y, exampleBox2.frame.size.width, exampleBox2.frame.size.height)];
    exampleBox3.delegate = self;
    exampleBox3.hideLowerArrowWhenZero = false;
    exampleBox3.allowNegativeNumber = true;
    exampleBox3.upperBtnBackgroundColor = [UIColor grayColor];
    exampleBox3.downerBtnBackgroundColor = [UIColor grayColor];
    exampleBox3.middleLabelBackgroundColor = [UIColor whiteColor];
    exampleBox3.upperBtnImgColor = [UIColor whiteColor];
    exampleBox3.dowerBtnImgColor = [UIColor whiteColor];
    exampleBox3.middleTextColor = [UIColor blackColor];
    exampleBox3.showIntroduceLabel = true;
    exampleBox3.j_introPositon = J_IntroduceLabelAtBottom;
    exampleBox3.introduceLabel.backgroundColor = [UIColor lightGrayColor];
    exampleBox3.introduceLabel.text = @"Box3";
    exampleBox3.introduceLabel.textColor = [UIColor whiteColor];
    exampleBox3.enableLongPress = true;
    
    [self.view addSubview:exampleBox3];
    
    // 範例四
    exampleBox4 = [[J_SelectionBox alloc]initWithFrame:CGRectMake(exampleBox3.frame.origin.x + exampleBox3.frame.size.width, exampleBox3.frame.origin.y, exampleBox3.frame.size.width, exampleBox3.frame.size.height)];
    exampleBox4.delegate = self;
    exampleBox4.hideLowerArrowWhenZero = false;
    exampleBox4.allowNegativeNumber = true;
    exampleBox4.upperBtnBackgroundColor = [UIColor blackColor];
    exampleBox4.downerBtnBackgroundColor = [UIColor blackColor];
    exampleBox4.middleLabelBackgroundColor = [UIColor whiteColor];
    exampleBox4.upperBtnImgColor = [UIColor whiteColor];
    exampleBox4.dowerBtnImgColor = [UIColor whiteColor];
    exampleBox4.middleTextColor = [UIColor blackColor];
    exampleBox4.showIntroduceLabel = true;
    exampleBox4.j_introPositon = J_IntroduceLabelAtBottom;
    exampleBox4.introduceLabel.backgroundColor = J_Gray;
    exampleBox4.introduceLabel.text = @"Box4";
    exampleBox4.introduceLabel.textColor = [UIColor whiteColor];
    exampleBox4.enableLongPress = true;
    
    [self.view addSubview:exampleBox4];
    
}

#pragma mark - J_SelectionBoxDelegate -

- (void)buttonValueDidChange:(UILabel *)label {
    
    // You can do something when label text changed
    
}

#pragma mark - UITableViewDelegate -

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 55;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (headerSegment == nil) {
        
        headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        headerView.backgroundColor = [UIColor whiteColor];
        
        headerSegment = [[UISegmentedControl alloc]initWithItems:@[@"Box1",@"Box2",@"Box3",@"Box4"]];
        headerSegment.frame = CGRectMake(10, 0, headerView.frame.size.width - 20, headerView.frame.size.height);
        headerSegment.tintColor = [UIColor grayColor];
        [headerSegment setSelectedSegmentIndex:0];
        [headerSegment addTarget:self action:@selector(headerSegChange:) forControlEvents:UIControlEventValueChanged];
        
        [headerView addSubview:headerSegment];
        
    }
    
    return headerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%ld", (long)indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    if (indexPath.row == 0) {
        
        opCell = [[OptionalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        opCell = (OptionalCell *)opCell;
        
        opCell.titleLabel.text = @"hideLowerArrowWhenZero";
        opCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        opCell.swithControl.tag = 0;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        [opCell.swithControl setSelectedSegmentIndex:box.hideLowerArrowWhenZero];
        
        [opCell.swithControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        
        return opCell;
    
    } else if (indexPath.row == 1) {
        
        opCell = [[OptionalCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        opCell = (OptionalCell *)opCell;
        
        opCell.titleLabel.text = @"allowNegativeNumber";
        opCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        opCell.swithControl.tag = 1;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        [opCell.swithControl setSelectedSegmentIndex:box.allowNegativeNumber];
        
        [opCell.swithControl addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        
        return opCell;
    
    } else if (indexPath.row == 2) {
        
        colorCell = [[ColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        colorCell = (ColorCell *)colorCell;
        
        colorCell.titleLabel.text = @"upperBtnBackgroundColor";
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        colorCell.colorLabel.backgroundColor = box.upperBtn.backgroundColor;
        
        return colorCell;
        
    } else if (indexPath.row == 3) {
        
        colorCell = [[ColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
        colorCell = (ColorCell *)colorCell;
        
        colorCell.titleLabel.text = @"downerBtnBackgroundColor";
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        colorCell.colorLabel.backgroundColor = box.downerBtn.backgroundColor;
        
        return colorCell;
        
    } else if (indexPath.row == 4) {
        
        colorCell = [[ColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell5"];
        colorCell = (ColorCell *)colorCell;
        
        colorCell.titleLabel.text = @"middleLabelBackgroundColor";
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        colorCell.colorLabel.backgroundColor = box.middleLabel.backgroundColor;
        
        return colorCell;
        
    } else if (indexPath.row == 5) {
        
        colorCell = [[ColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell6"];
        colorCell = (ColorCell *)colorCell;
        
        colorCell.titleLabel.text = @"middleTextColor";
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        colorCell.colorLabel.backgroundColor = box.middleLabel.textColor;
        
        return colorCell;
        
    } else if (indexPath.row == 6) {
        
        colorCell = [[ColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell7"];
        colorCell = (ColorCell *)colorCell;
        
        colorCell.titleLabel.text = @"introduceLabel.backgroundColor";
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        colorCell.colorLabel.backgroundColor = box.introduceLabel.backgroundColor;
        
        return colorCell;
        
    } else if (indexPath.row == 7) {
        
        colorCell = [[ColorCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell8"];
        colorCell = (ColorCell *)colorCell;
        
        colorCell.titleLabel.text = @"introduceLabel.textColor";
        colorCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        colorCell.colorLabel.backgroundColor = box.introduceLabel.textColor;
        
        return colorCell;
        
    } else if (indexPath.row == 8) {
        
        noneCell = [[NoneCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell9"];
        noneCell = (NoneCell *)noneCell;
        
        noneCell.titleLabel.text = @"j_introPositon";
        noneCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
        
        noneCell.rightLabel.text = box.j_introPositon == 0 ? @"J_IntroduceLabelAtTop" : @"J_IntroduceLabelAtBottom";
        
        return noneCell;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    NSArray *colorArr = [[NSArray alloc]initWithObjects:@"BlackColor",@"LightGrayColor",@"GrayColor",@"J_Gray", nil];
    
    J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
    
    if (indexPath.row == 2) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"upperBtnBackgroundColor" message:@"Choose Color" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        for (int i = 0; i < [colorArr count]; i ++) {
            
            UIAlertAction *colorAction = [UIAlertAction actionWithTitle:[colorArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([action.title isEqualToString:@"BlackColor"]) {
                    box.upperBtnBackgroundColor = [UIColor blackColor];
                } else if ([action.title isEqualToString:@"LightGrayColor"]) {
                    box.upperBtnBackgroundColor = [UIColor lightGrayColor];
                } else if ([action.title isEqualToString:@"GrayColor"]) {
                    box.upperBtnBackgroundColor = [UIColor grayColor];
                } else {
                    box.upperBtnBackgroundColor = J_Gray;
                }
                
                [_tableView reloadData];
                
            }];
            
            [alert addAction:colorAction];
            
        }
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 3) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"downerBtnBackgroundColor" message:@"Choose Color" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        for (int i = 0; i < [colorArr count]; i ++) {
            
            UIAlertAction *colorAction = [UIAlertAction actionWithTitle:[colorArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([action.title isEqualToString:@"BlackColor"]) {
                    box.downerBtnBackgroundColor = [UIColor blackColor];
                } else if ([action.title isEqualToString:@"LightGrayColor"]) {
                    box.downerBtnBackgroundColor = [UIColor lightGrayColor];
                } else if ([action.title isEqualToString:@"GrayColor"]) {
                    box.downerBtnBackgroundColor = [UIColor grayColor];
                } else {
                    box.downerBtnBackgroundColor = J_Gray;
                }

                [_tableView reloadData];

            }];
            
            [alert addAction:colorAction];
            
        }
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 4) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"middleLabelBackgroundColor" message:@"Choose Color" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        for (int i = 0; i < [colorArr count]; i ++) {
            
            UIAlertAction *colorAction = [UIAlertAction actionWithTitle:[colorArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([action.title isEqualToString:@"BlackColor"]) {
                    box.middleLabelBackgroundColor = [UIColor blackColor];
                } else if ([action.title isEqualToString:@"LightGrayColor"]) {
                    box.middleLabelBackgroundColor = [UIColor lightGrayColor];
                } else if ([action.title isEqualToString:@"GrayColor"]) {
                    box.middleLabelBackgroundColor = [UIColor grayColor];
                } else {
                    box.middleLabelBackgroundColor = J_Gray;
                }
                
                [_tableView reloadData];

            }];
            
            [alert addAction:colorAction];
            
        }
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 5) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"middleTextColor" message:@"Choose Color" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        for (int i = 0; i < [colorArr count]; i ++) {
            
            UIAlertAction *colorAction = [UIAlertAction actionWithTitle:[colorArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([action.title isEqualToString:@"BlackColor"]) {
                    box.middleTextColor = [UIColor blackColor];
                } else if ([action.title isEqualToString:@"LightGrayColor"]) {
                    box.middleTextColor = [UIColor lightGrayColor];
                } else if ([action.title isEqualToString:@"GrayColor"]) {
                    box.middleTextColor = [UIColor grayColor];
                } else {
                    box.middleTextColor = J_Gray;
                }
                
                [_tableView reloadData];

            }];
            
            [alert addAction:colorAction];
            
        }
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 6) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"introduceLabel.backgroundColor" message:@"Choose Color" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        for (int i = 0; i < [colorArr count]; i ++) {
            
            UIAlertAction *colorAction = [UIAlertAction actionWithTitle:[colorArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([action.title isEqualToString:@"BlackColor"]) {
                    box.introduceLabel.backgroundColor = [UIColor blackColor];
                } else if ([action.title isEqualToString:@"LightGrayColor"]) {
                    box.introduceLabel.backgroundColor = [UIColor lightGrayColor];
                } else if ([action.title isEqualToString:@"GrayColor"]) {
                    box.introduceLabel.backgroundColor = [UIColor grayColor];
                } else {
                    box.introduceLabel.backgroundColor = J_Gray;
                }
                
                [_tableView reloadData];

            }];
            
            [alert addAction:colorAction];
            
        }
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 7) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"introduceLabel.textColor" message:@"Choose Color" preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        for (int i = 0; i < [colorArr count]; i ++) {
            
            UIAlertAction *colorAction = [UIAlertAction actionWithTitle:[colorArr objectAtIndex:i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
                if ([action.title isEqualToString:@"BlackColor"]) {
                    box.introduceLabel.textColor = [UIColor blackColor];
                } else if ([action.title isEqualToString:@"LightGrayColor"]) {
                    box.introduceLabel.textColor = [UIColor lightGrayColor];
                } else if ([action.title isEqualToString:@"GrayColor"]) {
                    box.introduceLabel.textColor = [UIColor grayColor];
                } else {
                    box.introduceLabel.textColor = J_Gray;
                }
               
                [_tableView reloadData];

            }];
            
            [alert addAction:colorAction];
            
        }
        
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else if (indexPath.row == 8) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"J_IntroduceLabelPosition" message:@"Choose Position" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *topAction = [UIAlertAction actionWithTitle:@"J_IntroduceLabelAtTop" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            box.j_introPositon = J_IntroduceLabelAtTop;
        }];
        
        UIAlertAction *bottomAction = [UIAlertAction actionWithTitle:@"J_IntroduceLabelAtBottom" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            box.j_introPositon = J_IntroduceLabelAtBottom;
        }];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:topAction];
        [alert addAction:bottomAction];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
}

#pragma mark - Switch -

- (void)headerSegChange:(UISegmentedControl *)segment {
    
    [_tableView reloadData];
    
}

- (void)valueChanged:(UISegmentedControl *)segment {
    
    J_SelectionBox *box = [headerGrop objectAtIndex:[headerSegment selectedSegmentIndex]];
    
    if ([segment tag] == 0) {
        
        box.hideLowerArrowWhenZero = [segment selectedSegmentIndex] == 0 ? false : true;
        
    } else if ([segment tag] == 1) {
        
        box.allowNegativeNumber = [segment selectedSegmentIndex] == 0 ? false : true;
        
    }
    
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];

}


@end
