//
//  Movie.h
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoviesWithActor : NSObject

@property (strong, nonatomic) NSArray *actorFilmography;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSNumber *movieIDNumber;
@property (strong, nonatomic) NSString *yearOfRelease;


- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
