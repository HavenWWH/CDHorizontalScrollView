# CDHorizontalScrollView

[![CI Status](https://img.shields.io/travis/513433750@qq.com/CDHorizontalScrollView.svg?style=flat)](https://travis-ci.org/513433750@qq.com/CDHorizontalScrollView)
[![Version](https://img.shields.io/cocoapods/v/CDHorizontalScrollView.svg?style=flat)](https://cocoapods.org/pods/CDHorizontalScrollView)
[![License](https://img.shields.io/cocoapods/l/CDHorizontalScrollView.svg?style=flat)](https://cocoapods.org/pods/CDHorizontalScrollView)
[![Platform](https://img.shields.io/cocoapods/p/CDHorizontalScrollView.svg?style=flat)](https://cocoapods.org/pods/CDHorizontalScrollView)

## Example

### 初始化



- (CDHorizontalScrollView *)horizontalScrollView {

if (!_horizontalScrollView) {

_horizontalScrollView = [[CDHorizontalScrollView alloc] initWithFrame: CGRectMake(20, 200, self.view.frame.size.width, 120) withClassCell:[CDTestCollectionViewCell class] isNib: false withDelegate:self];

}

    return _horizontalScrollView;

}


### CDHorizontalScrollViewDelegate


- (NSArray *)numberOfColumnsInCollectionView:(CDHorizontalScrollView *)collectionView {


         return self.dataArray;

}


//每个item大小

- (CGSize)cellSizeForItemAtIndexPath:(NSIndexPath *)indexPath {


    return CGSizeMake(120, 80);

}

//上左下右边距
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


## Requirements

## Installation

CDHorizontalScrollView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CDHorizontalScrollView'
```

## Author

 513433750@qq.com

## License

CDHorizontalScrollView is available under the MIT license. See the LICENSE file for more info.
