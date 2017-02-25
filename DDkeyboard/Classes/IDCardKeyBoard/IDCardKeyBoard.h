//
//  IDCardKeyBoard.h
//  身份证号键盘
//
//  Created by zhenwei cui on 2017/2/7.
//  Copyright © 2017年 zhenweicui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDCardKeyBoard : UIView

@property (nonatomic,copy) void(^doneClicked)();
@property (nonatomic,copy) void(^returnString)(NSString *string);

@property (nonatomic,retain)NSArray *keyArr;
@property (nonatomic,retain)UIView *topView;
@property (nonatomic,retain)UIView *keyboardView;
@end
