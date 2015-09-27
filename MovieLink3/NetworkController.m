//
//  NetworkController.m
//  MovieLink3
//
//  Created by Douglas Goodwin on 9/26/15.
//  Copyright © 2015 Dr.G. All rights reserved.
//

#import "NetworkController.h"

static NSString *kAPIKey = @"16ab3313172c7a064195a372c08322e2";

@implementation NetworkController


+ (NSString *)baseURL {
    return @"https://api.themoviedb.org/3/";
}


// This returns actors ID after searching by name
+ (NSString *)getActorID:(NSDictionary *)actorName {
    
    NSString *urlString = [NetworkController baseURL];
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"search/person?include_adult=false&api_key=%@&query=", kAPIKey]];
    
    urlString = [urlString stringByAppendingString:[actorName[@"term"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    return urlString;
}



// This returns an actors filmography
+ (NSString *)getMoviesWithActor:(NSDictionary *)actorID {
    
    NSString *urlString = [NetworkController baseURL];
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"person/"]];
    
    urlString = [urlString stringByAppendingString:[actorID[@"term"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"/movie_credits?api_key=%@", kAPIKey]];
    
    return urlString;
}



// This returns the cast of a movie
+ (NSString *)getCastFromMovie:(NSDictionary *)movieID {
    
    NSString *urlString = [NetworkController baseURL];
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"movie/"]];
    
    urlString = [urlString stringByAppendingString:[movieID[@"term"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    urlString = [urlString stringByAppendingString:[NSString stringWithFormat:@"/credits?api_key=%@", kAPIKey]];

    return urlString;
}









@end
