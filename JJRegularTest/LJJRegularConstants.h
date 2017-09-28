//
//  LJJRegularConstants.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/31.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#ifndef LJJRegularConstants_h
#define LJJRegularConstants_h

/* 数字相关正则验证方法的枚举类定义 */
typedef NS_ENUM(NSInteger, LJJRegularDigitStyle) {
    DigitStyleIsDigit,                       // 验证输入的内容是否是数字
    DigitStyleIsNDigit,                      // 验证输入的内容是否是N位数字
    DigitStyleIsLessThanNDigits,             // 验证输入的内容是否是至少N位数字
    DigitStyleIsBetweenMAndN,               // 验证输入的内容是否是不少于M位且不多于N位的数字
    DigitStyleIsZeroOrNotBeginAsZero,        // 验证输入的内容是否是零或者非零开头的数字
    DigitStyleIsNotBeginAsZeroAndNotMoreThanTwoDigits,              // 验证输入的内容是否是非零开头的最多带两位小数的数字
    DigitStyleIsPositiveOrNegativeNumberAndHasMoreThanTwoDigits,    // 验证输入的内容是否是带1-2位小数的正数或负数
    DigitStyleIsPositiveOrNegativeOrDecimalNumber,                  // 验证输入的内容是否是正数、负数或者小数
    DigitStyleIsPositiveActualNumberAndHasTwoDigits,                // 验证输入的内容是否是有两位小数的正实数
    DigitStyleIsPositiveActualNumberAndNotMoreThanThreeDigits,      // 验证输入的内容是否是有1-3位小数的正实数
    DigitStyleIsPositiveIntegerAndNotZero,  // 验证输入的内容是否是非零的正整数
    DigitStyleIsNegativeIntegerAndNotZero,  // 验证输入的内容是否是非零的负整数
    DigitStyleIsNotNegativeInteger,         // 验证输入的内容是否是非负整数
    DigitStyleIsNotPositiveInteger,         // 验证输入的内容是否是非正整数
    DigitStyleIsNotNegativeFloat,           // 验证输入的内容是否是非负浮点数
    DigitStyleIsNotPositiveFloat,           // 验证输入的内容是否是非正浮点数
    DigitStyleIsPositiveFloat,              // 验证输入的内容是否是正浮点数
    DigitStyleIsNegativeFloat,              // 验证输入的内容是否是正浮点数
    DigitStyleIsFloat                       // 验证输入的内容是否是浮点数
    
};

/* 字符相关正则验证方法的枚举类定义 */
typedef NS_ENUM(NSInteger, LJJRegularStringStyle) {
    StringStyleIsBlank,                     // 验证输入的内容是否是空白行
    StringStyleIsChineseCharacter,                       // 验证输入的内容是否是中文字符
    StringStyleIsDoubleCharacters,          // 验证输入的内容是否是双字节字符
    StringStyleIsChineseCharacters,         // 验证输入的内容是否是汉字组成的字符串
    StringStyleIsEnglishOrDigit,            // 验证输入的内容是否是中文和数字
    StringStyleIsLengthBetweenMAndN,        // 验证输入的内容是否是长度为m-n的字符串
    StringStyleIsMakedUpByLetters,          // 验证输入的内容是否是由26个英文字母组成的字符串
    StringStyleIsMakedUpByUpperLetters,     // 验证输入的内容是否是由26个大写英文字母组成的字符串
    StringStyleIsMakedUpByLowerLetters,     // 验证输入的内容是否是由26个小写英文字母组成的字符串
    StringStyleIsMakedUpByLettersAndDigits, // 验证输入的内容是否是由数字和26个英文字母组成的字符串
    StringStyleIsMakedUpByLettersAndDigitsOrUnderline,  // 验证输入的内容是否是由数字和26个英文字母或者下划线组成的字符串
    StringStyleIsMakedUpByChineseAndEnglishAndDigitsContainedUnderline,     // 验证输入的内容是否是由中文、英文、数字包括下划线组成的字符串
    StringStyleIsMakedUpByChineseAndEnglishAndDigitsNotContainedUnderline,  // 验证输入的内容是否由中文、英文、数字但不包括下划线组成的字符串
    StringStyleIsContainedSpecialCharacters // 验证输入的内容是否是包含指定的特殊字符
    
};

/* 特殊要求的正则验证方法的枚举类定义 */
typedef NS_ENUM(NSInteger, LJJRegularSpecialCaseStyle) {
    SpecialStyleIsEmail,                    // 验证输入的内容是否是email地址
    SpecialStyleIsDomainName,               // 验证输入的内容是否是域名
    SpecialStyleIsIPAddress,                // 验证输入的内容是否是IP地址
    SpecialStyleIsInternerURL,              // 验证输入的内容是否是网址
    SpecialStyleIsMobilePhoneNumber,        // 验证输入的内容是否是手机电话号码
    SpecialStyleIsTelePhoneNumber,          // 验证输入的内容是否是电话号码(包括座机、手机等)
    SpecialStyleIsIntermalTelePhoneNumber,  // 验证输入的内容是否是国内电话号码
    SpecialStyleIsDigitsIDCarad,            // 验证输入的内容是否是身份证号码(15位或者18位)
    SpecialStyleIsShortIDCard,              // 验证输入的内容是否是短身份证号码(数字、字母x结尾)
    SpecialStyleIsLegalAccountBeginAsLetterContainedUnderline,     // 验证输入的内容是否是合法账号
    SpecialStyleIsLegalPassWordBeginAsLetterContainedLetterAndDigitsAndUnderline, // 验证输入的内容是否是合法的密码
    SpecialStyleIsStrongPassWordMustContainedUpperAndLowerLetterAndDigitsButNotContainedSepcialCharacters,
    SpecialStyleIsLegalDateFormate,         // 验证输入的内容是否是合法的日期格式
    SpecialStyleIsLegalMoneyFormat,         // 验证输入的内容是否是合法的金额写法
    SpecialStyleIsXMLFile,                  // 验证输入的内容是否是XML文件
    SpecialStyleIsHTMLFile,                 // 验证输入的内容是否是HTML文件
    SpecialStyleIsEmptyOnHeadAndTail,       // 验证输入的内容首尾是否是空白字符
    SpecialStyleIsQQ,                       // 验证输入的内容是否是QQ号码
    SpecialStyleIsChinesePostalCode,        // 验证输入的内容是否是中国邮政编码

};

#endif /* LJJRegularConstants_h */
