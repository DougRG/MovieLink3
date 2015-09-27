//
//  ActorsFromMovie.h
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CastFromMovie : NSObject

//@property (strong, nonatomic) NSArray *castCredits;
@property (strong, nonatomic) NSString *actorName;
@property (strong, nonatomic) NSNumber *actorIDNumber;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
