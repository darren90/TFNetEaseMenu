//
//  ViewController.m
//  TFNetEaseMenu
//
//  Created by Tengfei on 15/12/13.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
@interface ViewController ()

@property (nonatomic,weak)UIButton * anmationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * anmationView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.anmationView = anmationView;
    [self.view addSubview:anmationView];
    anmationView.frame = CGRectMake((self.view.frame.size.width - 100)/2, 200, 100, 100);
    [anmationView setBackgroundImage:[UIImage imageNamed:@"ic_01"] forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"动画" style:UIBarButtonItemStyleDone target:self action:@selector(jumpToClassify)];
}

-(void)jumpToClassify
{

    [self performPopUpAnimation];
}


#pragma mark 需要的效果
-(void)performPopUpAnimation
{
    [self.anmationView pop_removeAllAnimations];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.springBounciness = 10;//10;
    anim.springSpeed = 20;
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    
    POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnim.duration = 0.3;
    opacityAnim.toValue = @1.0;
    
    [self.anmationView.layer pop_addAnimation:anim forKey:@"AnimationScale"];
    [self.anmationView.layer pop_addAnimation:opacityAnim forKey:@"AnimateOpacity"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
