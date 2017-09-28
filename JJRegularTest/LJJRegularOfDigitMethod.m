//
//  LJJRegularOfDigitMethod.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/9/27.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularOfDigitMethod.h"

#import "LJJRegularOfDigit.h"

@implementation LJJRegularOfDigitMethod


/**!
 根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text digitStyle:(LJJRegularDigitStyle)regularStyle {
    
    LJJRegularOfDigit *regularOfDigit = [[LJJRegularOfDigit alloc] init];
    
    switch (regularStyle) {
        case DigitStyleIsDigit:
            return [regularOfDigit isDigitWithText:text];
            break;
/*
        case DigitStyleIsNDigit:
            return [regularOfDigit isNDigitsWithText:text n:<#(NSInteger)#>];// 带有N
            break;
        case DigitStyleIsLessThanNDigits:
            return [regularOfDigit isLessThanNDigitsWithText:text n:<#(NSInteger)#>]; // 带有N
            break;
        case DigitStyleIsBetweenMAndN:
            return [regularOfDigit isDigitsWithText:text betweenM:<#(NSInteger)#> withN:<#(NSInteger)#>]; // 带有M N
            break;
 */
        case DigitStyleIsZeroOrNotBeginAsZero:
            return [regularOfDigit isZeroOrNotBeginAsZeroWithText:text];
            break;
        case DigitStyleIsNotBeginAsZeroAndNotMoreThanTwoDigits:
            return [regularOfDigit isNotBeginAsZeroAndNotMoreThanTwoDigitsWithText:text];
            break;
        case DigitStyleIsPositiveOrNegativeNumberAndHasMoreThanTwoDigits:
            return [regularOfDigit isPositiveOrNegativeNumberAndHasMoreThanTwoDigitsWithText:text];
            break;
        case DigitStyleIsPositiveOrNegativeOrDecimalNumber:
            return [regularOfDigit isPositiveOrNegativeOrDecimalNumberWithText:text];
            break;
        case DigitStyleIsPositiveActualNumberAndHasTwoDigits:
            return [regularOfDigit isPositiveActualNumberAndHasTwoDigitsWithText:text];
            break;
        case DigitStyleIsPositiveActualNumberAndNotMoreThanThreeDigits:
            return [regularOfDigit isPositiveActualNumberAndNotMoreThanThreeDigitsWithText:text];
            break;
        case DigitStyleIsPositiveIntegerAndNotZero:
            return [regularOfDigit isPositiveIntegerAndNotZeroWithText:text];
            break;
        case DigitStyleIsNegativeIntegerAndNotZero:
            return [regularOfDigit isNegativeIntegerAndNotZeroWithText:text];
            break;
        case DigitStyleIsNotNegativeInteger:
            return [regularOfDigit isNotNegativeIntegerWithText:text];
            break;
        case DigitStyleIsNotPositiveInteger:
            return [regularOfDigit isNotPositiveIntegerWithText:text];
            break;
        case DigitStyleIsNotNegativeFloat:
            return [regularOfDigit isNotNegativeFloatWithText:text];
            break;
        case DigitStyleIsNotPositiveFloat:
            return [regularOfDigit isNotPositiveFloatWithText:text];
            break;
        case DigitStyleIsPositiveFloat:
            return [regularOfDigit isPositiveFloatWithText:text];
            break;
        case DigitStyleIsNegativeFloat:
            return [regularOfDigit isNegativeFloatWithText:text];
            break;
        case DigitStyleIsFloat:
            return [regularOfDigit isFloatWithText:text];
            break;
        default:
            return NO;
            break;
    }
    
    return NO;
}

/**
 根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle
                  arg:(nullable NSString *)arg {
    
    LJJRegularOfDigit *regularOfDigit = [[LJJRegularOfDigit alloc] init];
    
    if (arg == nil) {
        return [self regexWithText:text digitStyle:regularStyle];
    } else {
        switch (regularStyle) {
            case DigitStyleIsNDigit: {
                NSInteger integer = [arg integerValue];
                return [regularOfDigit isNDigitsWithText:text n:integer]; // 带有N
            }
                break;
            case DigitStyleIsLessThanNDigits: {
                NSInteger integer = [arg integerValue];
                return [regularOfDigit isLessThanNDigitsWithText:text n:integer];
            }
                break;
            default:
                return NO;
                break;
        }
    }
}

/**
 根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg1 参数1
 @param arg2 参数2
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2 {
    
    LJJRegularOfDigit *regularOfDigit = [[LJJRegularOfDigit alloc] init];
    
    if (arg1 == nil && arg2 == nil) {
        return [self regexWithText:text digitStyle:regularStyle];
    } else if (arg1 != nil && arg2 == nil){     // arg1 != nil
        return [self regexWithText:text digitStyle:regularStyle arg:arg1];
    } else if (arg1 == nil && arg2 != nil){     // arg2 != nil
        return [self regexWithText:text digitStyle:regularStyle arg:arg2];
    } else {                                    // arg1 != nil && arg2 != nil
        switch (regularStyle) {
            case DigitStyleIsBetweenMAndN: {
                NSInteger integer1 = [arg1 integerValue];
                NSInteger integer2 = [arg2 integerValue];
                return  [regularOfDigit isDigitsWithText:text betweenM:integer1 withN:integer2]; // 带有M N
            }
                break;
            default:
                return NO;
                break;
        }
    }
    
    return YES;
}

@end
