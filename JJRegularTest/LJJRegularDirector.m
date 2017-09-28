//
//  LJJRegularDirector.m
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/28.
//  Copyright © 2017年 QuickSand. All rights reserved.
//
// 字符串和文本还是需要区别对待，这里所说的文本是指由多个字符串组成的长句。

#import "LJJRegularDirector.h"

@implementation LJJRegularDirector

/***！ 方法一：使用谓词（NSPredicate）创建正则表达式 ***/
/** 验证提供的文本内容是否与对应的正则表达式相匹配 */
+ (BOOL)matchedWithText:(nullable NSString *)expression
                  regex:(nullable NSString *)regex {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [predicate evaluateWithObject:expression];
}

/***！ 方法二：使用NSString实例方法 ***/
/** 验证提供的文本内容是否包含正则表达式对应的内容 */
+ (BOOL)containedWithText:(nullable NSString *)expression
                    regex:(nullable NSString *)regex {
    
    NSRange range = [expression rangeOfString:regex options:NSRegularExpressionSearch];
    
    if (range.location != NSNotFound) {
        return YES;
    }
    
    return NO;
}

/***！ 方法三：使用NSRegularExpression类创建正则表达式 ***/
/** 验证正则表达式对应的内容是否是提供的文本内容的子集 */
+ (BOOL)isSubcollectionOfText:(nullable NSString *)expression
                        regex:(nullable NSString *)regex {

    NSError *error = NULL;
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:&error];
    NSTextCheckingResult *textCheckingResult = [regularExpression firstMatchInString:expression
                                                                             options:0
                                                                               range:NSMakeRange(0, [expression length])];
    
    if (!textCheckingResult) {
        NSLog(@"验证正则表达式对应的内容是否是提供的文本的内容的子集报错：%@", error);
        return NO;
    }
    
    return YES;
}

/** 返回待验证文本内容中与正则表达式相匹配的所有字符串的集合 */
+ (nullable NSArray *)matchedCollectionsOfText:(nullable NSString *)expression
                                         regex:(nullable NSString *)regex {
    
    NSError *error = NULL;
    NSMutableArray * matchStrsArray = [NSMutableArray new];
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:&error];
    // 对expression字符串进行匹配
    NSArray *matches = [regularExpression matchesInString:expression
                                                  options:0
                                                    range:NSMakeRange(0, [expression length])];
    
    // 遍历匹配后的每一条记录
    for (NSTextCheckingResult *match in matches) {
        NSRange range = [match range];
        NSString *matchStr = [expression substringWithRange:range];
        // 将获取的每一条符合正则要求的字符串添加到数组中
        [matchStrsArray addObject:matchStr];
    }
    
    NSLog(@"满足要求的所有字符的集合：%@", matchStrsArray);
    return matchStrsArray;
}

/** 返回待验证文本内容中包含了正则表达式内容的所有字符串的集合 */
+ (nullable NSArray *)cotainedCollectionsOfText:(nullable NSString *)expression
                                          regex:(nullable NSString *)regex {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", regex];
    NSArray *sourceArray = [expression componentsSeparatedByString:@" "];
    NSArray *amidArray = [sourceArray filteredArrayUsingPredicate:predicate];
    
    return amidArray;
}

/** 返回待验证文本内容中所有满足正则表达式要求的字符串的集合 */
+ (nullable NSArray *)subcollectionsOfText:(nullable NSString *)expression
                                     regex:(nullable NSString *)regex {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    NSArray *sourceArray = [expression componentsSeparatedByString:@" "];
    NSArray *amidArray = [sourceArray filteredArrayUsingPredicate:predicate];
    
    return amidArray;
}

/** 获取提供文本内容中满足正则要求的字符串的位置 */
+ (NSRange)rangeOfText:(nullable NSString *)expression
                 regex:(nullable NSString *)regex {
    
    NSRange range = [expression rangeOfString:regex options:NSRegularExpressionSearch];
    
    return (range.location != NSNotFound)? range : NSMakeRange(0, 0);
}

/** 获取提供文本内容中满足正则要求的所有字符串的位置的集合 */
+ (nullable NSArray *)rangesOfText:(nullable NSString *)expression
                             regex:(nullable NSString *)regex {
    
    NSError *error = NULL;
    NSMutableArray *matchStrRangesArray = [NSMutableArray new];
    
    NSRegularExpression *regularExpression = [NSRegularExpression regularExpressionWithPattern:regex
                                                                                       options:NSRegularExpressionCaseInsensitive
                                                                                         error:&error];
    // 对字符串进行匹配
    NSArray *matches = [regularExpression matchesInString:expression
                                                  options:0
                                                    range:NSMakeRange(0, [expression length])];
    
    // 遍历匹配后的每一条记录
    for (NSTextCheckingResult *match in matches) {
        NSRange range = [match range];
        // 将获取的每一条符合正则要求的字符串的位置添加到数组中
        [matchStrRangesArray addObject:NSStringFromRange(range)];
    }
    
    NSLog(@"满足要求的字符的位置的集合：%@", matchStrRangesArray);
    return matchStrRangesArray;
}

/** 获取提供文本内容中以满足正则要求的字符串为键，以满足正则要求的字符串的位置为值组成的字典 */
/*
    这里有一个问题：输出的字典的键并不是按照给定的数组的元素的先后顺序输出，即排列是无序的。
 */
+ (nullable NSDictionary *)strCollectionsAndRangesOfText:(nullable NSString *)expression
                                                   regex:(nullable NSString *)regex {
#if 1
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    for (id key in [self rangesOfText:expression regex:regex]) {
        [mDict setValue:regex forKey:key];
    }
    return mDict;
    
#else
    return [[NSMutableDictionary alloc] initWithObjects:[self matchedCollectionsOfText:expression regex:regex] forKeys:[self rangesOfText:expression regex:regex]];
#endif
}



@end
