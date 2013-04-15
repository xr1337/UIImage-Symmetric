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


+(id)symmetricImageNamed:(NSString*)fileName{
    if (!imageCache) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            imageCache = [[NSCache alloc]init];
        });
    }
    
    //1.capture from the catch
    UIImage *newImage = [imageCache objectForKey:fileName];
    //2. cache missed, create the image again.
    if (!newImage) {
        UIImage *image = [UIImage imageNamed:fileName];
        UIImage *flippedImage =[UIImage imageWithCGImage:image.CGImage scale:1.0 orientation: UIImageOrientationUpMirrored];
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width*2, image.size.height), NO, [UIScreen mainScreen].scale);
        [image drawAtPoint:CGPointZero ];
        [flippedImage drawAtPoint:CGPointMake(image.size.width, 0)];
        newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        [imageCache setObject:newImage forKey:fileName];
    }
    return newImage;
}

@end
