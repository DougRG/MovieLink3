//
//  ActorSearchViewController.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "ActorSearchViewController.h"
#import "MovieAndActorController.h"
#import "Actor.h"
#import "PickActorsViewController.h"

@interface ActorSearchViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ActorSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    [[MovieAndActorController sharedInstance] getActorIDAndName:searchBar.text completion:^(BOOL success) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [MovieAndActorController sharedInstance].actorSearchResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    
    Actor *actor = [MovieAndActorController sharedInstance].actorSearchResults[indexPath.row];
    
    cell.textLabel.text = actor.actorName;
    
    return cell;
}



 #pragma mark - Navigation

// - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//     if ([segue.identifier isEqualToString:@"actor1Segue"]) {
//         PickActorsViewController *pickActorVC = segue.destinationViewController;
//         NSIndexPath *indexPath = [self.tableView indexPathForCell:(UITableViewCell *)sender];
//         Actor *actor = [[MovieAndActorController sharedInstance].actorSearchResults objectAtIndex:indexPath.row];
//         
//         if ([pickActorVC.actor1Button.titleLabel  isEqual: @"Select 1st Actor"]) {
//             pickActorVC.actor1Button.titleLabel = actor.actorName;
//         }
//     }
//     

// }


@end
