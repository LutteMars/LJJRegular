//
//  LJJRegularOfString.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/30.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJJRegularOfString : NSObject

/****************************************  第二部分：验证字符的部分方法  **********************************/

/**
 验证输入的内容是否是空白行（可以用来删除空白行）
 \n\s*\r
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isEmptyStrWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是中文字符
 [\u4e00-\u9fa5]
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isChineseCharacterWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是双字节字符（包括汉字在内，可以用来计算字符串的长度）
 [^\x00-\xff]
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isDoubleChineseCharactersWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是汉字组成的字符串
 ^[\u4e00-\u9fa5]{0,}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isChineseCharactersWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是中文和数字
 ^[A-Za-z0-9]+$  ^[A-Za-z0-9]{4,40}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isEnglishOrDigitWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是长度为m-n的字符串
 ^.{3,20}$
 
 @param expression 需要验证的字符串
 @param m 长度最小值
 @param n 长度最大值
 @return YES or NO
 */
- (BOOL)isLengthOfText:(nullable NSString *)expression
              BetweenM:(NSInteger)m
                 withN:(NSInteger)n;

/**
 验证输入的内容是否是由26个英文字母组成的字符串
 ^[A-Za-z]+$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByLettersWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是由26个大写英文字母组成的字符串
 ^[A-Z]+$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByUpperLettersWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是由26个小写英文字母组成的字符串
 ^[a-z]+$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByLowerLettersWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是由数字和26个英文字母组成的字符串
 ^[A-Za-z0-9]+$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByLettersAndDigitsWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是由数字和26个英文字母或者下划线组成的字符串
 ^\w+$ 或  ^\w{3,20}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByLettersAndDigitsOrUnderlineWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是由中文、英文、数字包括下划线组成的字符串
 ^[\u4E00-\u9FA5A-Za-z0-9_]+$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByChineseAndEnglishAndDigitsContainedUnderlineWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是由中文、英文、数字但是不包括下划线组成的字符串
 ^[\u4E00-\u9FA5A-Za-z0-9]+$ 或 ^[\u4E00-\u9FA5A-Za-z0 -9]{2,20}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMakedUpByChineseAndEnglishAndDigitsNotContainedUnderlineWithText:(nullable NSString *)expression;

/**
 验证输入的内容是否包含指定的特殊字符
 ^%&’,;=?$\”  或  [^%&',;=?$\x22]+
 
 @param expression 需要验证的输入内容
 @param characters 指定的特殊字符组成的字符串
 @return YES or NO
 */
- (BOOL)isContainedSpecialCharactersWithText:(nullable NSString *)expression
                                  characters:(nullable NSString *)characters;


@end
