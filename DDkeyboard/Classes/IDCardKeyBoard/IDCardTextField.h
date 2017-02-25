//
//  IDCardTextField.h
//  身份证号键盘
//
//  Created by zhenwei cui on 2017/2/7.
//  Copyright © 2017年 zhenweicui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IDCardKeyBoard.h"
@interface IDCardTextField : UITextField

@property (nonatomic,retain)IDCardKeyBoard *keyboard;
@property (nonatomic,retain)NSMutableString *textString;
@end
