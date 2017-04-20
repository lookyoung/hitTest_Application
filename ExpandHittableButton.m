//
//  ExpandHittableButton.m
//  hitTest_Application
//
//  Created by liuyang on 17/4/20.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import "ExpandHittableButton.h"

@interface ExpandHittableButton ()
@property (nonatomic, assign) CGFloat minimumHitTestWidth;
@property (nonatomic, assign) CGFloat minimumHitTestHeight;
@end

@implementation ExpandHittableButton

-(void)exp_setminimumHitTestWidth:(CGFloat)minimumHitTestWidth minimumHitTestHeight:(CGFloat)minimumHitTestHeight {
    _minimumHitTestWidth = minimumHitTestWidth;
    _minimumHitTestHeight = minimumHitTestHeight;
}

// 重载UIButton的-(BOOL)pointInside: withEvent:方法，让Point即使落在Button的Frame外围也返回YES。
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    return CGRectContainsPoint(HitTestingBounds(self.bounds, _minimumHitTestWidth, _minimumHitTestHeight), point);
}

CGRect HitTestingBounds(CGRect bounds, CGFloat minimumHitTestWidth, CGFloat minimumHitTestHeight) {
    CGRect hitTestingBounds = bounds;
    if (minimumHitTestWidth > bounds.size.width) {
        hitTestingBounds.size.width = minimumHitTestWidth;
        hitTestingBounds.origin.x -= (hitTestingBounds.size.width - bounds.size.width) / 2;
    }
    if (minimumHitTestHeight > bounds.size.height) {
        hitTestingBounds.size.height = minimumHitTestHeight;
        hitTestingBounds.origin.y -= (hitTestingBounds.size.height - bounds.size.height) / 2;
    }
    return hitTestingBounds;
}

@end
