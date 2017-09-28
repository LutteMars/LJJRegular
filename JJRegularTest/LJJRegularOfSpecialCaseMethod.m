//
//  LJJRegularOfSpecialCaseMethod.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/9/27.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularOfSpecialCaseMethod.h"

#import "LJJRegularOfSpecialCase.h"

@implementation LJJRegularOfSpecialCaseMethod

/**!
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text specialStyle:(LJJRegularSpecialCaseStyle)regularStyle {
    
    LJJRegularOfSpecialCase *regularOfSpecialCase = [[LJJRegularOfSpecialCase alloc] init];
    
    switch (regularStyle) {
        case SpecialStyleIsEmail:
            return [regularOfSpecialCase isEmailWithText:text];
            break;
        case SpecialStyleIsDomainName:
            return [regularOfSpecialCase isDomainNameWithText:text];
            break;
        case SpecialStyleIsIPAddress:
            return [regularOfSpecialCase isIPAddressWithText:text];
            break;
        case SpecialStyleIsInternerURL:
            return [regularOfSpecialCase isInternetURLWithText:text];
            break;
        case SpecialStyleIsMobilePhoneNumber:
            return [regularOfSpecialCase isMobilePhoneNumWithText:text];
            break;
        case SpecialStyleIsTelePhoneNumber:
            return [regularOfSpecialCase isTelePhoneNumWithText:text];
            break;
        case SpecialStyleIsIntermalTelePhoneNumber:
            return [regularOfSpecialCase isIntermalTelePhoneNumWithText:text];
            break;
        case SpecialStyleIsDigitsIDCarad:
            return [regularOfSpecialCase isDigitsIDCardWithText:text];
            break;
        case SpecialStyleIsShortIDCard:
            return [regularOfSpecialCase isShortIDCardWithText:text];
            break;
/*
        case SpecialStyleIsLegalAccountBeginAsLetterContainedUnderline:
            return [regularOfSpecialCase isLegalAccountBeginAsLetterContainedUnderlineWithText:text andLengthBetweenM:<#(NSInteger)#> withN:<#(NSInteger)#>];  // 带有M N
            break;
        case SpecialStyleIsLegalPassWordBeginAsLetterContainedLetterAndDigitsAndUnderline:
            return [regularOfSpecialCase isLegalPassWordBeginAsLetterOnlyContainedLetterAndDigitsAndUnderlineWithText:text andLenthBetweenM:<#(NSInteger)#> withN:<#(NSInteger)#>]; // 带有M N
            break;
        case SpecialStyleIsStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSepcialCharacters:
            return [regularOfSpecialCase isStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSpecialCharactersWithText:text andLengthBetweenM:<#(NSInteger)#> withN:<#(NSInteger)#>]; // 带有M N
            break;
 */
        case SpecialStyleIsLegalDateFormate:
            return [regularOfSpecialCase isLegalDateFormatWithText:text];
            break;
        case SpecialStyleIsLegalMoneyFormat:
            return [regularOfSpecialCase isLegalMoneyFormatWithText:text];
            break;
        case SpecialStyleIsXMLFile:
            return [regularOfSpecialCase isXMLFileWithText:text];
            break;
        case SpecialStyleIsHTMLFile:
            return [regularOfSpecialCase isHTMLTabWithText:text];
            break;
        case SpecialStyleIsEmptyOnHeadAndTail:
            return [regularOfSpecialCase isEmptyOnHeadAndTailWithText:text];
            break;
        case SpecialStyleIsQQ:
            return [regularOfSpecialCase isQQWithText:text];
            break;
        case SpecialStyleIsChinesePostalCode:
            return [regularOfSpecialCase isChinesePostalCodeWithText:text];
            break;
            
        default:
            return NO;
            break;
    }
    
    return NO;
    
}

/**
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text
         specialStyle:(LJJRegularSpecialCaseStyle)regularStyle
                  arg:(nullable NSString *)arg {
    
    if (arg == nil) {
        return [self regexWithText:text specialStyle:regularStyle];
    } else {
        // dosomething there...
    }
    
    return NO;
}

/**
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg1 参数1
 @param arg2 参数2
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
         specialStyle:(LJJRegularSpecialCaseStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2 {
    
    LJJRegularOfSpecialCase *regularOfSpecialCase = [[LJJRegularOfSpecialCase alloc] init];
    
    if (arg1 == nil && arg2 == nil) {
        return [self regexWithText:text specialStyle:regularStyle];
    } else if (arg1 != nil && arg2 == nil) {
        // do something there ...
    } else if (arg2 != nil && arg1 == nil) {
        // do something there ...
    } else {        // arg1 != nil && arg2 != nil
        // 此处做事件分发处理
        switch (regularStyle) {
            case SpecialStyleIsLegalAccountBeginAsLetterContainedUnderline: {
                NSInteger integer1 = [arg1 integerValue];
                NSInteger integer2 = [arg2 integerValue];
                return [regularOfSpecialCase isLegalAccountBeginAsLetterContainedUnderlineWithText:text andLengthBetweenM:integer1 withN:integer2];
            }
                break;
            case SpecialStyleIsLegalPassWordBeginAsLetterContainedLetterAndDigitsAndUnderline: {
                NSInteger integer1 = [arg1 integerValue];
                NSInteger integer2 = [arg2 integerValue];
                return [regularOfSpecialCase isLegalPassWordBeginAsLetterOnlyContainedLetterAndDigitsAndUnderlineWithText:text andLenthBetweenM:integer1 withN:integer2];
            }
                break;
            case SpecialStyleIsStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSepcialCharacters: {
                NSInteger integer1 = [arg1 integerValue];
                NSInteger integer2 = [arg2 integerValue];
                return [regularOfSpecialCase isStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSpecialCharactersWithText:text andLengthBetweenM:integer1 withN:integer2];
            }
                break;
                
            default:
                return NO;
                break;
        }
        
    }
    
    return NO;
}

@end
