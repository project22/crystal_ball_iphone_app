//
//  ViewController.m
//  CrtstalBall
//
//  Created by Jon Paul Berti on 9/24/13.
//  Copyright (c) 2013 com.company. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize predictionArray;
@synthesize imageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UIImage *image = [UIImage imageNamed:@"background.png"];
    self.imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:self.imageView atIndex:0];
    
    self.imageView.animationImages = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"cball00001"],
                                                                    [UIImage imageNamed:@"cball00002"],
                                                                    [UIImage imageNamed:@"cball00003"],
                                                                    [UIImage imageNamed:@"cball00004"],
                                                                    [UIImage imageNamed:@"cball00005"],
                                                                    [UIImage imageNamed:@"cball00006"],
                                                                    [UIImage imageNamed:@"cball00007"],
                                                                    [UIImage imageNamed:@"cball00008"],
                                                                    [UIImage imageNamed:@"cball00009"],
                                                                    [UIImage imageNamed:@"cball00010"],
                                                                    [UIImage imageNamed:@"cball00011"],
                                                                    [UIImage imageNamed:@"cball00012"],
                                                                    [UIImage imageNamed:@"cball00013"],
                                                                    [UIImage imageNamed:@"cball00014"],
                                                                    [UIImage imageNamed:@"cball00015"],
                                                                    [UIImage imageNamed:@"cball00016"],
                                                                    [UIImage imageNamed:@"cball00017"],
                                                                    [UIImage imageNamed:@"cball00018"],
                                                                    [UIImage imageNamed:@"cball00019"],
                                                                    [UIImage imageNamed:@"cball00020"],
                                                                    [UIImage imageNamed:@"cball00021"],
                                                                    [UIImage imageNamed:@"cball00022"],
                                                                    [UIImage imageNamed:@"cball00023"],
                                                                    [UIImage imageNamed:@"cball00024"], nil];
    self.imageView.animationDuration = 1.0;
    self.imageView.animationRepeatCount = 1;
    
    self.predictionArray = [[NSArray alloc] initWithObjects:
                                @"For sure!",
                                @"That makes sense",
                                @"Not happening that way",
                                @"No way Jose!",
                                @"I doubt it",
                                @"I'll tell you later",
                                @"Meditate and try again",
                                @"I'll tell you later", nil];
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) makePrediction {
    
    NSUInteger index = arc4random_uniform(self.predictionArray.count);
    [self.imageView startAnimating];
    self.predictionLabel.text = [self.predictionArray objectAtIndex:index];
    [UIView animateWithDuration:2.0 animations:^{
        self.predictionLabel.alpha = 1.0;
    }];
}

-(BOOL) canBecomeFirstResponder {
    return YES;
}

-(void) motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
//    NSLog(@"Motion Began");
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0;
}

-(void) motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if ( motion == UIEventSubtypeMotionShake) {
//         NSLog(@"Motion Ended");
        [self makePrediction];
    }
}

-(void) motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"Motion Cancelled");
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.predictionLabel.text = nil;
    self.predictionLabel.alpha = 0.0;
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self makePrediction];
}

@end
