//
//  LJJRegularOfString.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/30.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularOfString.h"

#import "LJJRegularDirector.h"

@implementation LJJRegularOfString

/**
 验证输入的内容是否是空白行（可以用来删除空白行）
 \n\s*\r
 */
- (BOOL)isEmptyStrWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"\n\\s*\r"];
}


/**
 验证输入的内容是否是中文字符
 [\u4e00-\u9fa5]
 */
- (BOOL)isChineseCharacterWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"[\u4e00-\u9fa5]"];
}


/**
 验证输入的内容是否是双字节字符（包括汉字在内，可以用来计算字符串的长度）
 [^\x00-\xff]
 */
- (BOOL)isDoubleChineseCharactersWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"[^\\x00-\\xff]"];
}


/**
 验证输入的内容是否是汉字组成的字符串
 ^[\u4e00-\u9fa5]{0,}$
 */
- (BOOL)isChineseCharactersWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[\u4e00-\u9fa5]{0,}$"];
}


/**
 验证输入的内容是否是中文和数字
 ^[A-Za-z0-9]+$ 或 ^[A-Za-z0-9]{4,40}$
 */
- (BOOL)isEnglishOrDigitWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[A-Za-z0-9]+$"] |
            [LJJRegularDirector matchedWithText:expression regex:@"^[A-Za-z0-9]{4,40}$"];
}


/**
 验证输入的内容是否是长度为m-n的字符串
 ^.{3,20}$
 */
- (BOOL)isLengthOfText:(nullable NSString *)expression
              BetweenM:(NSInteger)m
                 withN:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^.{%ld,%ld}$", m, n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/**
 验证输入的内容是否是由26个英文字母组成的字符串
 ^[A-Za-z]+$
 */
- (BOOL)isMakedUpByLettersWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[A-Za-z]+$"];
}


/**
 验证输入的内容是否是由26个大写英文字母组成的字符串
 ^[A-Z]+$
 */
- (BOOL)isMakedUpByUpperLettersWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[A-Z]+$"];
}


/**
 验证输入的内容是否是由26个小写英文字母组成的字符串
 ^[a-z]+$
 */
- (BOOL)isMakedUpByLowerLettersWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[a-z]+$"];
}


/**
 验证输入的内容是否是由数字和26个英文字母组成的字符串
 ^[A-Za-z0-9]+$
 */
- (BOOL)isMakedUpByLettersAndDigitsWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[A-Za-z0-9]+$"];
}


/**
 验证输入的内容是否是由数字和26个英文字母或者下划线组成的字符串
 ^\w+$ 或  ^\w{3,20}$
 */
- (BOOL)isMakedUpByLettersAndDigitsOrUnderlineWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\w+$"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^\\w{3,20}$"];
}


/**
 验证输入的内容是否是由中文、英文、数字包括下划线组成的字符串
 ^[\u4E00-\u9FA5A-Za-z0-9_]+$
 */
- (BOOL)isMakedUpByChineseAndEnglishAndDigitsContainedUnderlineWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[\u4E00-\u9FA5A-Za-z0-9_]+$"];
}


/**
 验证输入的内容是否是由中文、英文、数字但是不包括下划线组成的字符串
 ^[\u4E00-\u9FA5A-Za-z0-9]+$ 或 ^[\u4E00-\u9FA5A-Za-z0 -9]{2,20}$
 */
- (BOOL)isMakedUpByChineseAndEnglishAndDigitsNotContainedUnderlineWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^[\u4E00-\u9FA5A-Za-z0-9]+$"] |
            [LJJRegularDirector matchedWithText:expression regex:@"^[\u4E00-\u9FA5A-Za-z0 -9]{2,20}$"];
}

/**
 验证输入的内容是否包含指定的特殊字符
 ^%&’,;=?$\”  或  [^%&',;=?$\x22]+
 */
- (BOOL)isContainedSpecialCharactersWithText:(nullable NSString *)expression
                                  characters:(nullable NSString *)characters {
    return [LJJRegularDirector matchedWithText:expression regex:@"^%&’,;=?$\\”"] |
            [LJJRegularDirector matchedWithText:expression regex:@"[^%&',;=?$\x22]+"];
}



@end
