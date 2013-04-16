//
//  UIImage+Symmetric.h
//  CustomDrawing
//
//  Created by Sufiyan Yasa on 4/14/13.
//  Copyright (c) 2013 Sufiyan Yasa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Symmetric)
+(id)symmetricImageNamed:(NSString*)fileName horizontalSplit:(BOOL)isHorizontal;
@end
