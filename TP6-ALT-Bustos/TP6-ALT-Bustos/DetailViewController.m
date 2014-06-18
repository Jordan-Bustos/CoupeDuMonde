//
//  DetailViewController.m
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setEquipeItem:(Equipe*)newDetailItem
{
    if (_equipeItem != newDetailItem) {
        _equipeItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (_equipeItem)
    {        
        NSString *fullURL = _equipeItem.pageWikipedia;
        NSURL *url = [NSURL URLWithString:fullURL];
        
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        
        [_webViewWiki loadRequest:requestObj];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
