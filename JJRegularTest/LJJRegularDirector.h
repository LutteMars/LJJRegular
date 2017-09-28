//
//  LJJRegularDirector.h
//  JJRegularTest
//
//  Created by Lyndon on 2017/5/28.
//  Copyright © 2017年 QuickSand. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LJJRegularDirector : NSObject

/**利用正则表达式来验证输入是否符合要求有三种方法：
 * 方法一：谓词（NSPredicate）创建正则表达式
 * 方法二：NSString实例方法
 * 方法三：NSRegularExpression类创建正则表达式，该方法还可以抓取多个结果
 **/




/**
 验证提供的文本内容是否与对应的正则表达式相匹配

 @说明：这个“匹配”是指待验证文本内容的格式符合正则表达式的要求与规范。
  例如：
       待验证内容是：123456    正则表达式对应的要求是：xxx@xxx.com（邮箱格式），
       则表示不匹配。返回值：NO.
       待验证内容是：我是五个字  正则表达式对应的要求是：字符串不能超过5个字符，
       则表示匹配。返回值：YES.
 
 @param expression 需要验证的文本内容
 @param regex 正则表达式
 @return YES or NO
 */
+ (BOOL)matchedWithText:(nullable NSString *)expression
                  regex:(nullable NSString *)regex;

/**
 验证提供的文本内容是否包正则表达式对应的内容

 @说明：这个“包含”可以指提供的文本内容中含有正则表达式对应的文本内容中的一部分内容，
       也可以指提供的文本内容中含有正则表达式对应的文本内容个的全部内容。当待验证
       内容含有正则表达式对应的文本内容的全部内容时，该正则表达式对应的内容是待验证
       内容的子集。
  例如：
       待验证内容是：123456   正则表达式对应的内容是：789，则不包含。返回值：NO.
       待验证内容是：123456   正则表达式对应的内容是：246789，则包含：246。YES.
       待验证内容是：123456   正则表达式对应的内容是：123，则包含：123。
       此时，正则表达式所对应的内容是待验证内容的子集。YES.
       待验证内容是：123456   正则表达式对应的内容是：123456，则包含：123456。
       返回值：YES。此时，正则表达式所对应的内容是待验证文本内容的完全子集。
 
 @param expression 需要验证的文本内容
 @param regex 正则表达式
 @return YES or NO
 */
+ (BOOL)containedWithText:(nullable NSString *)expression
                    regex:(nullable NSString *)regex;

/**
 验证正则表达式对应的内容是否是提供的文本内容的子集
 
 @说明：该方法要求正则表达式所对应的内容是待验证文本内容的子集或者完全子集。如果，
       正则表达式所对应的内容中没有或者有仅有一部分存在于待验证文本内容中，则表示
       正则表达式的内容不是待验证文本内容的子集。
  例如：
       待验证内容是：我是待验证内容，正则表达式对应的内容是：验证内容额，则正则表达式
       对应的内容不是待验证内容的子集。返回NO.
       待验证内容是：我是待验证内容，正则表达式对应的内容是：验证内容，则正则表达式
       对应的内容是待验证内容的子集。返回YES.
       待验证内容是：我是待验证内容，正则表达式对应的内容是：我是待验证内容，则正则
       表达式对应的内容是待验证内容的子集并且是完全子集。返回YES.

 @param expression 需要验证的文本内容
 @param regex 正则表达式
 @return YES or NO
 */
+ (BOOL)isSubcollectionOfText:(nullable NSString *)expression
                        regex:(nullable NSString *)regex;

/**
 返回待验证文本内容中与正则表达式相匹配的所有字符串的集合

 @param expression 待验证的文本内容
 @param regex 正则表达式
 @return 待验证文本内容中所有匹配正则表达式的字符串作为元素组成的数组
 */
+ (nullable NSArray *)matchedCollectionsOfText:(nullable NSString *)expression
                                         regex:(nullable NSString *)regex;

/**
 返回待验证文本内容中包含了正则表达式内容的所有字符串的集合

 @param expression 待验证的文本内容
 @param regex 正则表达式
 @return 待验证文本内容中所有包含正则表达式的内容的字符串作为元素组成的数组
 */
+ (nullable NSArray *)cotainedCollectionsOfText:(nullable NSString *)expression
                                          regex:(nullable NSString *)regex;

/**
 返回待验证文本内容中所有满足正则表达式要求的字符串的集合

 @说明：
        如果待验证文本内容中有一个或者多个字符是正则表达式内容的父集，那么这些父集作为元素
        所组成的数组即为返回值。
 
 @param expression 待验证的文本内容
 @param regex 正则表达式
 @return 待验证文本内容中所有符合正则表达式的字符串作为元素组成的数组
 */
+ (nullable NSArray *)subcollectionsOfText:(nullable NSString *)expression
                                     regex:(nullable NSString *)regex;



/**
 获取提供文本内容中满足正则要求的字符串的位置

 @param expression 待验证文本内容
 @param regex 正则表达式
 @return 满足正则表达式要求的字符串在待验证文本中的位置
 */
+ (NSRange)rangeOfText:(nullable NSString *)expression
                          regex:(nullable NSString *)regex;


/**
 获取提供文本内容中满足正则要求的所有字符串的位置的集合

 @param expression 待验证文本内容
 @param regex 正则表达式
 @return 满足正则表达式要求的所有字符串在待验证文本中的位置为元素组成的数组
 */
+ (nullable NSArray *)rangesOfText:(nullable NSString *)expression
                             regex:(nullable NSString *)regex;


/**
 获取提供文本内容中以满足正则要求的字符串为键，以满足正则要求的字符串的位置为值组成的字典

 @param expression 待验证文本内容
 @param regex 正则表达式
 @return 满足正则表达式要求的所有字符串为键、位置为值组成的字典
 */
+ (nullable NSDictionary *)strCollectionsAndRangesOfText:(nullable NSString *)expression
                                                   regex:(nullable NSString *)regex;


@end
