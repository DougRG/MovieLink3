//
//  Game1FinalActorTableViewCell.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/29/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "Game1FinalActorTableViewCell.h"

@interface Game1FinalActorTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *actor2TextField;



@end

@implementation Game1FinalActorTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)configureCellWithActor2Name:(NSString *)name {
    
    self.actor2TextField.text = name;
}



@end
