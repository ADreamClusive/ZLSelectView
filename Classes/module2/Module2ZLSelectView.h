//
//  ZLSelectView.h
//
//  Created by Jiaozl on 10/11/2017.
//  Copyright © 2017 Jiaozl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZLSelectViewDelegate

- (void)ZLSelectViewDidSelect:(NSUInteger)index;

@end

@interface ZLSelectView : UIView

@property (nonatomic, assign) id<ZLSelectViewDelegate> delegateOfZLSelectView;

// 通过名字数组初始化
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray;

// 通过名字和图片数组初始化
-(id)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray images:(NSArray *)imagesArray;


@end
