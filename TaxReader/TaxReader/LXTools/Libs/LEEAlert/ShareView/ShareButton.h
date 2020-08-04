
/*!
 *  @header ShareButton.h
 *          MierMilitaryNews
 *
 *  @brief  分享按钮
 *
 *  @author 李响
 *  @copyright    Copyright © 2016年 miercn. All rights reserved.
 *  @version    16/4/19.
 */

#import <UIKit/UIKit.h>

typedef enum {
    ShareTypeToWechatTimeline = 0,//微信朋友圈
    ShareTypeToWechat,//微信好友
    ShareTypeToQQFriend,//QQ好友
    ShareTypeToSina,//新浪微博
    ShareTypeToQZone,//QQ空间
} ShareType;

@interface ShareButton : UIButton

/**
 *  上下间距
 */
@property (nonatomic , assign ) CGFloat range;


/**
 *  设置标题图标
 *
 *  @param title 标题
 *  @param image 图标
 */
- (void)configTitle:(NSString *)title Image:(UIImage *)image;

@end
