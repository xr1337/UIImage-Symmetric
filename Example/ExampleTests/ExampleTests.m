//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Sufiyan Yasa on 4/14/13.
//  Copyright (c) 2013 Sufiyan Yasa. All rights reserved.
//


#import <SenTestingKit/SenTestingKit.h>
#import "UIImage+Symmetric.h"

@interface ExampleTests : SenTestCase

@end


@implementation ExampleTests

- (void)testImageSize
{
    UIImage *halfImage = [ UIImage imageNamed:@"half.png"];
    CGSize halfImageSize = halfImage.size;
    
    UIImage *fullImage = [UIImage symmetricImageNamed:@"half.png"];
    STAssertTrue(fullImage.size.width == halfImageSize.width*2, @"Failed to double the width");
    STAssertTrue(fullImage.size.height == halfImageSize.height, @"Height should not have changed");
    
}

@end
