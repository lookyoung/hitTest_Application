//
//  ExpandHittableButton.h
//  hitTest_Application
//
//  Created by liuyang on 17/4/20.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpandHittableButton : UIButton

/**
 扩大按钮的点击范围

 @param minimumHitTestWidth  最大宽
 @param minimumHitTestHeight 最大高
 */
- (void)exp_setminimumHitTestWidth:(CGFloat)minimumHitTestWidth minimumHitTestHeight:(CGFloat)minimumHitTestHeight;
@end
