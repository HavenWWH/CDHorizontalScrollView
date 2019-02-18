//
//  CDHorizontalScrollView.m
//  CDProgramme
//
//  Created by cqz on 2018/8/2.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import "CDHorizontalScrollView.h"
#import "CDHorizontalScrollCell.h"


@interface CDHorizontalScrollView ()
<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong, readwrite) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isNib;
@property (nonatomic, strong) Class cellClass;

@property (nonatomic, strong) NSMutableArray *listMutaArray;

@property (nonatomic, weak) id<CDHorizontalScrollViewDelegate> scrollViewDelegate;
@end

@implementation CDHorizontalScrollView

- (instancetype)initWithFrame:(CGRect)frame withClassCell:(Class)classCell isNib:(BOOL)isNib withDelegate:(id<CDHorizontalScrollViewDelegate>)deleagte {
    
    if (self = [super initWithFrame:frame]) {
        
        self.cellClass = classCell;
        self.scrollViewDelegate = deleagte;
        self.isNib = isNib;
        [self setupView];
    }
    return self;
}
#pragma mark - Intial Methods
- (void)setupView {
    
    [self addSubview:self.collectionView];
//    self.collectionView.clipsToBounds = false;
}
#pragma mark - Target Methods

#pragma mark - Public Methods
- (void)reloadData {
    
    [self.listMutaArray removeAllObjects];
    [self.listMutaArray addObjectsFromArray:[self.scrollViewDelegate numberOfColumnsInCollectionView:self]];
    [self.collectionView reloadData];
}


- (void)scrollToIndex: (NSInteger)index {
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:true];
}
#pragma mark - Private Method

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.listMutaArray count];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.cellClass) forIndexPath:indexPath];
}
- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(nonnull UICollectionViewCell *)cell forItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    CDHorizontalScrollCell *horizonCell = (CDHorizontalScrollCell *)cell;
    if (indexPath.row < [self.listMutaArray count]) {
        horizonCell.obj = self.listMutaArray[indexPath.row];
    }
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView deselectItemAtIndexPath:indexPath animated:true];
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(didselectItemAtIndexPath:)]) {
        [self.scrollViewDelegate didselectItemAtIndexPath:indexPath];
    }
    
    CDHorizontalScrollCell *cell = (CDHorizontalScrollCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(cellSelectRowAtIndexPath:)]) {
        [cell cellSelectRowAtIndexPath:indexPath];
    }
}
//MARK: - UICollectionViewDelegateLeftAlignedLayout
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [UICollectionReusableView new];
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.scrollViewDelegate cellSizeForItemAtIndexPath:indexPath];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout *)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section {
    return [self.scrollViewDelegate collectionViewInsetForSectionAtIndex:section];
}
//同行的cell与cell之间水平之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return [self.scrollViewDelegate collectionViewMinimumInteritemSpacingForSectionAtIndex:section];
}
//每行之间竖直之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return [self.scrollViewDelegate collectionViewMinimumInteritemSpacingForSectionAtIndex:section];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.scrollViewDelegate && [self.scrollViewDelegate respondsToSelector:@selector(hotizontalScrollViewDidScroll:)]) {
        
        [self.scrollViewDelegate hotizontalScrollViewDidScroll:scrollView];
    }
}

#pragma mark - Setter Getter Methods
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.showsVerticalScrollIndicator = false;
//        _collectionView.allowsMultipleSelection = true;
//        _collectionView.alwaysBounceVertical = true;
//        _collectionView.bounces = false;

        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.scrollsToTop = false;
        
        if (self.isNib) {
            [_collectionView registerNib:[UINib nibWithNibName:NSStringFromClass(self.cellClass) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass(self.cellClass)];
        } else {
            
            [_collectionView registerClass:[self.cellClass class] forCellWithReuseIdentifier:NSStringFromClass(self.cellClass)];
        }
    }
    return _collectionView;
}
- (NSMutableArray *)listMutaArray {
    if (!_listMutaArray) {
        _listMutaArray = [NSMutableArray array];
    }
    return _listMutaArray;
}
@end
