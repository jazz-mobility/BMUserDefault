//
//  UserInfoService.h
//  BMUserDefault
//
//  Created by bomo on 2017/3/14.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMPropertyUserDefault.h"

@interface UserInfoService : BMPropertyUserDefault

@property (nonatomic, weak) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, weak) NSArray *array;
@property (nonatomic, weak) NSDictionary *dict;


- (void)setUserId:(NSString *)userId;


@end
