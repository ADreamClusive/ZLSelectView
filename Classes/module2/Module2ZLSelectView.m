//
//  Module2ZLSelectView.m
//
//  Created by Jiaozl on 10/11/2017.
//  Copyright © 2017 Jiaozl. All rights reserved.
//

#import "Module2ZLSelectView.h"
#define Module2ZLSelectViewBtnFlag 100

#define kCOLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]
#define ZLCommonColor kCOLOR_WITH_HEX(0xbfa97f)
#define ZLSelectedColor kCOLOR_WITH_HEX(0xd77315)
#define ZLBgColor [UIColor colorWithRed:242/255.0 green:241/255.0 blue:190/255.0 alpha:1]




@interface Module2ZLSelectView()

// 按钮的父视图
@property (nonatomic, strong) UIView *bgView;
// 按钮底部红色线
@property (nonatomic, strong) UIView *redlineView;
// 选中状态下的线
@property (nonatomic, strong) UIView *selectedLineView;
// 记录当前选中的是第几个按钮
@property (nonatomic, assign) NSUInteger selectedIndex;

@end



@implementation Module2ZLSelectView

- (UIView *)bgView {
    if(!_bgView) {
        _bgView = [[UIView alloc] initWithFrame:self.bounds];
        _bgView.backgroundColor = ZLBgColor;
    }
    return _bgView;
}
- (UIView *) redlineView {
    if(!_redlineView) {
        _redlineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bgView.bounds.size.height-1, self.bounds.size.width, 1)];
        _redlineView.backgroundColor = [UIColor colorWithRed:189/255.0 green:169/255.0 blue:130/255.0 alpha:1];
//        _redlineView.backgroundColor = [UIColor clearColor];
    }
    return _redlineView;
}
- (UIView *) selectedLineView {
    if(!_selectedLineView) {
        _selectedLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.bgView.bounds.size.height-2, 72, 3)];
        _selectedLineView.backgroundColor = ZLSelectedColor;
    }
    return _selectedLineView;
}

- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray images:(NSArray *)imagesArray {
    self = [super initWithFrame:frame];
    if(self) {
        [self addSubview:self.bgView];
//        [self.bgView addSubview:self.redlineView];
        [self.bgView addSubview:self.selectedLineView];
        self.selectedIndex = 0;
        [self createButtonWithTitles:titleArray images:imagesArray];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame titles:(NSArray *)titleArray {
    return [self initWithFrame:frame titles:titleArray images:nil];
}

- (void) createButtonWithTitles:(NSArray *)titles images:(NSArray *)images {
    NSInteger btncount = titles.count;
    CGFloat btnWidth = self.bgView.bounds.size.width / btncount;
    CGFloat btnHeight = self.bgView.bounds.size.height;
    
    for (int i=0; i<btncount; i++) {
        CGFloat btnX = btnWidth*i;
        CGFloat btnY = 0;
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(btnX, btnY, btnWidth, btnHeight)];
        [btn setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
        [btn setTitleColor:ZLCommonColor forState:UIControlStateNormal];
        [btn setTitleColor:ZLSelectedColor forState:UIControlStateSelected];
        btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        btn.tag = Module2ZLSelectViewBtnFlag + i;
        [btn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.bgView addSubview:btn];
    }
    
    UIButton *oldBtn = [self.bgView viewWithTag:(self.selectedIndex + Module2ZLSelectViewBtnFlag)];
    self.selectedLineView.center = CGPointMake(oldBtn.frame.origin.x+oldBtn.bounds.size.width/2, self.selectedLineView.center.y);
    oldBtn.selected = YES;
}

- (void) buttonAction:(UIButton *)sender {
    if(self.selectedIndex != sender.tag - Module2ZLSelectViewBtnFlag) {
        UIButton *oldBtn = [self.bgView viewWithTag:(self.selectedIndex + Module2ZLSelectViewBtnFlag)];
        oldBtn.selected = NO;
        [oldBtn setTitleColor:ZLCommonColor forState:UIControlStateNormal];
        
        sender.selected = YES;
        self.selectedIndex = sender.tag - Module2ZLSelectViewBtnFlag;
        [UIView animateWithDuration:0.3 animations:^{
            self.selectedLineView.center = CGPointMake(sender.frame.origin.x+sender.bounds.size.width/2, self.selectedLineView.center.y);
        }];
        
        [self.delegateOfModule2ZLSelectView Module2ZLSelectViewDidSelect:self.selectedIndex];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
