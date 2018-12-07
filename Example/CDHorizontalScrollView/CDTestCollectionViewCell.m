//
//  CDTestCollectionViewCell.m
//  CDHorizontalScrollView_Example
//
//  Created by 吴文海 on 2018/12/7.
//  Copyright © 2018 513433750@qq.com. All rights reserved.
//

#import "CDTestCollectionViewCell.h"

@interface CDTestCollectionViewCell ()

@property (nonatomic, strong) UILabel *lable;
@end


@implementation CDTestCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}
#pragma mark - Intial Methods
- (void)setupView {
    
    self.contentView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.lable];
 
}
#pragma mark - Target Methods

#pragma mark - Public Methods
- (void)setObj:(id)obj {
    
    
    self.lable.text = (NSString *)obj;
}
#pragma mark - Private Method
- (void)layoutSubviews {
    [super layoutSubviews];
    

}

#pragma mark - Setter Getter Methods
- (UILabel *)lable {
    
    if (!_lable) {
        _lable = [[UILabel alloc] initWithFrame: CGRectMake(20, 20, self.frame.size.width - 40, self.frame.size.height - 40)];
        _lable.backgroundColor = [UIColor greenColor];
        _lable.textColor = [UIColor blueColor];
        _lable.textAlignment = NSTextAlignmentCenter;
    }
    return _lable;
}
@end
