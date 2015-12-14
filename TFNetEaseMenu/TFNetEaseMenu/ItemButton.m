//
//  ItemButton.m
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ItemButton.h"
#define KtitleH 20
#define KRandomColor     [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];

@implementation ItemButton

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.backgroundColor = KRandomColor;
//        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.layer.cornerRadius = self.frame.size.width / 2;
    self.imageView.clipsToBounds = YES;
    
    self.titleLabel.textColor = [UIColor blackColor];
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.width);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
     return CGRectMake(0, contentRect.size.width, contentRect.size.width,contentRect.size.height -contentRect.size.width);
}

@end
