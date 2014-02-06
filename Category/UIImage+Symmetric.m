//
//  UIImage+Symmetric.m
//  CustomDrawing
//
//  Created by Sufiyan Yasa on 4/14/13.
//  Copyright (c) 2013 Sufiyan Yasa. All rights reserved.
//

#import "UIImage+Symmetric.h"

@implementation UIImage (Symmetric)


static NSCache *imageCache;

//Initialize the cache on program startup.
//Comment this block for lazy initializing instead
__attribute__((constructor))
static void initialize_image_cache() {
    imageCache = [[NSCache alloc]init];
}
__attribute__((destructor))
static void destroy_image_cache() {
    [imageCache removeAllObjects];
}

+(id)symmetricImageNamed:(NSString*)fileName horizontalSplit:(BOOL)isHorizontal {
    if (!imageCache) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            imageCache = [[NSCache alloc]init];
        });
    }
    
    UIImage *newImage = [imageCache objectForKey:fileName];
    //Check if we missed a cache
    if (!newImage) {
        UIImage *image = [UIImage imageNamed:fileName];
        UIImage *flippedImage;
        
        CGSize newSize = CGSizeMake(image.size.width*2, image.size.height);
        CGPoint otherPoint = CGPointMake(image.size.width, 0);
        if (isHorizontal) {//horizontal split images
            newSize = CGSizeMake(image.size.width, image.size.height*2);
            otherPoint =CGPointMake(0, image.size.height);
            flippedImage =[UIImage imageWithCGImage:image.CGImage
                                              scale:1.0
                                        orientation:UIImageOrientationDownMirrored];
        }else{ //vertical split images
            flippedImage =[UIImage imageWithCGImage:image.CGImage
                                              scale:1.0
                                        orientation:UIImageOrientationUpMirrored];
        }
        
        UIGraphicsBeginImageContextWithOptions(newSize, NO, [UIScreen mainScreen].scale);
        [image drawAtPoint:CGPointMake(0, 0) ];
        [flippedImage drawAtPoint:otherPoint];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        //save a copy to cache
        [imageCache setObject:newImage forKey:fileName];
    }
    return newImage;
}

@end
