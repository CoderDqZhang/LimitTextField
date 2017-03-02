//
//  LXDTextRestrict.h
//  LimitTextField
//
//  Created by Zhang on 2017/3/2.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LXDRestrictType)
{
    LXDRestrictTypeOnlyNumber = 1,      ///< 只允许输入数字
    LXDRestrictTypeOnlyDecimal = 2,     ///<  只允许输入实数，包括.
    LXDRestrictTypeOnlyCharacter = 3,  ///<  只允许非中文输入
};

@interface LXDTextRestrict : NSObject
@property (nonatomic, assign) NSUInteger maxLength;
@property (nonatomic, readonly) LXDRestrictType restrictType;

// 工厂
+ (instancetype)textRestrictWithRestrictType: (LXDRestrictType)restrictType;
// 子类实现来限制文本内容
- (void)textDidChanged: (UITextField *)textField;

@end

#pragma mark - 继承关系
@interface LXDTextRestrict ()

@property (nonatomic, readwrite) LXDRestrictType restrictType;

@end

@interface LXDNumberTextRestrict : LXDTextRestrict
@end

@interface LXDDecimalTextRestrict : LXDTextRestrict
@end

@interface LXDCharacterTextRestrict : LXDTextRestrict
@end

