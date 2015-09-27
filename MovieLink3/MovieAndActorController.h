//
//  MovieController.h
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieAndActorController : NSObject

@property (nonatomic, strong) NSArray *actorSearchResults;
@property (nonatomic, strong, readonly) NSArray *moviesWithActorArray;
@property (nonatomic, strong, readonly) NSArray *actorsFromMovieArray;

+ (MovieAndActorController *)sharedInstance;

- (void) getActorIDAndName:(NSString *)searchTerm completion:(void (^) (BOOL success)) completion;

- (void) getMoviesWithActorWithID:(NSString *)searchTerm completion:(void (^) (BOOL success)) completion;

- (void) getActorsFromMovieWithID:(NSString *)searchTerm completion:(void (^) (BOOL success)) completion;


@end
