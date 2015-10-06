//
//  Game1MovieTableViewCell.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/29/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "Game1MovieTableViewCell.h"
@interface Game1MovieTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextField *movieTextField;


@end

@implementation Game1MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCellWithMovieName:(NSString *)name {
    self.movieTextField.text = name;
}



@end
