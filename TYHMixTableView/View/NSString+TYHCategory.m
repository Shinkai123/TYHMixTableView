//
//  NSString+TYHCategory.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/19.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "NSString+TYHCategory.h"



@implementation NSString (TYHCategory)

/*返回字符串所占用的尺寸*/
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    CGSize textSize;
    if (CGSizeEqualToSize(maxSize, CGSizeZero)) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        textSize = [self sizeWithAttributes:attributes];
    } else {
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（字体大小+行间距=行高）
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:maxSize
                                         options:option
                                      attributes:attributes
                                         context:nil];
        
        textSize = rect.size;
    }
    return textSize;
}

@end
