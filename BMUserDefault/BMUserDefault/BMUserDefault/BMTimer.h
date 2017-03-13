//
//  BMTimer.h
//  BMUserDefault
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^_Nonnull BMTimerBlock)();

@interface BMTimer : NSObject

- (instancetype _Nonnull)initWithInterval:(NSTimeInterval)interval repeat:(BOOL)repeat Block:(BMTimerBlock)block;


- (void)fire;

/** 关闭timer，关闭之后不能重新使用 */
- (void)invalidate;

@end
