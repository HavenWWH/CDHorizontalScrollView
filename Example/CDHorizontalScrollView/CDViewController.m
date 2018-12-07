//
//  CDViewController.m
//  CDHorizontalScrollView
//
//  Created by 513433750@qq.com on 12/07/2018.
//  Copyright (c) 2018 513433750@qq.com. All rights reserved.
//

#import "CDViewController.h"

#import "CDTestCollectionViewCell.h"
#import "CDHorizontalScrollView.h"

@interface CDViewController ()<CDHorizontalScrollViewDelegate>
@property (nonatomic, strong) CDHorizontalScrollView *horizontalScrollView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation CDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.dataArray = @[@"111", @"22222", @"323333",@"111", @"22222", @"323333",@"111", @"22222", @"323333, "@"111", @"22222", @"323333"];
    [self.view addSubview: self.horizontalScrollView];
    [self.horizontalScrollView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - CDHorizontalScrollViewDelegate
- (NSArray *)numberOfColumnsInCollectionView:(CDHorizontalScrollView *)collectionView {
    
    return self.dataArray;
}

//每个item大小
- (CGSize)cellSizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake(120, 80);
}
//上左下右
- (UIEdgeInsets)collectionViewInsetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
//每个item之间的间距
- (CGFloat)collectionViewMinimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}
- (void)didselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"选中%@", @(indexPath.row));
}

#pragma mark - setter getter
- (CDHorizontalScrollView *)horizontalScrollView {
    if (!_horizontalScrollView) {
        _horizontalScrollView = [[CDHorizontalScrollView alloc] initWithFrame: CGRectMake(20, 200, self.view.frame.size.width, 120) withClassCell:[CDTestCollectionViewCell class] isNib: false withDelegate:self];
    }
    return _horizontalScrollView;
}
@end
