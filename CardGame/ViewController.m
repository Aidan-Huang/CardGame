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

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flapLabel;
@property (nonatomic) int flapCount;
@property (strong, nonatomic) PlayDeck *deck;

@end

@implementation ViewController


- (PlayDeck *)deck{
    
    if (!_deck) {
        _deck = [[PlayDeck alloc] init];
    }
    
    return _deck;
}

- (void)setFlapCount:(int)flapCount{
    _flapCount = flapCount;
    
    [self.flapLabel setText:[NSString stringWithFormat:@"Flap: %d", self.flapCount]];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    if (![sender.titleLabel.text isEqualToString:@" "]) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        
        [sender setTitle:@" " forState:UIControlStateNormal];
        
    }else{
        
        PlayCard *card = (PlayCard *)[self.deck drawRandomCard];
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        
        [sender setTitle:card.contents forState:UIControlStateNormal];
        
        
    }
    
    self.flapCount++;
    
}


@end
