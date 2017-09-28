//
//  LJJRegularOfSpecialCase.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/30.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import "LJJRegularOfSpecialCase.h"

#import "LJJRegularDirector.h"

@implementation LJJRegularOfSpecialCase

/**
 验证输入的内容是否是email地址
 ^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
 */
- (BOOL)isEmailWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$"];
}


/**
 验证输入的内容是否是域名
 [a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?
 */
- (BOOL)isDomainNameWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?"];
}


/**
 验证输入的内容是否是网址
 [a-zA-z]+://[^\s]* 或 ^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$
 */
- (BOOL)isInternetURLWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"[a-zA-z]+://[^\\s]*"] |
           [LJJRegularDirector matchedWithText:expression regex:@"^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$"];
}


/**
 验证输入的内容是否是手机号码
 ^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$
 */
- (BOOL)isMobilePhoneNumWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\\d{8}$"];
}


/**
 验证输入的内容是否是电话号码
 (“XXX-XXXXXXX” ”XXXX-XXXXXXXX” ”XXX-XXXXXXX” ”XXX-XXXXXXXX” ”XXXXXXX” ”XXX XXXXX) ^($$\d{3,4}-)|\d{3.4}-)?\d{7,8}$
 */
- (BOOL)isTelePhoneNumWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^($$\\d{3,4}-)|\\d{3.4}-)?\\d{7,8}$"];
}


/**
 验证输入的内容是否是国内电话号码
 (0511-4405222 021-87888822) \d{3}-\d{8}|\d{4}-\d{7}
 */
- (BOOL)isIntermalTelePhoneNumWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"\\d{3}-\\d{8}|\\d{4}-\\d{7}"];
}


/**
 验证输入的内容是否是身份证号码（15位或者18位数字）
 ^\d{15}|\d{18}$
 */
- (BOOL)isDigitsIDCardWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\d{15}|\\d{18}$"];
}


/**
 验证输入的内容是否是短身份证号码（数字、字母x结尾）
 ^([0-9]){7,18}(x|X)?$ 或 ^\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18 }?$
 */
- (BOOL)isShortIDCardWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^([0-9]){7,18}(x|X)?$"] |
            [LJJRegularDirector matchedWithText:expression regex:@"^\\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18 }?$"];
}


/**
 验证输入的内容是否是合法账号（以字母开头，允许m-n字节，允许字母数字和下划线）
 ^[a-zA-Z][a-zA-Z0-9_]{4,15}$
 */
- (BOOL)isLegalAccountBeginAsLetterContainedUnderlineWithText:(nullable NSString *)expression
                                            andLengthBetweenM:(NSInteger)m
                                                        withN:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^[a-zA-Z][a-zA-Z0-9_]{%ld,%ld}$", m, n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/**
 验证输入的内容是否是合法密码（以字母开头，长度在m~n之间，且只能包含字母数字和下划线）
 ^[a-zA-Z]\w{5,17}$
 */
- (BOOL)isLegalPassWordBeginAsLetterOnlyContainedLetterAndDigitsAndUnderlineWithText:(nullable NSString *)expression
                                                                    andLenthBetweenM:(NSInteger)m
                                                                               withN:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^[a-zA-Z]\\w{%ld,%ld}$", m, n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/**
 验证输入的内容是否是强密码（必须包含大小写字母和数字的组合，不能使用特殊字符，长度在m~n之间）
 ^(?=.*\d)(?=.*[a-z])( ?=.*[A-Z]).{8,10}$
 */
- (BOOL)
isStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSpecialCharactersWithText:(nullable NSString *)expression
andLengthBetweenM:(NSInteger)m
withN:(NSInteger)n {
    NSString *regex = [NSString stringWithFormat:@"^(?=.*\\d)(?=.*[a-z])( ?=.*[A-Z]).{%ld,%ld}$", m, n];
    return [LJJRegularDirector matchedWithText:expression regex:regex];
}

/**
 验证输入的内容是否是合法的日期格式
 ^\d{4}-\d{1,2}-\d{1,2}
 */
- (BOOL)isLegalDateFormatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\d{4}-\\d{1,2}-\\d{1,2}"];
}

/*！一年的12个月（01~09和1~12） ^(0?[1-9]|1[0-2])$*/
/*！一个月的31天（01~09和1~31） ^((0?[1-9])|((1|2)[0-9])|30|31)$*/


/**
 验证输入的内容是否是合法的金额表达格式
 ^([0-9]+|[0-9]{1,3}(,[0-9]{ 3})*)(.[0-9]{1,2})?$
 */
- (BOOL)isLegalMoneyFormatWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^([0-9]+|[0-9]{1,3}(,[0-9]{ 3})*)(.[0-9]{1,2})?$"];
}


/**
 验证输入的内容是否是XML文件
 ^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$
 */
- (BOOL)isXMLFileWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$"];
}


/**
 验证输入的内容是否是HTML标记（对于复杂的嵌套标记无能为力）
 <(\S*?)[^>]*>.*?|<.*? />
 */
- (BOOL)isHTMLTabWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"<(\\S*?)[^>]*>.*?|<.*? />"];
}


/**
 验证输入的内容首尾是否是空白字符（可以用来删除行首和行尾的空白字符，包括空格、制表符、换页符等）
 ^\s*|\s*$ (^\s*)|(\s*$)
 */
- (BOOL)isEmptyOnHeadAndTailWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"^\\s*|\\s*$ (^\\s*)|(\\s*$)"];
}


/**
 验证输入的内容是否是QQ（腾讯QQ以10000开始）
 [1-9][0-9]{4,}
 */
- (BOOL)isQQWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"[1-9][0-9]{4,}"];
}


/**
 验证输入的内容是否是中国邮政编码（中国邮政编码为6位数字）
 [1-9]\d{5}(?!\d)
 */
- (BOOL)isChinesePostalCodeWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"[1-9]\\d{5}(?!\\d)"];
}


/**
 验证输入的内容是否是IP地址（提取IP地址有用）
 \d+\.\d+\.\d+\.\d+ 或
 ((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\ d))
 */
- (BOOL)isIPAddressWithText:(nullable NSString *)expression {
    return [LJJRegularDirector matchedWithText:expression regex:@"\\d+\\.\\d+\\.\\d+\\.\\d+"] |
            [LJJRegularDirector matchedWithText:expression regex:@"((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\ d))"];
}



@end
