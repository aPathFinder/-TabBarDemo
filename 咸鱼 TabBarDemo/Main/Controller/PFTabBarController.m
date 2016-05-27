//
//  PFTabBarController.m
//  咸鱼 TabBarDemo
//
//  Created by Mac on 16/5/14.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PFTabBarController.h"
#define RGB(r,g,b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

#import "PFHomeController.h"
#import "PFMineController.h"
#import "PFMessageController.h"
#import "PFSameCityController.h"

#import "PFTabBar.h"

@implementation PFTabBarController

- (void)viewDidLoad{
    [super viewDidLoad];
    //文本色
    [self setupTabBarItemTextAttributes];
    //子控制器
    [self setupChildViewController];
    //处理 tabbar
    [self setupTabBar];
    
    //通过设置颜色,去除 tabbar 顶部黑线;
    [[UITabBar appearance] setBackgroundImage:[self imageWithColor:[UIColor whiteColor]]];
    //取出 TabBar 自带的顶部阴影
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    //设置 Nav 为黄色
    [[UINavigationBar appearance] setBackgroundImage:[self imageWithColor:RGB(253,218,68)] forBarMetrics:UIBarMetricsDefault];
    
    
}

#pragma mark - Private Methods
//KVC 更改readOnly;
- (void)setupTabBar{
    [self setValue:[[PFTabBar alloc] init] forKey:@"tabBar"];
}

//tabBarItem 的选中不选中文字属性
- (void)setupTabBarItemTextAttributes{
    //普通状态下的文字属性
    NSMutableDictionary * normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    //选中
    NSMutableDictionary * selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    //文字属性
    UITabBarItem * tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}

//子控制器
- (void)setupChildViewController{
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[PFHomeController alloc]init]]
                          WithTitle:@"首页"
                          imageName:@"home_normal"
                  selectedImageName:@"home_highlight"];
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[PFSameCityController alloc] init]]
                          WithTitle:@"同城"
                          imageName:@"mycity_normal"
                  selectedImageName:@"mycity_highlight"];
    
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[PFMessageController alloc]init]]
                          WithTitle:@"消息"
                          imageName:@"message_normal"
                  selectedImageName:@"message_highlight"];
    
    
    [self addOneChildViewController:[[UINavigationController alloc]initWithRootViewController:[[PFMineController alloc]init]]
                          WithTitle:@"我的"
                          imageName:@"account_normal"
                  selectedImageName:@"account_highlight"];
    
}

- (void)addOneChildViewController:(UIViewController *)viewController WithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    
    viewController.view.backgroundColor     = [UIColor magentaColor];
    viewController.tabBarItem.title         = title;
    viewController.tabBarItem.image         = [UIImage imageNamed:imageName];
    UIImage *image = [UIImage imageNamed:selectedImageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = image;
    [self addChildViewController:viewController];
    
}

- (UIImage *)imageWithColor:(UIColor *)color{
    NSParameterAssert(color != nil);
    
    CGRect rect = CGRectMake(0, 0, 1, 1);
    // Create a 1 by 1 pixel context
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    [color setFill];
    UIRectFill(rect);   // Fill it with your color
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
