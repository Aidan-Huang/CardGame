//
//  PlayDeck.m
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import "PlayDeck.h"
#import "PlayCard.h"

@implementation PlayDeck

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        for (NSString *suit in [PlayCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayCard maxRank]; rank++) {
                
                PlayCard *card = [[PlayCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                
                [self addCard:card];
            }
            
        }
        
    }
    
    return self;
}

@end
