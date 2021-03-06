//
//  ItemCell.m
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ItemCell.h"
#import "ItemButton.h"
#import "ItemModel.h"
#import <pop/POP.h>
@interface ItemCell ()

@property (nonatomic,weak) ItemButton* itemBtn;

@end

@implementation ItemCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        self.backgroundColor = KRandomColor;
        
        ItemButton* itemBtn = [ItemButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:itemBtn];
        self.itemBtn = itemBtn;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
 
    self.itemBtn.frame = self.bounds; 
}

-(void)setModel:(ItemModel *)model
{
    _model = model;
    
    [self.itemBtn setTitle:model.title forState:UIControlStateNormal];
    [self.itemBtn setImage:[UIImage imageNamed:model.iconUrl] forState:UIControlStateNormal];
    [self performPopUpAnimation];
}

#pragma mark 需要的效果
-(void)performPopUpAnimation
{
    [self pop_removeAllAnimations];
    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    anim.springBounciness = 10;//10;
    anim.springSpeed = 15;
    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(1.0, 1.0)];
    
    POPBasicAnimation *opacityAnim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    
    opacityAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    opacityAnim.duration = 0.3;
    opacityAnim.toValue = @1.0;
    
    [self.layer pop_addAnimation:anim forKey:@"AnimationScale"];
    [self.layer pop_addAnimation:opacityAnim forKey:@"AnimateOpacity"];
}



@end




