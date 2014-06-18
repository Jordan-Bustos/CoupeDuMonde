//
//  DetailViewController.h
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Equipe.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Equipe *equipeItem;
@property (weak, nonatomic) IBOutlet UIWebView *webViewWiki;

@end
