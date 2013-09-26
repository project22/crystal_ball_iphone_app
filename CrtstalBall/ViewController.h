//
//  ViewController.h
//  CrtstalBall
//
//  Created by Jon Paul Berti on 9/24/13.
//  Copyright (c) 2013 com.company. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {

}
@property (strong, nonatomic) IBOutlet UILabel *predictionLabel;
@property (strong, nonatomic) NSArray *predictionArray;
@property (strong, nonatomic) UIImageView *imageView;

-(void) makePrediction;

@end
