//
//  LJJRegularOfDigit.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/30.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularOfDigit.h"

#import "LJJRegularDirector.h"

@implementation LJJRegularOfDigit

/** 验证输入内容是否是数字 ^[0-9]*$ */
- (BOOL)isDigitWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[0-9]*$"];
}


/** 验证输入内容是否是N位数字 ^\d{n}$ */
- (BOOL)isNDigitsWithText:(nullable NSString *)expression
                        n:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^%@d{%ld}$", @"\\", (long)n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/** 验证输入内容是否是至少n位数字:^\d{n,}$ */
- (BOOL)isLessThanNDigitsWithText:(nullable NSString *)expression
                                n:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^%@d{%ld,}$", @"\\", n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/**
 验证输入的内容是否是m-n位的数字
 ^\d{m,n}$
*/
- (BOOL)isDigitsWithText:(nullable NSString *)expression
                betweenM:(NSInteger)m
                   withN:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^%@d{%ld,%ld}$", @"\\", m, n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/**
 验证输入的内容是否是零或者非零开头的数字
 ^(0|[1-9][0-9]*)$
 */
- (BOOL)isZeroOrNotBeginAsZeroWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^(0|[1-9][0-9]*)$"];
}


/**
 验证输入的内容是否是非零开头的最多带两位小数的数字
 ^([1-9][0-9]*)+(.[0-9]{1,2})?$
 */
- (BOOL)isNotBeginAsZeroAndNotMoreThanTwoDigitsWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^([1-9][0-9]*)+(.[0-9]{1,2})?$"];
}


/**
 验证输入的内容是否是带1-2位小数的正数或者负数
 ^(\-)?\d+(\.\d{1,2})?$
 */
- (BOOL)isPositiveOrNegativeNumberAndHasMoreThanTwoDigitsWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^(\\-)?\\d+(\\.\\d{1,2})?$"];
}


/**
 验证输入的内容是否是正数、负数或小数
 ^(\-|\+)?\d+(\.\d+)?$
 */
- (BOOL)isPositiveOrNegativeOrDecimalNumberWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^(\\-|\\+)?\\d+(\\.\\d+)?$"];
}


/**
 验证输入的内容是否是有两位小数的正实数
 ^[0-9]+(.[0-9]{2})?$
 */
- (BOOL)isPositiveActualNumberAndHasTwoDigitsWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[0-9]+(.[0-9]{2})?$"];
}


/**
 验证输入的内容是否是有1-3位小数的正实数
 ^[0-9]+(.[0-9]{1,3})?$
 */
- (BOOL)isPositiveActualNumberAndNotMoreThanThreeDigitsWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[0-9]+(.[0-9]{1,3})?$"];
}


/**
 验证输入的内容是否是非零的正整数
 ^[1-9]\d*$ 或 ^([1-9][0-9]*){1,3}$ 或 ^\+?[1-9][0-9]*$
 */
- (BOOL)isPositiveIntegerAndNotZeroWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[1-9]\\d*$"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^([1-9][0-9]*){1,3}$"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^\\+?[1-9][0-9]*$"];
}


/**
 验证输入的内容是否是非零的负整数
 ^\-[1-9][]0-9′′*$ 或  ^-[1-9]\d*$
 */
- (BOOL)isNegativeIntegerAndNotZeroWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\-[1-9][]0-9′′*$"] |
            [LJJRegularDirector matchedWithText:expression regex:@"^-[1-9]\\d*$"];
}


/**
 验证输入的内容是否是非负整数
 ^\d+$ 或 ^[1-9]\d*|0$
 */
- (BOOL)isNotNegativeIntegerWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\d+$"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^[1-9]\\d*|0$"];
}


/**
 验证输入的内容是否是非正整数
 ^-[1-9]\d*|0$  ^((-\d+)|(0+))$
 */
- (BOOL)isNotPositiveIntegerWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^-[1-9]\\d*|0$"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^((-\\d+)|(0+))$"];
}


/**
 验证输入的内容是否是非负浮点数
 ^\d+(\.\d+)?$  ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0$
 */
- (BOOL)isNotNegativeFloatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\d+(\\.\\d+)?$"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*|0?\\.0+|0$"];
}


/**
 验证输入的内容是否是非正浮点数
 ^((-\d+(\.\d+)?)|(0+(\.0+)?))$  ^(-([1-9]\d*\.\d*|0\.\d*[1-9]\d*))|0?\.0+ |0$
 */
- (BOOL)isNotPositiveFloatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^((-\\d+(\\.\\d+)?)|(0+(\\.0+)?))$"];
}


/**
 验证输入的内容是否是正浮点数
 ^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$ ^(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0 -9]*\.[0-9]+)|([0-9]*[1-9][0-9]*))$
 */
- (BOOL)isPositiveFloatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*$"];
}


/**
 验证输入的内容是否是负浮点数
 ^-([1-9]\d*\.\d*|0\.\d*[1-9]\d*)$  ^(-(([0-9]+\.[0-9]*[1-9][0-9]*)|([0-9]*[ 1-9][0-9]*\.[0-9]+)|([0-9]*[1-9][0-9]*)))$
 */
- (BOOL)isNegativeFloatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^-([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*)$"];
}


/**
 验证输入的内容是否是浮点数
 ^(-?\d+)(\.\d+)?$  ^-?([1-9]\d*\.\d*|0\.\d*[1-9]\d*|0?\.0+|0)$
 */
- (BOOL)isFloatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^(-?\\d+)(\\.\\d+)?$"] |
            [LJJRegularDirector matchedWithText:expression regex:@"^-?([1-9]\\d*\\.\\d*|0\\.\\d*[1-9]\\d*|0?\\.0+|0)$"];
}



@end
