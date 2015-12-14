//
//  ItemCell.m
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ItemCell.h"
#import "ItemButton.h"

#define KRandomColor     [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0];

@interface ItemCell ()

@property (nonatomic,weak) ItemButton* itemBtn;

@end

@implementation ItemCell


-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = KRandomColor;
        
        ItemButton* itemBtn = [ItemButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:itemBtn];
        self.itemBtn = itemBtn;
    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat margin  = 10;
    self.itemBtn.frame = CGRectMake(margin, margin, (self.frame.size.width - margin)/2, (self.frame.size.height - margin)/2);
}




@end
