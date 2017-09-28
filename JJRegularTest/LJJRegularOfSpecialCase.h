//
//  LJJRegularOfSpecialCase.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/30.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJJRegularOfSpecialCase : NSObject

/**************************************  第三部分：验证特殊需求的部分方法  **********************************/


/**
 验证输入的内容是否是email地址
 ^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isEmailWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是域名
 [a-zA-Z0-9][-a-zA-Z0-9]{0,62}(/.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+/.?
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isDomainNameWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是网址
 [a-zA-z]+://[^\s]*  ^http://([\w-]+\.)+[\w-]+(/[\w-./?%&=]*)?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isInternetURLWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是手机号码
 ^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isMobilePhoneNumWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是电话号码
 (“XXX-XXXXXXX” ”XXXX-XXXXXXXX” ”XXX-XXXXXXX” ”XXX-XXXXXXXX” ”XXXXXXX” ”XXX XXXXX) ^($$\d{3,4}-)|\d{3.4}-)?\d{7,8}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isTelePhoneNumWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是国内电话号码
 (0511-4405222 021-87888822) \d{3}-\d{8}|\d{4}-\d{7}
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isIntermalTelePhoneNumWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是身份证号码（15位或者18位数字）
 ^\d{15}|\d{18}$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isDigitsIDCardWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是短身份证号码（数字、字母x结尾）
 ^([0-9]){7,18}(x|X)?$ 或 ^\d{8,18}|[0-9x]{8,18}|[0-9X]{8,18 }?$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isShortIDCardWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是合法账号（以字母开头，允许m-n字节，允许字母数字和下划线）
 ^[a-zA-Z][a-zA-Z0-9_]{4,15}$
 
 @param expression 需要验证的输入内容
 @param m 长度最小值
 @param n 长度最大值
 @return YES or NO
 */
- (BOOL)isLegalAccountBeginAsLetterContainedUnderlineWithText:(nullable NSString *)expression
                                            andLengthBetweenM:(NSInteger)m
                                                        withN:(NSInteger)n;

/**
 验证输入的内容是否是合法密码（以字母开头，长度在m~n之间，且只能包含字母数字和下划线）
 ^[a-zA-Z]\w{5,17}$
 
 @param expression 需要验证的输入内容
 @param m 长度最小值
 @param n 长度最大值
 @return YES or NO
 */
- (BOOL)isLegalPassWordBeginAsLetterOnlyContainedLetterAndDigitsAndUnderlineWithText:(nullable NSString *)expression
                                                                    andLenthBetweenM:(NSInteger)m
                                                                               withN:(NSInteger)n;

/**
 验证输入的内容是否是强密码（必须包含大小写字母和数字的组合，不能使用特殊字符，长度在m~n之间）
 ^(?=.*\d)(?=.*[a-z])( ?=.*[A-Z]).{8,10}$
 
 @param expression 需要验证的输入内容
 @param m 长度最小值
 @param n 长度最大值
 @return YES or NO
 */
- (BOOL)
isStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSpecialCharactersWithText:(nullable NSString *)expression
                                                                                andLengthBetweenM:(NSInteger)m
                                                                                            withN:(NSInteger)n;

/**
 验证输入的内容是否是合法的日期格式
 ^\d{4}-\d{1,2}-\d{1,2}
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isLegalDateFormatWithText:(nullable NSString *)expression;

/*！一年的12个月（01~09和1~12） ^(0?[1-9]|1[0-2])$*/
/*！一个月的31天（01~09和1~31） ^((0?[1-9])|((1|2)[0-9])|30|31)$*/


/**
 验证输入的内容是否是合法的金额表达格式
 ^([0-9]+|[0-9]{1,3}(,[0-9]{ 3})*)(.[0-9]{1,2})?$
 
 @!特别说明：
 一般金额的表示形式可以为：“12.00”和“12,001.00”这类精确到分，或者
 “10000”和“10,000”这类不精确到分
 那么，正则表达式则可以写成：^[1-9][0-9]*$
 这表示任意一个不以`0`开头的数字，但是，这也意味着一个字符`0`不通过，所以我们采用下面的正则表达式：
 ^(0|[1-9 ][0-9]*)$。
 
 一个`0`或者一个不以`0`开头的数字，我们还可以允许开头有一个负号，正则表达式为：^(0|-?[1-9][0-9]*)$。
 这表示一个`0`或者一个可能为负数并且始数字不为`0`的数字，但是金额不能为负，所以把负号去掉。
 
 如果金额精确到分位，我们需要添加小数部分。那么小数部分的正则表达式为：^[0-9]+(.[0-9]+)?$。
 小数点后面至少存在一位数，所以“11.”是非法的表达。但是“11”和“11.2”是正确的，那么小数部分的正则表达式为：
 ^[0-9]+(.[0-9]{2})?$。这样就规定小数点后面必须有2位小数，如果觉得该条件比较苛刻，也可以改成：
 ^[0-9]+(.[0-9]{1,2})?$。这样就允许用户只写一位小数。
 
 对于金额表达式中的逗号，正则表达式可以这样表示：^[0-9]{1,3}(,[0-9]{3})*( .[0-9]{1,2})?$。
 开始部分可以是1到3个数字，然后后面是任意个[,+XXX]即逗号+3个数字的格式。其中逗号`,`为可选项，并不是必须要有。
 那么，正则表达式修改为：^([0-9]+|[0-9]{1,3}(,[0-9]{ 3})*)(.[0-9]{1,2})?$。
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isLegalMoneyFormatWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是XML文件
 ^([a-zA-Z]+-?)+[a-zA-Z0-9]+\\.[x|X][m|M][l|L]$
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isXMLFileWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是HTML标记（对于复杂的嵌套标记无能为力）
 <(\S*?)[^>]*>.*?|<.*? />
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isHTMLTabWithText:(nullable NSString *)expression;


/**
 验证输入的内容首尾是否是空白字符（可以用来删除行首和行尾的空白字符，包括空格、制表符、换页符等）
 ^\s*|\s*$ (^\s*)|(\s*$)
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isEmptyOnHeadAndTailWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是QQ（腾讯QQ以10000开始）
 [1-9][0-9]{4,}
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isQQWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是中国邮政编码（中国邮政编码为6位数字）
 [1-9]\d{5}(?!\d)
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isChinesePostalCodeWithText:(nullable NSString *)expression;


/**
 验证输入的内容是否是IP地址（提取IP地址有用）
 \d+\.\d+\.\d+\.\d+ 或
 ((?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\ d))
 
 @param expression 需要验证的输入内容
 @return YES or NO
 */
- (BOOL)isIPAddressWithText:(nullable NSString *)expression;



@end
