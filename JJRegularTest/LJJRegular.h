//
//  LJJRegular.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/24.
//  Copyright © 2017年 QuickSand. All rights reserved.
//



#import <Foundation/Foundation.h>

#import "LJJRegularConstants.h"


@interface LJJRegular : NSObject


/**!
 根据提供的文本内容和正则表达式进行简单匹配

 @param text 待验证文本内容
 @param regex 正则表达式
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
                regex:(nullable NSString *)regex;


/**!
 根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle;

/**
  根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle
                  arg:(nullable NSString *)arg;

/**
  根据提供的文本内容及其风格来验证是否匹配数字部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg1 参数1
 @param arg2 参数2
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
           digitStyle:(LJJRegularDigitStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2;


/**!
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle;

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle
                  arg:(nullable NSString *)arg;

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg1 参数1
 @param arg2 参数2
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2;

/**!
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
         specialStyle:(LJJRegularSpecialCaseStyle)regularStyle;

/**
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
         specialStyle:(LJJRegularSpecialCaseStyle)regularStyle
                  arg:(nullable NSString *)arg;

/**
 根据提供的文本内容及其风格来验证是否匹配特例部分正则表达式

 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg1 参数1
 @param arg2 参数2
 @return YES or NO
 */
+ (BOOL)regexWithText:(nullable NSString *)text
         specialStyle:(LJJRegularSpecialCaseStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2;


/**!
 获取提供文本内容中以满足正则要求的字符串为键，以满足正则要求的字符串的位置为值组成的字典
 
 @param text 待验证文本内容
 @param regex 正则表达式
 @return 满足正则表达式要求的所有字符串为键、位置为值组成的字典
 */
+ (nullable NSDictionary *)strCollectionsAndRangesOfText:(nullable NSString *)text
                                                   regex:(nullable NSString *)regex;


@end
