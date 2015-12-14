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

@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout *layout;

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
        collectionView.backgroundColor = [UIColor whiteColor];
        [collectionView registerClass:[ItemCell class] forCellWithReuseIdentifier:@"123"];
        collectionView.scrollEnabled = NO;
        
//        CGFloat width = self.frame.size.width;
//        CGFloat collectionW = width / 3;
//        layout.itemSize = CGSizeMake(collectionW, collectionW);
//        layout.minimumLineSpacing = 0;
//        layout.minimumLineSpacing = 10;
//        layout.minimumInteritemSpacing = 10;
//        layout.sectionInset = UIEdgeInsetsMake(40/3, 10,10, 10);
        self.layout = layout;
        [collectionView reloadData];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect rect = CGRectMake(0, self.frame.size.height - 500, self.frame.size.width, 400);
    self.collectionView.frame = rect;
    CGFloat width = self.frame.size.width;
    CGFloat collectionW = (width - 4 * 10) / 3;
    self.layout.itemSize = CGSizeMake(collectionW, collectionW);
    self.layout.minimumLineSpacing = 10;
    self.layout.minimumInteritemSpacing = 10;
    self.layout.sectionInset = UIEdgeInsetsMake(10, 10,10, 10);
}

- (void)addAnimate
{

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 9;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    return cell;
}


@end













