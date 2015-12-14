//
//  ItemModel.h
//  TFNetEaseMenu
//
//  Created by Fengtf on 15/12/14.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ItemModel : NSObject

@property (nonatomic,strong)UIColor *color;

@property (nonatomic,copy)NSString * iconUrl;

@property (nonatomic,copy)NSString * title;

-(instancetype)initWithItemModel:(NSString *)iconUrl title:(NSString *)title;

+(instancetype)itemModel:(NSString *)iconUrl title:(NSString *)title;

@end
