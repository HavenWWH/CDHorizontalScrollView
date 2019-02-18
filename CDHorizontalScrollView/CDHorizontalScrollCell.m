//
//  CDHorizontalScrollCell.m
//  CDProgramme
//
//  Created by cqz on 2018/8/2.
//  Copyright © 2018年 ChangDao. All rights reserved.
//

#import "CDHorizontalScrollCell.h"

@implementation CDHorizontalScrollCell
-(UIViewController *)cd_viewController {
    id responder = self;
    while (responder){
        if ([responder isKindOfClass:[UIViewController class]]){
            return responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}
-(void)cellSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
