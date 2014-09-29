//
//  Deck.m
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import "Deck.h"

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards;

@end


@implementation Deck

- (NSMutableArray *)cards{
    
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
    
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }
    
}


- (void)addCard:(Card *)card{
    
    [self addCard:card atTop:NO];
}

- (Card *)drawRandomCard{
    
    Card *card = nil;
    
    if (_cards.count) {
        
        unsigned index = arc4random() % [self.cards count];
        card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return card;
}

@end
