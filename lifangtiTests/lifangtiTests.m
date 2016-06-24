//
//  lifangtiTests.m
//  lifangtiTests
//
//  Created by xthink4 on 16/6/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "UtilityHeader.h"
@interface lifangtiTests : XCTestCase

@end

@implementation lifangtiTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    
}

- (void)testExample {
  
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.

    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        
        // Put the code you want to measure the time of here.
    }];
}
-(void)testNumber
{
    
    if ([UtilityForString isValidateMobile:@"13322282909"]) {
        NSLog(@"Yes____________________________Mobile");
    }
    else{
        NSLog(@"No_____________________________Mobile");
    }
}
-(void)testla
{
    
    NSLog(@"%@",[UtilityLanguage NSNewloca]);
}


@end
