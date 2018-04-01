//
//  ViewController.m
//  TransparentNavigationBar
//
//  Created by maoqiang on 2018/4/1.
//  Copyright © 2018年 maoqiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (@available(iOS 11.0, *)) {
        self.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.bounds.size.width, self.scrollView.bounds.size.height*2);
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image.png"]];
    imageView.frame = CGRectMake(0, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height * 2);
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.scrollView addSubview:imageView];

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self setNavigationBarAlpha:scrollView.contentOffset.y / 200.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
