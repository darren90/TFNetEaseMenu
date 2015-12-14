//
//  PopUpAnimation.m
//  TFNetEaseMenu
//
//  Created by Tengfei on 15/12/13.
//  Copyright © 2015年 tengfei. All rights reserved.
//

#import "PopUpAnimation.h"
#import "ItemCell.h"
#import "ItemModel.h"

@interface PopUpAnimation()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong)UICollectionViewFlowLayout *layout;

@property (nonatomic,strong)NSArray *dataArray;
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
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"123" forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.item];
    return cell;
}

-(NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSArray array];
        
        ItemModel *m1 = [ItemModel itemModel:@"204" title:@"搜索"];
        ItemModel *m2 = [ItemModel itemModel:@"202" title:@"上头条"];
        ItemModel *m3 = [ItemModel itemModel:@"203" title:@"离线"];
        ItemModel *m4 = [ItemModel itemModel:@"205" title:@"夜间"];
        ItemModel *m5 = [ItemModel itemModel:@"202" title:@"扫一扫"];
        ItemModel *m6 = [ItemModel itemModel:@"206" title:@"邀请有礼"];
        NSArray *arr = @[m1,m2,m3,m4,m5,m6];
        _dataArray = arr;
    }
    return _dataArray;
}



@end













