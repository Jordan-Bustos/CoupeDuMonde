//
//  DownloaderDelegate.m
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "DownloaderDelegate.h"

@implementation DownloaderDelegate


-(id)initWithURLString:(NSString *)URLString andDelegate:(MasterViewController *) delegate
{
    self = [super init];
    if (self)
    {
        _URLString = URLString;
        _equipes = [[NSMutableArray alloc]init];
        _delegate = delegate;
    }
    return self;
    
}

-(void)start
{
    // Create the request.
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:_URLString]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    
    [NSURLConnection sendAsynchronousRequest:theRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         if ([data length] >0 && error == nil)
         {
             NSArray *dictionariesOfEquipes = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
             
             Equipe *equipe;
             NSString *groupe;
             NSString *nom;
             NSString *drapeauString;
             NSNumber *nbParticipations;
             NSNumber *classementFifa;
             NSString *zone;
             NSString *pageWikipedia;
             
             UIImage * drapeauImage;
             
             for (NSDictionary * dic in dictionariesOfEquipes)
             {
                 groupe = [dic valueForKey:@"groupe"];
                 nom = [dic valueForKey:@"nom"];
                 drapeauString = [dic valueForKey:@"drapeau"];
                 nbParticipations = [dic valueForKey:@"participations"];
                 classementFifa = [dic valueForKey:@"classement_fifa"];
                 zone = [dic valueForKey:@"zone"];
                 pageWikipedia = [dic valueForKey:@"page_wikipedia"];
                 
                 drapeauImage = [UIImage imageNamed: drapeauString];
                 
                 equipe = [[Equipe alloc]initWithGroupe:groupe andNom:nom andDrapeau:drapeauImage andNbParticipations:nbParticipations andClassementFifa:classementFifa andZone:zone andPageWikipedia:pageWikipedia];
                 
                 [_equipes addObject:equipe];
             }
             
             [_delegate finishLoadEquipes:_equipes];
             
         }
         
     }];
    
}



@end
