//
//  PickActorsViewController.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "PickActorsViewController.h"
#import "ActorSearchViewController.h"
#import "NetworkController.h"
#import "Game1ViewController.h"
#import "Actor.h"
#import "MovieAndActorController.h"

@interface PickActorsViewController ()

@end

@implementation PickActorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)prepareForUnwindSegue:(UIStoryboardSegue *)segue {
    [[MovieAndActorController sharedInstance]getMoviesWithActorWithID:self.actor1ID completion:^(BOOL success, NSArray *movies) {
        NSLog(@"%@", [MovieAndActorController sharedInstance].moviesWithActorArray);
    }];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqual: @"playGameSegue"]) {
        
        Game1ViewController *game1VC = [segue destinationViewController];
        
        game1VC.actor1 = self.actor1;
        game1VC.actor2 = self.actor2;
        
        game1VC.actor1Label.text = self.actor1Button.titleLabel.text;
        game1VC.actor2Label.text = self.actor2Button.titleLabel.text;
        game1VC.actor1ID = self.actor1ID;
        game1VC.actor2ID = self.actor2ID;
        
        NSLog(@"%@", game1VC.actor1Label.text);
        
        [[MovieAndActorController sharedInstance]getMoviesWithActorWithID:self.actor1ID
    completion:^(BOOL success, NSArray *movies) {
        game1VC.actor1Movies = movies;
    }];
        
        [[MovieAndActorController sharedInstance]getMoviesWithActorWithID:self.actor2ID
                                                               completion:^(BOOL success, NSArray *movies) {
                                                                   game1VC.actor2Movies = movies;
                                                               }];
        NSLog(@"%@", self.actor1ID);
        NSLog(@"%@", self.actor2ID);
    } else {
    
         ActorSearchViewController *actorSearchVC = segue.destinationViewController;
        
        if([sender isEqual:self.actor1Button]) {
            
                    actorSearchVC.buttonID = 1;
                } else if ([sender isEqual:self.actor2Button]){
                    actorSearchVC.buttonID = 2;
                }
    }
}


@end
