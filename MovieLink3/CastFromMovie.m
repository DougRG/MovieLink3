//
//  ActorsFromMovie.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "CastFromMovie.h"

@implementation CastFromMovie

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        if (dictionary[@"name"]) {
            self.actorName = dictionary[@"name"];
        }
        if (dictionary[@"id"]) {
            self.actorIDNumber = dictionary[@"id"];
        }
    }
    return self;
    
}


@end
