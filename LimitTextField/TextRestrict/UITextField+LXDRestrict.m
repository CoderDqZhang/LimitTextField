//
//  UITextField+LXDRestrict.m
//  LimitTextField
//
//  Created by Zhang on 2017/3/2.
//  Copyright © 2017年 Zhang. All rights reserved.
//

#import "UITextField+LXDRestrict.h"
#import <objc/runtime.h>

#define LXDTextRestrictKey "LXDTextRestrict"
#define LXDRestrictTypeKey "LXDRestrictTypeKey"
#define LXDMaxTextLength "LXDMaxTextLength"

@implementation UITextField (LXDRestrict)
@dynamic maxTextLength,restrictType,textRestrict;

- (NSUInteger)getMaxTextLength {
    return (long)objc_getAssociatedObject(self, LXDMaxTextLength);
}

- (void)setMaxTextLength:(NSUInteger)maxTextLength {
    objc_setAssociatedObject(self, LXDMaxTextLength, @(maxTextLength), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)getRestrictType {
    return objc_getAssociatedObject(self, LXDRestrictTypeKey);
}

- (void)setRestrictType: (LXDRestrictType)restrictType
{
    objc_setAssociatedObject(self, LXDRestrictTypeKey, @(restrictType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.textRestrict = [LXDTextRestrict textRestrictWithRestrictType: restrictType];
}

- (id)getTextRestrict {
    return  objc_getAssociatedObject(self, LXDTextRestrictKey);
}

- (void)setTextRestrict: (LXDTextRestrict *)textRestrict
{
//    if (self.textRestrict) {
//        [self removeTarget: self.text action: @selector(textDidChanged:) forControlEvents: UIControlEventEditingChanged];
//    }
    textRestrict.maxLength = [self getMaxTextLength];
    [self addTarget: textRestrict action: @selector(textDidChanged:) forControlEvents: UIControlEventEditingChanged];
    objc_setAssociatedObject(self, LXDTextRestrictKey, textRestrict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
