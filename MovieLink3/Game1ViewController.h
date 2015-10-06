//
//  ViewController.h
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Actor.h"

@interface Game1ViewController : UIViewController

@property (strong, nonatomic) Actor *actor1;
@property (strong, nonatomic) Actor *actor2;

//@property (nonatomic, strong) NSString *actor1;
//@property (nonatomic, strong) NSString *actor2;
@property (nonatomic, strong) NSString *actor1ID;
@property (nonatomic, strong) NSString *actor2ID;
@property (nonatomic, strong) NSArray *actor1Movies;
@property (nonatomic, strong) NSArray *actor2Movies;

@property (nonatomic) BOOL isMovieCell;

@property (strong, nonatomic) IBOutlet UILabel *actor1Label;
@property (strong, nonatomic) IBOutlet UILabel *actor2Label;




@end

