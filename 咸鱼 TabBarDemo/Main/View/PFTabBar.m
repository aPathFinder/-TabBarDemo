//
//  PFTabBar.m
//  咸鱼 TabBarDemo
//
//  Created by Mac on 16/5/14.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PFTabBar.h"
#import "PFPublishButton.h"
#import "pushView.h"
#import "AppDelegate.h"

#define BTNNUM 5;

@interface PFTabBar ()

//发布
@property (nonatomic,strong) PFPublishButton * publishbtn;
@property(strong,nonatomic)pushView *myPushView;

@end

@implementation PFTabBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        PFPublishButton * publishBtn = [PFPublishButton publishButton];
        [self addSubview:publishBtn];
        
        self.publishbtn = publishBtn;
        [self.publishbtn addTarget:self action:@selector(pushClick) forControlEvents:UIControlEventTouchUpInside];
        
        self.myPushView = [[pushView alloc] init];
        
    }
    return self;
}

-(void)pushClick
{
    [[UIApplication sharedApplication].keyWindow addSubview:self.myPushView];
    [self.myPushView pushButton];
}

- (void)layoutSubviews{
    
    [super layoutSubviews];
    CGFloat barWidth = self.frame.size.width;
    CGFloat barHeight = self.frame.size.height;
    
    CGFloat btnW = barWidth / BTNNUM;
    CGFloat btnH = barHeight - 2;
    CGFloat btnY = 1;
    
    NSInteger btnIndex = 0;
    self.publishbtn.center = CGPointMake(barWidth * 0.5, barHeight * 0.3);
    for (UIView * view in self.subviews) {
        NSString * viewClass = NSStringFromClass([view class]);
        if (![viewClass isEqualToString:@"UITabBarButton"])
            continue;
        CGFloat btnX = btnIndex * btnW;
        if (btnIndex >= 2) {
            btnX += btnW;
        }
        
        view.frame = CGRectMake(btnX, btnY, btnW, btnH);
        btnIndex++;
        
    }
}


@end
