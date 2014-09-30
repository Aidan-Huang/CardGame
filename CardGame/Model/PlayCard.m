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
    
    return [NSString stringWithFormat:@"%@%@", [PlayCard validRanks][self.rank], self.suit];
}


+ (NSArray *)validRanks{
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger)maxRank{
    
    return [[self validRanks] count] - 1;
}

+ (NSArray *)validSuits{
    
    return @[@"♠️", @"♥️",@"♣️",@"♦️"];
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayCard maxRank]) {
        _rank = rank;
    }
}


@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    
    if ([[PlayCard validSuits] containsObject:suit]) {
        
        _suit = suit;
    }
}

- (NSString *)suit{
    
    return _suit? _suit : @"?";
}

@end
