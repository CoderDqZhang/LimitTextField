//
//  UITextField+LXDRestrict.h
//  LimitTextField
//
//  Created by Zhang on 2017/3/2.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXDTextRestrict.h"
@interface UITextField (LXDRestrict)

/// 设置后生效
@property (nonatomic, assign) LXDRestrictType restrictType;
/// 文本最长长度
@property (nonatomic, assign) NSUInteger maxTextLength;
/// 设置自定义的文本限制
@property (nonatomic, strong) LXDTextRestrict * textRestrict;

@end
