//
//  LJJRegularOfDigit.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/30.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJJRegularOfDigit : NSObject

/**
 验证输入内容是否是数字
 ^[0-9]*$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isDigitWithText:(nullable NSString *)expression;


/**
 验证输入内容是否是N位数字
 ^\d{n}$
 
 @param expression 需要验证的输入内容
 @param n 符合条件的输入的数字的位数
 @return YES or NO
 */
- (BOOL)isNDigitsWithText:(nullable NSString *)expression
                        n:(NSInteger)n;

/**
 验证输入内容是否是至少n位数字
 ^\d{n,}$
 
 @param expression 需要验证的输入内容
 @param n 符合条件的输入的数字的位数
 @return YES or NO
 */
- (BOOL)isLessThanNDigitsWithText:(nullable NSString *)expression
                                n:(NSInteger)n;

/**
 验证输入的内容是否是m-n位的数字
 ^\d{m,n}$
 
 @param expression 需要验证的输入内容
 @param m 符合条件的输入的数字的最小位数
 @param n 符合条件的输入的数字的最大位数
 @return YES or NO
 */
- (BOOL)isDigitsWithText:(nullable NSString *)expression
                betweenM:(NSInteger)m
                   withN:(NSInteger)n;

/**
 验证输入的内容是否是零或者非零开头的数字
 ^(0|[1-9][0-9]*)$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isZeroOrNotBeginAsZeroWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非零开头的最多带两位小数的数字
 ^([1-9][0-9]*)+(.[0-9]{1,2})?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNotBeginAsZeroAndNotMoreThanTwoDigitsWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是带1-2位小数的正数或者负数
 ^(\-)?\d+(\.\d{1,2})?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isPositiveOrNegativeNumberAndHasMoreThanTwoDigitsWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是正数、负数或小数
 ^(\-|\+)?\d+(\.\d+)?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isPositiveOrNegativeOrDecimalNumberWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是有两位小数的正实数
 ^[0-9]+(.[0-9]{2})?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isPositiveActualNumberAndHasTwoDigitsWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是有1-3位小数的正实数
 ^[0-9]+(.[0-9]{1,3})?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isPositiveActualNumberAndNotMoreThanThreeDigitsWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非零的正整数
 ^[1-9]\d*$ 或 ^([1-9][0-9]*){1,3}$ 或 ^\+?[1-9][0-9]*$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isPositiveIntegerAndNotZeroWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非零的负整数
 ^\-[1-9][]0-9′′*$ 或  ^-[1-9]\d*$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNegativeIntegerAndNotZeroWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非负整数
 ^\d+$ 或 ^[1-9]\d*|0$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNotNegativeIntegerWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非正整数
 ^-[1-9]\d*|0$  ^((-\d+)|(0+))$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNotPositiveIntegerWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非负浮点数
 ^\d+(\.\d+)?$  ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNotNegativeFloatWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是非正浮点数
 ^((-\d+(\.\d+)?)|(0+(\.0+)?))$  ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+ |0$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNotPositiveFloatWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是正浮点数
 ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$ ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0 -9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isPositiveFloatWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是负浮点数
 ^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$  ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[ 1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isNegativeFloatWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是浮点数
 ^(-?\d+)(\.\d+)?$  ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isFloatWithText:(nullable NSString *)expression;


@end
