//
//  BMUserDefaultTests.m
//  BMUserDefaultTests
//
//  Created by bomo on 2017/3/13.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BMUserDefault.h"
#import "BMUserDefault+Test.h"
#import "UserInfoService.h"


@interface BMUserDefaultTests : XCTestCase

@end

@implementation BMUserDefaultTests

- (void)setUp {
    [super setUp];
    self.continueAfterFailure = NO;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testProperty
{
    UserInfoService *service = [[UserInfoService alloc] init];
    [service setUserId:@"cc"];
    
    NSString *name = [[NSUUID UUID] UUIDString];
    NSArray *array = @[@"a", @"b", @"c"];
    NSDictionary *dict = @{@"a": @"fdsa", @"b": @"vewf"};
    service.name = name;
    service.age = 12;
    
    service.array = array;
    service.dict = dict;
    
    XCTAssertEqualObjects(service.name, name, @"set value fail");
    XCTAssertTrue(service.age == 12, @"set value fail");
    XCTAssertEqualObjects(service.array, array, @"set value fail");
    XCTAssertEqualObjects(service.dict, dict, @"set value fail");
    
    [service setUserId:@"bb"];
    XCTAssertNotEqualObjects(service.name, name, @"set value fail");
    
    [service setUserId:@"cc"];
    XCTAssertEqualObjects(service.name, name, @"set value fail");
}

- (void)testTimes
{    
    for (int i = 0; i < 300; i++) {
        @autoreleasepool {
            [self testCache];
            [self testStore];
        }
    }
}

- (void)testCache
{
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"test2.plist"];
    NSString *path2 = [NSString stringWithFormat:@"%@", path];
    BMUserDefault *userDefault = [BMUserDefault userDefaultWithPath:path];
    BMUserDefault *userDefault2 = [BMUserDefault userDefaultWithPath:path2];
    
    XCTAssertEqual(userDefault, userDefault2, @"mast use same instance with same path");
}

- (void)testStore {
    NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:@"test.plist"];
    
    BMUserDefault *userDefault = [BMUserDefault userDefaultWithPath:path];
    
    NSString *stringValue = [userDefault stringForKey:@"string"];
    BOOL boolValue = [userDefault boolForKey:@"bool"];
    NSInteger intValue = [userDefault integerForKey:@"int"];
    double doubleValue = [userDefault doubleForKey:@"double"];
    NSURL *urlValue = [userDefault URLForKey:@"url"];
    NSArray *arrayValue = [userDefault arrayForKey:@"array"];
    NSDictionary *dictValue = [userDefault dictionaryForKey:@"dict"];
    NSData *dataValue = [userDefault dataForKey:@"data"];
    
    //新值
    stringValue = [[NSUUID UUID] UUIDString];
    boolValue = !boolValue;
    intValue = intValue+1;
    doubleValue = doubleValue + 0.3;
    NSString *newUrl = [NSString stringWithFormat:@"http://example.com/uid=%@", stringValue];
    urlValue = [NSURL URLWithString:newUrl];
    arrayValue = @[stringValue, stringValue];
    dictValue = @{@"abc": stringValue, @"def": stringValue};
    dataValue = [stringValue dataUsingEncoding:NSUTF8StringEncoding];
    
    //赋值
    [userDefault setObject:stringValue forKey:@"string"];
    [userDefault setBool:boolValue forKey:@"bool"];
    [userDefault setInteger:intValue forKey:@"int"];
    [userDefault setDouble:doubleValue forKey:@"double"];
    [userDefault setURL:urlValue forKey:@"url"];
    [userDefault setObject:arrayValue forKey:@"array"];
    [userDefault setObject:dictValue forKey:@"dict"];
    [userDefault setObject:dataValue forKey:@"data"];

    //存储
    [userDefault synchronize];

    XCTAssertTrue([userDefault isChanged], @"数据错误");
    
    //验证
    BMUserDefault *userDefault2 = [BMUserDefault userDefaultWithPath:path];
    NSString *stringValue2 = [userDefault2 stringForKey:@"string"];
    BOOL boolValue2 = [userDefault2 boolForKey:@"bool"];
    NSInteger intValue2 = [userDefault2 integerForKey:@"int"];
    double doubleValue2 = [userDefault2 doubleForKey:@"double"];
    NSURL *urlValue2 = [userDefault2 URLForKey:@"url"];
    NSArray *arrayValue2 = [userDefault2 arrayForKey:@"array"];
    NSDictionary *dictValue2 = [userDefault2 dictionaryForKey:@"dict"];
    NSData *dataValue2 = [userDefault2 dataForKey:@"data"];
    
    XCTAssertEqualObjects(stringValue, stringValue2, @"数据错误");
    XCTAssertEqual(boolValue, boolValue2, @"数据错误");
    XCTAssertEqual(intValue, intValue2, @"数据错误");
    XCTAssertEqual(doubleValue, doubleValue2, @"数据错误");
    XCTAssertEqualObjects(urlValue, urlValue2, @"数据错误");
    XCTAssertEqualObjects(arrayValue, arrayValue2, @"数据错误");
    XCTAssertEqualObjects(dictValue, dictValue2, @"数据错误");
    XCTAssertEqualObjects(dataValue, dataValue2, @"数据错误");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
