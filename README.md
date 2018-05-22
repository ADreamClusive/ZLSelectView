# ZLSelectView

使用方式：
使用cocoapods导入：pod 'ZLSelectView', '~>1.0.0'
手动导入：下载文件，只需将Classes文件导入到工程即可


样式：
![image](https://upload-images.jianshu.io/upload_images/1387177-da560f2b18c7f862.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/411)


使用方式：
#import <ZLSelectView.h>
@interface ViewController () <ZLSelectViewDelegate>
  

ZLSelectView *selectView = [[ZLSelectView alloc] initWithFrame:CGRectMake(0, 44, [UIScreen mainScreen].bounds.size.width, 30) titles:@[@"分栏1", @"分栏2",@"分栏3", @"分栏4"]];
    
[self.view addSubview:selectView];
    
selectView.delegateOfZLSelectView = self;

#pragma mark - ZLSelectViewDelegate
- (void)ZLSelectViewDidSelect:(NSUInteger)index {
    NSLog(@"当前选择：%lu", (unsigned long)index);
}
