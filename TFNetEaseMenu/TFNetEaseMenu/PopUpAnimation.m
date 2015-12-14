//
//  PopUpAnimation.m
//  TFNetEaseMenu
//
//  Created by Tengfei on 15/12/13.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "PopUpAnimation.h"
#import "ItemCell.h"

@interface PopUpAnimation()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,weak)UICollectionView * collectionView;

@end

@implementation PopUpAnimation


+ (instancetype)view{
    return [[PopUpAnimation alloc]init];
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        CGRect rect = CGRectMake(0, 0, self.frame.size.width, 400);
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:layout];
        self.collectionView = collectionView;
        collectionView.delegate = self;
        collectionView.dataSource = self;
        [self addSubview:collectionView];
        collectionView.backgroundColor = [UIColor blueColor];
        [collectionView registerClass:[ItemCell class] forCellWithReuseIdentifier:@"123"];
        
        CGFloat width = self.frame.size.width;
        CGFloat collectionW = width / 3;
        layout.itemSize = CGSizeMake(collectionW, collectionW);
        layout.minimumLineSpacing = 0;
        [collectionView reloadData];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect rect = CGRectMake(0, self.frame.size.height - 500, self.frame.size.width, 400);
    self.collectionView.frame = rect;
}

- (void)addAnimate
{

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor grayColor];
    return cell;
}



@end
