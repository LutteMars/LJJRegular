//
//  LJJRegularOfStringMethod.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/9/27.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularOfStringMethod.h"

#import "LJJRegularOfString.h"

@implementation LJJRegularOfStringMethod

/**!
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text strStyle:(LJJRegularStringStyle)regularStyle {
    
    LJJRegularOfString *regularOfString = [[LJJRegularOfString alloc] init];
    
    switch (regularStyle) {
        case StringStyleIsBlank:
            return [regularOfString isEmptyStrWithText:text];
            break;
        case StringStyleIsChineseCharacter:
            return [regularOfString isChineseCharacterWithText:text];
            break;
        case StringStyleIsDoubleCharacters:
            return [regularOfString isDoubleChineseCharactersWithText:text];
            break;
        case StringStyleIsChineseCharacters:
            return [regularOfString isChineseCharactersWithText:text];
            break;
        case StringStyleIsEnglishOrDigit:
            return [regularOfString isEnglishOrDigitWithText:text];
            break;
        case StringStyleIsMakedUpByLetters:
            return [regularOfString isMakedUpByLettersWithText:text];
            break;
        case StringStyleIsMakedUpByUpperLetters:
            return [regularOfString isMakedUpByUpperLettersWithText:text];
            break;
        case StringStyleIsMakedUpByLowerLetters:
            return [regularOfString isMakedUpByLowerLettersWithText:text];
            break;
        case StringStyleIsMakedUpByLettersAndDigits:
            return [regularOfString isMakedUpByLettersAndDigitsWithText:text];
            break;
        case StringStyleIsMakedUpByLettersAndDigitsOrUnderline:
            return [regularOfString isMakedUpByLettersAndDigitsOrUnderlineWithText:text];
            break;
        case StringStyleIsMakedUpByChineseAndEnglishAndDigitsContainedUnderline:
            return [regularOfString isMakedUpByChineseAndEnglishAndDigitsContainedUnderlineWithText:text];
            break;
        case StringStyleIsMakedUpByChineseAndEnglishAndDigitsNotContainedUnderline:
            return [regularOfString isMakedUpByChineseAndEnglishAndDigitsNotContainedUnderlineWithText:text];
            break;
            
        default:
            break;
    }
    
    return NO;
}

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle
                  arg:(nullable NSString *)arg {
    
    LJJRegularOfString *regularOfString = [[LJJRegularOfString alloc] init];
    
    if (arg == nil) {
        return [self regexWithText:text strStyle:regularStyle];
    } else {
        // dosomething there...
        switch (regularStyle) {
            case StringStyleIsContainedSpecialCharacters:
                return [regularOfString isContainedSpecialCharactersWithText:text characters:arg];
                break;
            default:
                return NO;
                break;
        }
    }
    
    return NO;
}

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg1 参数1
 @param arg2 参数2
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2 {
    
    LJJRegularOfString *regularOfString = [[LJJRegularOfString alloc] init];
    
    if (arg1 == nil && arg2 == nil) {
        return [self regexWithText:text strStyle:regularStyle];
    } else if (arg1 != nil && arg2 == nil) {
        return [self regexWithText:text strStyle:regularStyle arg:arg1];
    } else if (arg2 != nil && arg1 == nil) {
        return [self regexWithText:text strStyle:regularStyle arg:arg2];
    } else {
        switch (regularStyle) {
            case StringStyleIsLengthBetweenMAndN: {
                NSInteger integer1 = [arg1 integerValue];
                NSInteger integer2 = [arg2 integerValue];
                return [regularOfString isLengthOfText:text BetweenM:integer1 withN:integer2];
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
