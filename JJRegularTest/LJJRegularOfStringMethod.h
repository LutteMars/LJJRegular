//
//  LJJRegularOfStringMethod.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/9/27.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LJJRegularConstants.h"

@interface LJJRegularOfStringMethod : NSObject

/**!
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text strStyle:(LJJRegularStringStyle)regularStyle;

/**
 根据提供的文本内容及其风格来验证是否匹配字符部分正则表达式
 
 @param text 待验证文本内容
 @param regularStyle 正则表达式
 @param arg 参数1
 @return YES or NO
 */
- (BOOL)regexWithText:(nullable NSString *)text
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
- (BOOL)regexWithText:(nullable NSString *)text
             strStyle:(LJJRegularStringStyle)regularStyle
                 arg1:(nullable NSString *)arg1
                 arg2:(nullable NSString *)arg2;

@end
