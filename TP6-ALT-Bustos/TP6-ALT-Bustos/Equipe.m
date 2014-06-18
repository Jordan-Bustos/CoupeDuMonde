//
//  Equipe.m
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "Equipe.h"

@implementation Equipe


-(id) initWithGroupe:(NSString*)groupe
              andNom:(NSString*)nom
          andDrapeau:(UIImage*)drapeau
 andNbParticipations:(NSNumber*)nbParticipations
   andClassementFifa:(NSNumber*)classementFifa
             andZone:(NSString*)zone
    andPageWikipedia:(NSString*)pageWikipedia
{
    self = [super init];
    if (self)
    {
        _groupe = groupe;
        _nom = nom;
        _drapeau = drapeau;
        _nbParticipations = nbParticipations;
        _classementFifa = classementFifa;
        _zone = zone;
        _pageWikipedia = pageWikipedia;
    }
    return self;

}

@end
