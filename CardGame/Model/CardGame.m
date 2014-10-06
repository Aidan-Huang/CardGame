//
//  CardGame.m
//  CardGame
//
//  Created by Aidan on 10/4/14.
//  Copyright (c) 2014 ideal. All rights reserved.
//

#import "CardGame.h"

@interface CardGame()

@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; // of Card
    
@end


@implementation CardGame

- (NSMutableArray *)cards{
    
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    
    return _cards;
}

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck{
    
    self = [super init];       // super's designated initializer
    
    if (self) {
        
        if (count > 1) {
            for (int i = 0; i < count; i++) {
                Card *card = [deck drawRandomCard];
                if (card) {
                    [self.cards addObject:card];
                }else{
                    self = nil;
                    break;
                }
            }
        }else{
            self = nil;
        }
        
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index<self.cards.count) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define SELECT_CONSUMER 1

- (void)chooseCardAtIndex:(NSUInteger)index{
    
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen){
            card.chosen = NO;
        }else{
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            self.score -= SELECT_CONSUMER;
            card.chosen = YES;
        }
    }
    
}

@end
