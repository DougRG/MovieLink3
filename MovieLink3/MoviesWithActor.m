//
//  Movie.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "MoviesWithActor.h"

@implementation MoviesWithActor

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        if (dictionary[@"title"]) {
            self.title = dictionary[@"title"];
        }
        if (dictionary[@"id"]) {
            self.movieIDNumber = dictionary[@"id"];
        }
        if (dictionary[@"release_date"]) {
            self.yearOfRelease = dictionary[@"release_date"];
        }
    }
    
    return self;
}

@end
