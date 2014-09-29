//
//  PlayCard.h
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import "Card.h"

@interface PlayCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
