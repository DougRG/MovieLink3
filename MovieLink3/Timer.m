//
//  Timer.m
//  The-Pomodoro-iOS8
//
//  Created by Mattthew Bailey on 7/21/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Timer.h"
#import "UIKit/UIKit.h"

static NSString * const expirationDate = @"expirationDate";

@interface Timer ()

@property (nonatomic, strong) NSDate *expirationDate;

@end

@implementation Timer

+ (Timer *)sharedInstance {
    static Timer *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [Timer new];
        
 //Instantiate Shared Instance Properties
        sharedInstance.seconds = 180;
    });
    return sharedInstance;
}

- (void)startTimer{
    self.isOn = YES;
    [self checkActive];
    
    NSTimeInterval timerLength = self.seconds;
    self.expirationDate = [NSDate dateWithTimeIntervalSinceNow:timerLength];
    
    UILocalNotification *timerExpiredNotification = [UILocalNotification new];
    
    timerExpiredNotification.fireDate = self.expirationDate;
    timerExpiredNotification.timeZone = [NSTimeZone defaultTimeZone];
    timerExpiredNotification.soundName = UILocalNotificationDefaultSoundName;
    timerExpiredNotification.alertTitle = @"Time's Up!";
    timerExpiredNotification.alertBody = @"Did you make it? Let's take a look!";
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:timerExpiredNotification];
    
    
}

- (void)cancelTimer {
    self.isOn = NO;
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    
}

- (void) endTimer {
    self.isOn = NO;
    [[NSNotificationCenter defaultCenter] postNotificationName:TimerCompleteNotification object:nil];
}

- (void) decreaseSecond {
    self.seconds--;
    [[NSNotificationCenter defaultCenter] postNotificationName:SecondTickNotification object:nil];
    if (self.seconds == 0) {
        [self endTimer];
    }
}

- (void) checkActive {
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    if(self.isOn == YES) {
        [self decreaseSecond];
        [self performSelector:@selector(checkActive) withObject:nil afterDelay:1.0];
    }
}

- (NSString *)timeRemaining {

    NSInteger minutes = self.seconds / 60;
    NSInteger seconds = self.seconds % 60;
    
    NSMutableString *timeString = [NSMutableString new];

    if(minutes < 10){
        [timeString appendString:[NSString stringWithFormat:@"0%ld:", (long)minutes]];
    }
    else {
        [timeString appendString:[NSString stringWithFormat:@"%ld:", (long)minutes]];
    }
    
    if(seconds < 10){
        [timeString appendString:[NSString stringWithFormat:@"0%ld", (long)seconds]];
    }
    else {
        [timeString appendString:[NSString stringWithFormat:@"%ld", (long)seconds]];
    }
    
    return timeString;
    
}

- (void)prepareForBackground {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.expirationDate forKey:expirationDate];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void)loadFromBackground {
 
    self.expirationDate = [[NSUserDefaults standardUserDefaults] objectForKey:expirationDate];
    NSTimeInterval seconds = [self.expirationDate timeIntervalSinceNow];
    self.seconds = seconds / 60;
    self.seconds = seconds - (self.seconds * 60);
    
    
}

@end
