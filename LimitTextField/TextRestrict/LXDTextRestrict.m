//
//  LXDTextRestrict.m
//  LimitTextField
//
//  Created by Zhang on 2017/3/2.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import "LXDTextRestrict.h"

typedef BOOL(^LXDStringFilter)(NSString * aString);
static inline NSString * kFilterString(NSString * handleString, LXDStringFilter subStringFilter)
{
    NSMutableString * modifyString = handleString.mutableCopy;
    for (NSInteger idx = 0; idx < modifyString.length;) {
        NSString * subString = [modifyString substringWithRange: NSMakeRange(idx, 1)];
        if (subStringFilter(subString)) {
            idx++;
        } else {
            [modifyString deleteCharactersInRange: NSMakeRange(idx, 1)];
        }
    }
    return modifyString;
}

static inline BOOL kMatchStringFormat(NSString * aString, NSString * matchFormat)
{
    NSPredicate * predicate = [NSPredicate predicateWithFormat: @"SELF MATCHES %@", matchFormat];
    return [predicate evaluateWithObject: aString];
}

@implementation LXDTextRestrict

+ (instancetype)textRestrictWithRestrictType: (LXDRestrictType)restrictType
{
    LXDTextRestrict * textRestrict;
    switch (restrictType) {
        case LXDRestrictTypeOnlyNumber:
            textRestrict = [[LXDNumberTextRestrict alloc] init];
            break;
            
        case LXDRestrictTypeOnlyDecimal:
            textRestrict = [[LXDDecimalTextRestrict alloc] init];
            break;
            
        case LXDRestrictTypeOnlyCharacter:
            textRestrict = [[LXDCharacterTextRestrict alloc] init];
            break;
            
        default:
            break;
    }
    textRestrict.maxLength = NSUIntegerMax;
    textRestrict.restrictType = restrictType;
    return textRestrict;
}

- (void)textDidChanged: (UITextField *)textField
{
    
}


@end

#pragma mark - 子类实现
@implementation LXDNumberTextRestrict

- (void)textDidChanged: (UITextField *)textField
{
    textField.text = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, @"^\\d$");
    });
}

@end

@implementation LXDDecimalTextRestrict

- (void)textDidChanged: (UITextField *)textField
{
    textField.text = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, @"^[0-9.]$");
    });
}

@end

@implementation LXDCharacterTextRestrict

- (void)textDidChanged: (UITextField *)textField
{
    textField.text = kFilterString(textField.text, ^BOOL(NSString *aString) {
        return kMatchStringFormat(aString, @"^[^[\\u4e00-\\u9fa5]]$");
    });
}

@end
