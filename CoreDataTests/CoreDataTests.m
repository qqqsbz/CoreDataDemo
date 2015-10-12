//
//  CoreDataTests.m
//  CoreDataTests
//
//  Created by coder on 15/10/10.
//  Copyright (c) 2015年 coder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface CoreDataTests : XCTestCase

@end

@implementation CoreDataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"begin test");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"stop test");
}


- (void)testExample {
    // This is an example of a functional test case.
//    ViewController *vc = [[ViewController alloc] init];
//    NSInteger number = [vc addNumber:1 number2:2];
//    XCTAssertEqual(3, number);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
//    [self measureBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"]]];
//        XCTAssert(image != nil);
//    }];
    
//    XCTestExpectation *expectation = [self expectationWithDescription:@"time out"];
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //6 vvsleep(1);
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://ugarden.qiniudn.com/resources/upload/penyou/launch-image"]]];
//        [expectation fulfill];
//    });
//    [self waitForExpectationsWithTimeout:0.1 handler:^(NSError *error) {
//        NSLog(@"time out");
//    }];
}

@end
