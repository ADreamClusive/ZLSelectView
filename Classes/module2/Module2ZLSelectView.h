//
//  Module2ZLSelectView.h
//
//  Created by Jiaozl on 10/11/2017.
//  Copyright © 2017 Jiaozl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol Module2ZLSelectViewDelegate

- (void)Module2ZLSelectViewDidSelect:(NSUInteger)index;

@end

@interface Module2ZLSelectView : UIView

@property (nonatomic, assign) id<Module2ZLSelectViewDelegate> delegateOfModule2ZLSelectView;

// 通过名字数组初始化
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray;

// 通过名字和图片数组初始化
-(id)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray images:(NSArray *)imagesArray;


@end
