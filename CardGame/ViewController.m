//
//  ViewController.m
//  CardGame
//
//  Created by Aidan on 14-9-29.
//  Copyright (c) 2014年 ideal. All rights reserved.
//

#import "ViewController.h"
#import "PlayDeck.h"
#import "PlayCard.h"
#import "CardGame.h"

@interface ViewController ()

@property (strong, nonatomic) CardGame *cardGame;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

@implementation ViewController



- (CardGame *)cardGame{
    
    if (!_cardGame) _cardGame = [[CardGame alloc] initWithCardCount:[self.cardButtons count]
                                                       usingDeck:[self creatDeck]];
    
    return _cardGame;
}


- (PlayDeck *)creatDeck{
    return [[PlayDeck alloc]init];
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    long chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    
    [self.cardGame chooseCardAtIndex:chosenButtonIndex];
    
    [self updateUI];
    
}

- (void) updateUI{
    
    for (UIButton *cardButton in self.cardButtons){
        
        long cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        
        Card *card = [self.cardGame cardAtIndex:cardButtonIndex];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.cardGame.score ];
}

- (UIImage *)backgroundImageForCard:(Card *)card{
    return[UIImage imageNamed:card.isChosen? @"cardfront" : @"cardback"];
}

- (NSString *)titleForCard:(Card *)card{
    return card.isChosen? card.contents : @" ";
}


@end
