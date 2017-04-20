//
//  ExpandHittableView.m
//  hitTest_Application
//
//  Created by liuyang on 17/4/20.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import "ExpandHittableView.h"

@implementation ExpandHittableView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if (!self.userInteractionEnabled || self.isHidden || self.alpha < 0.01) {
        return nil;
    }
    /**
     *  此注释掉的方法用来判断点击是否在父View Bounds内，
     *  如果不在父view内，就会直接不会去其子View中寻找HitTestView，return 返回
     */
    //    if ([self pointInside:point withEvent:event]) {
    for (UIView *subView in [self.subviews reverseObjectEnumerator]) {
        CGPoint convertPoint = [subView convertPoint:point fromView:self];
        UIView *hitTestView = [subView hitTest:convertPoint withEvent:event];
        if (hitTestView) {
            return hitTestView;
        }
    }
    return self;
    //    }
    return nil;
}


@end
