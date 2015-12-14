//
//  ItemModel.m
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "ItemModel.h"

@implementation ItemModel
-(instancetype)initWithItemModel:(NSString *)iconUrl title:(NSString *)title
{
    if (self = [super init]) {
        self.iconUrl = iconUrl;
        self.title = title;
    }
    return self;
}

+(instancetype)itemModel:(NSString *)iconUrl title:(NSString *)title
{
    return [[self alloc]initWithItemModel:iconUrl title:title];
}

@end
