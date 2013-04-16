//
//  ViewController.m
//  Example
//
//  Created by Sufiyan Yasa on 4/14/13.
//  Copyright (c) 2013 Sufiyan Yasa. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Symmetric.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.horizontalSplitImageView.image = [UIImage symmetricImageNamed:@"sym_half.png" horizontalSplit:NO];
    self.verticalSplitImageView.image = [UIImage symmetricImageNamed:@"stop_half.png" horizontalSplit:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
