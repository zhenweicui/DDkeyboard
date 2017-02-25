//
//  IDCardTextField.m
//  身份证号键盘
//
//  Created by zhenwei cui on 2017/2/7.
//  Copyright © 2017年 zhenweicui. All rights reserved.
//

#import "IDCardTextField.h"
#define ZWB_W [UIScreen mainScreen].bounds.size.width

#define ZWB_H [UIScreen mainScreen].bounds.size.height

#define ZWKeyB_H 216.0/568.0*ZWB_H

@implementation IDCardTextField

- (instancetype)init{
    self = [super init];
    if (self) {
        self.inputView = self.keyboard;
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.inputView = self.keyboard;
    }
    return self;
}
- (NSMutableString *)textString{
    if (!_textString) {
        _textString = [[NSMutableString alloc]init];
    }
    return _textString;
}
- (IDCardKeyBoard *)keyboard{
    if (!_keyboard) {
        _keyboard = [[IDCardKeyBoard alloc]initWithFrame:CGRectMake(0, ZWB_H-ZWKeyB_H, ZWB_W, ZWKeyB_H)];
        __weak __typeof(&*self)weakSelf = self;
        [_keyboard setReturnString:^(NSString *string) {
            [weakSelf handleText:string];
        }];
        
        [_keyboard setDoneClicked:^{
            [weakSelf dismissKeyboard];
        }];
    }
    return _keyboard;
}
- (void)handleText:(NSString *)string{
    
    
    if (self.textString.length > 0) {
        [self.textString deleteCharactersInRange:NSMakeRange(0, self.textString.length)];
    }
    [self.textString appendString:self.text];
    if ([string isEqualToString:@"C"]) {
        if (self.textString.length > 0) {
            [self.textString deleteCharactersInRange:NSMakeRange(self.textString.length-1, 1)];
        }
    }else{
        if (self.textString.length < 18) {
            [self.textString appendString:string];
        }
    }
    self.text = self.textString;
}
- (void)dismissKeyboard{
    [self resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        self.keyboard.frame = CGRectMake(0, ZWB_H, ZWB_W, ZWKeyB_H);
    } completion:^(BOOL finished) {
        [self.keyboard removeFromSuperview];
        self.keyboard = nil;
    }];
}
@end
