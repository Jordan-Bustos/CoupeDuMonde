//
//  DownloaderDelegate.h
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MasterViewController.h"
#import "Equipe.h"

@interface DownloaderDelegate : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>

@property (strong) NSMutableArray * equipes;
@property (strong) NSString * URLString;

@property (strong) MasterViewController * delegate;
-(id)initWithURLString:(NSString *)URLString andDelegate:(MasterViewController *) delegate;

-(void) start;

@end
