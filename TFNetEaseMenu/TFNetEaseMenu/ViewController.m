//
//  ViewController.m
//  TFNetEaseMenu
//
//  Created by Tengfei on 15/12/13.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ViewController.h"
#import <pop/POP.h>
#import "PopUpAnimation.h"
@interface ViewController ()

@property (nonatomic,weak)UIButton * anmationView;

@property (nonatomic,weak)PopUpAnimation * popUpView;
@property(nonatomic,strong)UIImageView *tran;
@property(nonatomic,assign,getter=isWeatherShow)BOOL weatherShow;

@property (nonatomic,weak)UIButton *rightItem;

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
    
    
//    UIButton *rightItem = [[UIButton alloc]init];
//    self.rightItem = rightItem;
//    UIWindow *win = [UIApplication sharedApplication].windows.firstObject;
//    [win addSubview:rightItem];
//    [rightItem addTarget:self action:@selector(rightItemClick) forControlEvents:UIControlEventTouchUpInside];
//    rightItem.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 45, 20, 45, 45);
//    NSLog(@"%@",NSStringFromCGRect(rightItem.frame));
//    [rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"动画" style:UIBarButtonItemStyleDone target:self action:@selector(jumpToClassify)];
}

-(void)jumpToClassify
{

//    [self performPopUpAnimation];
    [self addPopUp];
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


- (void)addPopUp{
    PopUpAnimation *popUpView = [[PopUpAnimation alloc]init]                                                                     ;
//    popUpView.weatherModel = self.weatherModel;
    self.popUpView = popUpView;
//    popUpView.alpha = 0.9;
//    UIWindow *win = [UIApplication sharedApplication].windows.firstObject;
//    [win addSubview:popUpView];
    [self.view addSubview:popUpView];
    
    UIImageView *tran = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"224"]];
    self.tran = tran;
    tran.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 33, 57, 7, 7);
//    [win addSubview:tran];
    
    popUpView.frame = [UIScreen mainScreen].bounds;
//    popUpView.y = 64;
//    popUpView.height -= 64;
    self.popUpView.hidden = NO;
    self.tran.hidden = YES;
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(pushWeatherDetail) name:@"pushWeatherDetail" object:nil];
}
#if 0
- (void)pushWeatherDetail
{
    self.weatherShow = NO;
    PopUpAnimation *wdvc = [[PopUpAnimation alloc]init];
//    wdvc.weatherModel = self.weatherModel;
    [self.navigationController pushViewController:wdvc animated:YES];
    [UIView animateWithDuration:0.1 animations:^{
        self.weatherView.alpha = 0;
    } completion:^(BOOL finished) {
        self.weatherView.alpha = 0.9;
        self.weatherView.hidden = YES;
        self.tran.hidden = YES;
    }];
}
#endif
- (void)rightItemClick{
    if (self.isWeatherShow) {
        self.popUpView.hidden = YES;
        self.tran.hidden = YES;
        [UIView animateWithDuration:0.1 animations:^{
            self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, M_1_PI * 5);
            
        } completion:^(BOOL finished) {
            [self.rightItem setImage:[UIImage imageNamed:@"top_navigation_square"] forState:UIControlStateNormal];
        }];
    }else{
        
        [self.rightItem setImage:[UIImage imageNamed:@"223"] forState:UIControlStateNormal];
        self.popUpView.hidden = NO;
        self.tran.hidden = NO;
        [self.popUpView addAnimate];
        [UIView animateWithDuration:0.2 animations:^{
            self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, -M_1_PI * 6);
            
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.1 animations:^{
                self.rightItem.transform = CGAffineTransformRotate(self.rightItem.transform, M_1_PI );
            }];
        }];
    }
    self.weatherShow = !self.isWeatherShow;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
