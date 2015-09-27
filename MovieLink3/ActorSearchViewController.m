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


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
