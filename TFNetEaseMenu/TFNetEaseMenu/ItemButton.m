//
//  ItemButton.m
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ItemButton.h"
#define KtitleH 20

@implementation ItemButton

-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, contentRect.size.width, contentRect.size.height - KtitleH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
     return CGRectMake(0, contentRect.size.height - KtitleH, contentRect.size.width, KtitleH);
}

@end
