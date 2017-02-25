//
//  IDCardKeyBoard.m
//  身份证号键盘
//
//  Created by zhenwei cui on 2017/2/7.
//  Copyright © 2017年 zhenweicui. All rights reserved.
//

#import "IDCardKeyBoard.h"
#define ZWB_H [UIScreen mainScreen].bounds.size.height

#define ZWB_W [UIScreen mainScreen].bounds.size.width
#define ZWKey_Space 40
#define ZWKeyB_H 216.0/568.0*ZWB_H - ZWKey_Space
@implementation IDCardKeyBoard
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1];
        [self addSubview:self.topView];
        [self addSubview:self.keyboardView];
    }
    return self;
}
- (NSArray *)keyArr{
    if (!_keyArr) {
        _keyArr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"X",@"0",@"C"];
    }
    return _keyArr;
}
- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 1, ZWB_W, ZWKey_Space-2)];
        _topView.backgroundColor = [UIColor whiteColor];
        UIButton *doneBnt = [UIButton buttonWithType:UIButtonTypeSystem];
        doneBnt.frame = CGRectMake(ZWB_W - 80, 4, 60, ZWKey_Space-8);
        doneBnt.titleLabel.font = [UIFont systemFontOfSize:20];
        [doneBnt addTarget:self action:@selector(doneBntClicked:) forControlEvents:UIControlEventTouchUpInside];
        [doneBnt setTitle:@"完成" forState:UIControlStateNormal];
        [doneBnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_topView addSubview:doneBnt];
    }
    return _topView;
}
- (UIView *)keyboardView{
    if (!_keyboardView) {
        _keyboardView = [[UIView alloc]initWithFrame:CGRectMake(0, ZWKey_Space, ZWB_W, ZWKeyB_H)];
        [self.keyArr enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UIButton *bnt = [UIButton buttonWithType:UIButtonTypeSystem];
            bnt.frame = CGRectMake(idx%3*((ZWB_W-2)/3+1), idx/3*((ZWKeyB_H-3)/4 +1), (ZWB_W-2)/3, (ZWKeyB_H-3)/4);
            bnt.backgroundColor = [UIColor whiteColor];
            bnt.titleLabel.font = [UIFont systemFontOfSize:30];
            [bnt setTitle:obj forState:UIControlStateNormal];
            [bnt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [bnt addTarget:self action:@selector(bntClicked:) forControlEvents:UIControlEventTouchUpInside];
            [_keyboardView addSubview:bnt];
            if (idx == self.keyArr.count - 1) {
                bnt.backgroundColor = [UIColor clearColor];
            }
        }];
    }
    return _keyboardView;
}

- (void)bntClicked:(UIButton *)sender{
    if (self.returnString) {
        self.returnString(sender.currentTitle);
    }
}
- (void)doneBntClicked:(UIButton *)sender{
    if (self.doneClicked) {
        self.doneClicked();
    }
}
@end
