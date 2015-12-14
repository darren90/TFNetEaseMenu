//
//  ItemCell.m
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ItemCell.h"

@interface ItemCell ()

@property (nonatomic,weak)UIImageView * iconView;

@end

@implementation ItemCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        UIImageView * iconView= [[UIImageView alloc]init];
        self.iconView = iconView;
        [self addSubview:iconView];
    }
    return self;
}





@end
