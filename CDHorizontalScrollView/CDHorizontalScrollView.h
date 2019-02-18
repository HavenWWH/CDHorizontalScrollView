//
//  CDHorizontalScrollView.h
//  CDProgramme
//
//  Created by cqz on 2018/8/2.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CDHorizontalScrollViewDelegate;


@interface CDHorizontalScrollView : UIView

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

- (instancetype)initWithFrame:(CGRect)frame withClassCell:(Class)classCell isNib:(BOOL)isNib withDelegate:(id<CDHorizontalScrollViewDelegate>)deleagte;

/**
 *  重新加载
 */
- (void)reloadData;


- (void)scrollToIndex: (NSInteger)index;

//- (void)addRefreshEvent;
@end


@protocol CDHorizontalScrollViewDelegate <NSObject>

@optional
/**
 *  总列数
 */
- (NSArray *)numberOfColumnsInCollectionView:(CDHorizontalScrollView *)collectionView;

//每个item大小
- (CGSize)cellSizeForItemAtIndexPath:(NSIndexPath *)indexPath;
//上左下右
- (UIEdgeInsets)collectionViewInsetForSectionAtIndex:(NSInteger)section;
//每个item之间的间距
- (CGFloat)collectionViewMinimumInteritemSpacingForSectionAtIndex:(NSInteger)section;


- (void)didselectItemAtIndexPath:(NSIndexPath *)indexPath;

- (void)hotizontalScrollViewDidScroll: (UIScrollView *)scrollView;
@end
