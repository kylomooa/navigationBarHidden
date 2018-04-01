//
//  SCRootTransparentNavigationBarVc.m
//  SyberHealth
//
//  Created by maoqiang on 2018/3/22.
//  Copyright © 2018年 Goose. All rights reserved.
//

#import "SCRootTransparentNavigationBarVc.h"

@interface SCRootTransparentNavigationBarVc ()
@property (nonatomic, strong) UIImage *backgroundImageForBarMetrics;
@property (nonatomic, strong) UIImage *shadowImage;
@end

@implementation SCRootTransparentNavigationBarVc

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.backgroundImageForBarMetrics = [self.navigationController.navigationBar backgroundImageForBarMetrics:UIBarMetricsDefault];
    self.shadowImage = self.navigationController.navigationBar.shadowImage;
    [self setNavTransparent];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self recoveryNavTransparent];
}

-(void)setNavigationBarAlpha:(CGFloat)alpha{
    UIImage *backgroundImage = [self createImageWithColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:alpha>=1?0.99:alpha] withRect:self.navigationController.navigationBar.bounds];
        //还原navigationBar背景色
        [self.navigationController.navigationBar setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = [UIImage new];
}

-(void)setNavTransparent{
    //设置navigationBar背景色透明
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
}

-(void)recoveryNavTransparent{
    //还原navigationBar背景色
    [self.navigationController.navigationBar setBackgroundImage:self.backgroundImageForBarMetrics forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = self.shadowImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0)) {
        self.edgesForExtendedLayout = UIRectEdgeAll;
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
}

-(UIImage *)createImageWithColor:(UIColor *)color withRect:(CGRect)rect{
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return myImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
