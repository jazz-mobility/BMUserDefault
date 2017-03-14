//
//  UserInfoService.m
//  BMUserDefault
//
//  Created by bomo on 2017/3/14.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import "UserInfoService.h"

@implementation UserInfoService

@dynamic name;
@dynamic age;
@dynamic array;
@dynamic dict;

- (void)setUserId:(NSString *)userId
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist", userId]];
    self.userDefaults = [BMUserDefault userDefaultWithPath:path];
}

@end
