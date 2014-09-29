//
//  Card.m
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSArray *)cards{
    
    int score = 0;
    
    for (Card *card in cards){
        
        if ([card.contents isEqualToString:self.contents]) {
            
            score = 1;
        }
        
    }
    
    return  score;
}

@end
