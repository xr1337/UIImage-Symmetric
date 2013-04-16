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

- (void)testImageVerticalSlice
{
    UIImage *halfImage = [ UIImage imageNamed:@"sym_half.png"];
    CGSize halfImageSize = halfImage.size;
    
    UIImage *fullImage = [UIImage symmetricImageNamed:@"sym_half.png" horizontalSplit:NO];
    STAssertTrue(fullImage.size.width == halfImageSize.width*2, @"Failed to double the width");
    STAssertTrue(fullImage.size.height == halfImageSize.height, @"Height should not have changed");
    
}


- (void)testImageHorizontalSlice
{
    UIImage *halfImage = [ UIImage imageNamed:@"stop_half.png"];
    CGSize halfImageSize = halfImage.size;
    
    UIImage *fullImage = [UIImage symmetricImageNamed:@"stop_half.png" horizontalSplit:YES];
    STAssertTrue(fullImage.size.width == halfImageSize.width, @"Width should not have changed.");
    STAssertTrue(fullImage.size.height == halfImageSize.height*2, @"Failed to double the Height ");
    
}
@end
