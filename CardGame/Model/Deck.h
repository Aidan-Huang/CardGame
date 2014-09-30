//
//  Deck.h
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;


@end
