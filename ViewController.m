//
//  ViewController.m
//  hitTest_Application
//
//  Created by liuyang on 17/4/20.
//  Copyright © 2017年 com.me. All rights reserved.
//

#import "ViewController.h"
#import "ExpandHittableView.h"
#import "ExpandHittableButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ExpandHittableView *viewA = [[ExpandHittableView alloc] initWithFrame:CGRectMake(20, 100, 300, 300)];
    viewA.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:viewA];
    
    UIView *viewB = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    viewB.backgroundColor = [UIColor redColor];
    viewB.tag = 1001;
    [viewA addSubview:viewB];
    
    UIView *viewC = [[UIView alloc] initWithFrame:CGRectMake(10, 150, 100, 100)];
    viewC.backgroundColor = [UIColor yellowColor];
    viewC.tag = 1002;
    [viewA addSubview:viewC];
    
    UIView *viewD = [[UIView alloc] initWithFrame:CGRectMake(10, 270, 100, 100)];
    viewD.backgroundColor = [UIColor blueColor];
    viewD.tag = 1003;
    [viewA addSubview:viewD];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [viewD addGestureRecognizer:tap];
    
    NSArray *subArr = [viewA subviews];
    NSLog(@"subArr = %@",subArr);
    
    
    ExpandHittableButton *subBtn1 = [ExpandHittableButton buttonWithType:UIButtonTypeCustom];
    subBtn1.frame = CGRectMake(150, 150, 20, 20);
    [subBtn1 exp_setminimumHitTestWidth:50 minimumHitTestHeight:50];
    subBtn1.backgroundColor = [UIColor purpleColor];
    [subBtn1 addTarget:self action:@selector(subBtn1_Click) forControlEvents:UIControlEventTouchUpInside];
    [viewA addSubview:subBtn1];
    
    
    ExpandHittableButton *subBtn2 = [ExpandHittableButton buttonWithType:UIButtonTypeCustom];
    subBtn2.backgroundColor = [UIColor darkGrayColor];
    subBtn2.frame = CGRectMake(140, 270, 100, 100);
    [viewA addSubview:subBtn2];
    [subBtn2 addTarget:self action:@selector(subBtn2_Click) forControlEvents:UIControlEventTouchUpInside];
}

/**
 
 1、扩大UIButton的响应热区
 
 相信大家都遇到小图button点击热区太小问题，之前我是用UIButton的setImage方法来设置图片解决，但是调起坐标就坑了，得各种计算不说，写出的代码还很难看不便于维护，如果我们用用hit-test view的知识你就能轻松地解决这个问题。
 */
// 点击已知按钮图标范围过小，不容易点击，可以重写pointInside方法，扩大点击范围。
- (void)subBtn1_Click {
    NSLog(@"subBtn1_Click 点击扩大到按钮周边");
}

- (void)tapAction {
    NSLog(@"tapAction 点击扩大到点击视图周边");
}


/**
 
 2、子view超出了父view的bounds响应事件
 
 项目中常常遇到button已经超出了父view的范围但仍需可点击的情况，比如自定义Tabbar中间的大按钮（如微博tabbar中间按钮），点击超出Tabbar bounds的区域也需要响应，此时重载父view的-(UIView *)hitTest: withEvent:方法，去掉点击必须在父view内的判断，然后子view就能成为 hit-test view用于响应事件了。
 */
- (void)subBtn2_Click {
    NSLog(@"subBtn2_Click 点击扩大到父视图之外");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
