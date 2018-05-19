//
//  ASTabBarControllerConfig.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CYLTabBarController.h"

@interface ASTabBarControllerConfig : NSObject

@property (nonatomic, readonly, strong) CYLTabBarController *tabBarController;
@property (nonatomic, copy) NSString *context;

@end
