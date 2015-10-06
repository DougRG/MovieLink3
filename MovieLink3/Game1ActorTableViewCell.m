//
//  Game1ActorTableViewCell.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/29/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "Game1ActorTableViewCell.h"
#import "PickActorsViewController.h"
#import "Game1ViewController.h"

@interface Game1ActorTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *actorTextField;

@end


@implementation Game1ActorTableViewCell


- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithActorName:(NSString *)name {
    
    self.actorTextField.text = name;

}




@end
