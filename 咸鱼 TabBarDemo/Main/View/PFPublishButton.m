//
//  PFPublishButton.m
//  咸鱼 TabBarDemo
//
//  Created by Mac on 16/5/14.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "PFPublishButton.h"

@interface PFPublishButton ()<UIActionSheetDelegate>

@end
@implementation PFPublishButton

#pragma mark - Private Methods

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //控件大小,间距大小
    CGFloat const imageViewEdge = self.bounds.size.width * 0.6;
    CGFloat const centerOfView = self.bounds.size.width * 0.5;
    CGFloat const labelLineHeight = self.titleLabel.font.lineHeight;
    CGFloat const verticalMarginT = self.bounds.size.height - labelLineHeight - imageViewEdge;
    CGFloat const verticalMargin = verticalMarginT / 2;
    
    //imageView 和 titleLabel 中心的 Y 值;
    CGFloat const centerOfImageView = verticalMargin + imageViewEdge * 0.5;
    CGFloat const centerOfTitleLabel = imageViewEdge + verticalMargin * 2 + labelLineHeight * 0.5 + 5;
    
    //imageView position 位置
    self.imageView.bounds = CGRectMake(0, 0, 60, 60);
    //CGRectMake(0, 0, imageViewEdge + 15, imageViewEdge );
    self.imageView.center = CGPointMake(centerOfView, centerOfImageView);
    
    //Label position 位置
    self.titleLabel.bounds = CGRectMake(0, 0, self.bounds.size.width, labelLineHeight);
    self.titleLabel.center = CGPointMake(centerOfView, centerOfTitleLabel);
    //CGRectMake(centerOfView, centerOfImageView, centerOfView, centerOfImageView)
    
    
}




#pragma makr - init

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //图片点击时,颜色不会渲染加深
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

#pragma mark - PublishMethods

+ (instancetype)publishButton{
    
    PFPublishButton * btn = [[PFPublishButton alloc] init];
    [btn setImage:[UIImage imageNamed:@"post_normal"] forState:UIControlStateNormal];
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:9.5];
    
    [btn sizeToFit];
    
    [btn addTarget:btn action:@selector(clickPublish:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

- (void)clickPublish: (UIButton *)btn{
    /*
    //行为表单;
    UITabBarController * tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController * viewController = tabBarController.selectedViewController;
    UIActionSheet * actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册选取",@"淘宝一键转卖",nil];
    [actionSheet showInView:viewController.view];
     */
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex{
    
    
}


@end
