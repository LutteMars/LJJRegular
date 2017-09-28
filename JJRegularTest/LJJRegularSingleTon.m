//
//  LJJRegularSingleTon.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/9/24.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularSingleTon.h"

#import "LJJRegularDirector.h"
#import "LJJRegularOfDigitMethod.h"
#import "LJJRegularOfStringMethod.h"
#import "LJJRegularOfSpecialCaseMethod.h"

@implementation LJJRegularSingleTon


/**
 创建一个正则验证单利对象
 */
+ (nullable instancetype)defaultRegular {
    
    static LJJRegularSingleTon *_singleTonInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        if (_singleTonInstance == nil) {
            _singleTonInstance = [[super alloc] init];
        }
    });
    
    return _singleTonInstance;
}

/**
 根据提供的文本内容和正则表达式进行简单匹配
 */
- (BOOL)regexWithText:(nullable NSString *)text
                regex:(nullable NSString *)regex {
    
    return [LJJRegularDirector matchedWithText:text regex:regex];
}

/**
 根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle {
    
    LJJRegularOfDigitMethod *regularOfDigitMethod = [[LJJRegularOfDigitMethod alloc] init];
    return [regularOfDigitMethod regexWithText:text digitStyle:regularStyle];
}

/**
 根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle
                  arg:(nullable NSString *)arg {
    
    LJJRegularOfDigitMethod *regularOfDigitMethod = [[LJJRegularOfDigitMethod alloc] init];
    return [regularOfDigitMethod regexWithText:text digitStyle:regularStyle arg:arg];
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
    
    LJJRegularOfDigitMethod *regularOfDigitMethod = [[LJJRegularOfDigitMethod alloc] init];
    return [regularOfDigitMethod regexWithText:text digitStyle:regularStyle arg1:arg1 arg2:arg2];
}

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle {
    
    LJJRegularOfStringMethod *regularOfStringMethod = [[LJJRegularOfStringMethod alloc] init];
    return [regularOfStringMethod regexWithText:text strStyle:regularStyle];
}

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle
                  arg:(nullable NSString *)arg {
    
    LJJRegularOfStringMethod *regularOfStringMethod = [[LJJRegularOfStringMethod alloc] init];
    return [regularOfStringMethod regexWithText:text strStyle:regularStyle arg:arg];
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
    
    LJJRegularOfStringMethod *regularOfStringMethod = [[LJJRegularOfStringMethod alloc] init];
    return [regularOfStringMethod regexWithText:text strStyle:regularStyle arg1:arg1 arg2:arg2];
}

/**
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式
 */
- (BOOL)regexWithText:(nullable NSString *)text specialStyle:(LJJRegularSpecialCaseStyle)regularStyle {
    
    LJJRegularOfSpecialCaseMethod *regularOfSpecialMethod = [[LJJRegularOfSpecialCaseMethod alloc] init];
    return [regularOfSpecialMethod regexWithText:text specialStyle:regularStyle];
}

/**
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
         specialStyle:(LJJRegularSpecialCaseStyle)regularStyle
                  arg:(nullable NSString *)arg {
    
    LJJRegularOfSpecialCaseMethod *regularOfSpecialMethod = [[LJJRegularOfSpecialCaseMethod alloc] init];
    return [regularOfSpecialMethod regexWithText:text specialStyle:regularStyle arg:arg];
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
    
    LJJRegularOfSpecialCaseMethod *regularOfSpecialCaseMethod = [[LJJRegularOfSpecialCaseMethod alloc] init];
    return [regularOfSpecialCaseMethod regexWithText:text specialStyle:regularStyle arg1:arg1 arg2:arg2];
}


/**
 获取提供文本内容中以满足正则要求的字符串为键，以满足正则要求的字符串的位置为值组成的字典
 */
- (nullable NSDictionary *)strCollectionsAndRangesOfText:(nullable NSString *)text
                                                   regex:(nullable NSString *)regex {
    return [LJJRegularDirector strCollectionsAndRangesOfText:text regex:regex];
}

@end
