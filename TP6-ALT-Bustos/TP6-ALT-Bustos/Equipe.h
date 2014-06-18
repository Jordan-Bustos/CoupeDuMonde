//
//  Equipe.h
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Equipe : NSObject

@property (strong) NSString *groupe;
@property (strong) NSString *nom;
@property (strong) UIImage *drapeau;
@property (strong) NSNumber *nbParticipations;
@property (strong) NSNumber *classementFifa;
@property (strong) NSString *zone;
@property (strong) NSString *pageWikipedia;

-(id) initWithGroupe:(NSString*)groupe
           andNom:(NSString*)nom
          andDrapeau:(UIImage*)drapeau
 andNbParticipations:(NSNumber*)nbParticipations
   andClassementFifa:(NSNumber*)classementFifa
             andZone:(NSString*)zone
    andPageWikipedia:(NSString*)pageWikipedia;

@end
