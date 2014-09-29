//
//  PlayCard.m
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import "PlayCard.h"

@implementation PlayCard

- (NSString *)contents{
    
    return [NSString stringWithFormat:@"%@%@", [PlayCard validRank][self.rank], self.suit];
}


+ (NSArray *)validRank{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank{
    
    return [[PlayCard validRank] count] - 1;
}

+ (NSArray *)validSuit{
    
    return @[@"♠️", @"♥️",@"♣️",@"♦️"];
}




@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    
    if ([[PlayCard validSuit] containsObject:suit]) {
        
        self.suit = suit;
    }
}

- (NSString *)suit{
    
    return self.suit? self.suit : @"?";
}

@end
