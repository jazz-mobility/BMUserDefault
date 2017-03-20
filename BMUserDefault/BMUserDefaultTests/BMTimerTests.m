//
//  BMTimerTests.m
//  BMUserDefault
//
//  Created by bomo on 2017/3/16.
//  Copyright © 2017年 bomo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BMTimer.h"

@interface BMTimerTests : XCTestCase

@end

@implementation BMTimerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    [self expectationWithDescription:@"dfs"];
    
    BMTimer *timer = [[BMTimer alloc] initWithInterval:2 repeat:YES Block:^{
        NSLog(@"aaaaaa");
    }];
    
    NSLog(@"start");
    [timer fire];
    [timer fire];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [timer invalidate];
        [timer invalidate];
        [timer fire];
        
    });
    
    [self waitForExpectationsWithTimeout:10 handler:nil];
}

@end
