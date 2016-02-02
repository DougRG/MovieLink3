//
//  ViewController.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.

#import "Game1ViewController.h"
#import "NetworkController.h"
#import "Game1MovieTableViewCell.h"
#import "Game1FinalActorTableViewCell.h"
#import "Game1ActorTableViewCell.h"
#import "MovieAndActorController.h"
#import "MoviesWithActor.h"
#import "PickActorsViewController.h"
#import "Timer.h"

//static const NSArray *actorArray = @[@"!love obj c"];
@interface Game1ViewController () <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
    
@property (strong, nonatomic) IBOutlet UITextField *movieTextField;
@property (strong, nonatomic) IBOutlet UITextField *actorTextField;

//@property (nonatomic, strong) NSArray *gameMoves;
@property (nonatomic, strong) UIPickerView *actorsPickerView;
@property (nonatomic, strong) UIPickerView *moviesPickerView;

@property (nonatomic, strong) UIToolbar *toolbar;



@end
@implementation Game1ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
    NSLog(@"%@", self.actor1Label.text);
    NSLog(@"%@", self.actor2Label.text);
    
    self.actorsPickerView = [[UIPickerView alloc] init];
    self.actorsPickerView.delegate = self;
    self.actorsPickerView.dataSource = self;
    self.actorsPickerView.backgroundColor = [UIColor grayColor];
    
    self.moviesPickerView = [[UIPickerView alloc] init];
    self.moviesPickerView.delegate = self;
    self.moviesPickerView.dataSource = self;
    self.moviesPickerView.backgroundColor = [UIColor grayColor];
    
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithTitle:@"DONE" style:UIBarButtonItemStyleDone target:self action:@selector(doneButtonPressed)];
    
    [self.toolbar setItems:@[done] animated:true];
    
//    self.gameMoves = @[@"", @"", @""];
//        Game1ViewController *game1VC = [Game1ViewContaroller new];

}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.actor1Label.text = self.actor1.actorName;
    self.actor2Label.text = self.actor2.actorName;
}

//- (BOOL)isMovieCell {
//    if () {
//        <#statements#>
//    }
//}


#pragma MARK - TableView DataSource Protocols

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//    return self.gameMoves.count;
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0 || indexPath.row %2 == 0) {
        Game1MovieTableViewCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
        return movieCell;
        
    } else {
        
    Game1ActorTableViewCell *actorCell = [tableView dequeueReusableCellWithIdentifier:@"ActorCell"];
    
        return actorCell;
   }
}

#pragma MARK - PickerView DataSource Protocols

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.actorsPickerView) {
        return [[MovieAndActorController sharedInstance]actorsFromMovieArray].count;
    }
    return [[MovieAndActorController sharedInstance]moviesWithActorArray].count;
    
    
//    if (self.isMovieCell == YES) {
//        return [[MovieAndActorController sharedInstance]moviesWithActorArray].count;
//    } else {
//        return [[MovieAndActorController sharedInstance]actorsFromMovieArray].count;
//    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (pickerView == self.actorsPickerView) {
        MoviesWithActor *movie = [[MovieAndActorController sharedInstance]moviesWithActorArray][row];
        
        NSString *movieName = [NSString stringWithFormat:(@"%@"), movie.title];
        return movieName;
    }
    Actor *actor = [[MovieAndActorController sharedInstance]actorsFromMovieArray][row];
    
    NSString *actorName = [NSString stringWithFormat:(@"%@"), actor.actorName];
    return actorName;
    
    
    
    
    
    
//    NSString *title = [NSString new];
//
//    if (self.isMovieCell == YES) {
//        title = [[MovieAndActorController sharedInstance]moviesWithActorArray][row];
//    } else {
//        title = [[MovieAndActorController sharedInstance]actorsFromMovieArray][row];
//    }
//    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    [pickerView resignFirstResponder];
}

#pragma MARK - TextField and Cell Methods

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    self.movieTextField.inputView = self.moviesPickerView;
    self.actorTextField.inputView = self.actorsPickerView;
    textField.inputAccessoryView = self.toolbar;
    [textField reloadInputViews];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)doneButtonPressed {
    [self.view endEditing:true];
}





@end