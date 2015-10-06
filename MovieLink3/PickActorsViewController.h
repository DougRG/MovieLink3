//
//  PickActorsViewController.h
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Actor.h"

@interface PickActorsViewController : UIViewController

@property (weak, nonatomic, readwrite) IBOutlet UIButton *actor1Button;
@property (weak, nonatomic, readwrite) IBOutlet UIButton *actor2Button;
@property (weak, nonatomic) IBOutlet UIButton *playButton;

@property (strong, nonatomic) NSString *actor1ID;
@property (strong, nonatomic) NSString *actor2ID;

@property (strong, nonatomic) Actor *actor1;
@property (strong, nonatomic) Actor *actor2;

@end
