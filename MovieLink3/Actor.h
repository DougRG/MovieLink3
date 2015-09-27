//
//  Actor.h
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Actor : NSObject

@property (nonatomic, strong) NSString *actorName;
@property (nonatomic, strong) NSNumber *IDNumber;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
