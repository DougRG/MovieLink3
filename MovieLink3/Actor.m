//
//  Actor.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "Actor.h"

@implementation Actor

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    if (self) {
        if (dictionary[@"id"]) {
            self.IDNumber = dictionary[@"id"];
        }
        if (dictionary[@"name"]) {
            self.actorName = dictionary[@"name"];
        }
    }
    
    return self;
}

@end
