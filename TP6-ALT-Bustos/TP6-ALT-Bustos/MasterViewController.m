//
//  MasterViewController.m
//  TP6-ALT-Bustos
//
//  Created by Jordan Bustos on 18/06/2014.
//  Copyright (c) 2014 Jordan Bustos. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@interface MasterViewController () {
    NSMutableArray *_equipes;
    NSMutableDictionary* _dictionaryOfEquipesByGroupe;
    NSArray *_keysSorted;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)finishLoadEquipes:(NSMutableArray*)equipes
{
    _equipes = [self sortEquipeByGroupe:equipes];
    
    _dictionaryOfEquipesByGroupe=[self fixDictionaryOfEquipesByGroupeWith: _equipes];
    _keysSorted = [self createKeysSorted];
    
    [[self tableView]reloadData]; // rafraichir la liste
    
}

// Permet de trier les equipes par groupe
- (NSMutableArray *)sortEquipeByGroupe:(NSMutableArray *)equipes
{
    NSArray * sortedEquipes = [equipes sortedArrayUsingComparator:^NSComparisonResult(Equipe* equipeA, Equipe* equipeB)
                                {
                                    return [equipeA.groupe compare:equipeB.groupe];
                                }];
    NSMutableArray * sortedEquipesMutable = [[NSMutableArray alloc]initWithArray:sortedEquipes];
    return sortedEquipesMutable;
}

// Permet de creer le dictionnaire d'equipes par groupe
-(NSMutableDictionary *) fixDictionaryOfEquipesByGroupeWith: (NSMutableArray *)equipes
{
    NSMutableDictionary * dictionaryOfEquipesByGroupe = [[NSMutableDictionary alloc]init];
    NSString * lastGroupe =@"azerty";
    
    // On parcourt les equipes
    for (Equipe * equipe in _equipes)
    {
        // on récupère le groupe de l'équipe en cours
        NSString * groupe = equipe.groupe;
        
        // si il est différent du dernier stocké
        if (![groupe isEqualToString: lastGroupe])
        {
            // on insert une liste vide dans le dictionnaire avec la clé de ce groupe
            NSMutableArray * liste = [[NSMutableArray alloc]init];
            [dictionaryOfEquipesByGroupe setObject:liste forKey:groupe];
            
            // on stock le groupe
            lastGroupe = groupe;
        }
        
        // on insert l'equipe dans la liste de la clé de cette lettre
        [[dictionaryOfEquipesByGroupe objectForKey:groupe]addObject:equipe];
    }
    
    return dictionaryOfEquipesByGroupe;
}

// permet de creer une liste de clés triées du dictionnaire d'equipes
-(NSArray *) createKeysSorted
{
    return  [[_dictionaryOfEquipesByGroupe allKeys] sortedArrayUsingComparator:^NSComparisonResult(NSString* keyA, NSString* keyB)
             {
                 return [keyA compare:keyB];
             }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

// nombre de section dans la table (= nombre de clés dans le dictionnaire)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_keysSorted count];
}

// nombre de lignes par section (=nombre d'item dans la liste de la section)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString * key = [_keysSorted objectAtIndex:section];
    return [[_dictionaryOfEquipesByGroupe objectForKey:key] count];
}

// titre de la section (=nom de la clé à la section)
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_keysSorted objectAtIndex:section];
}

// cellule
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString * key = [_keysSorted objectAtIndex:indexPath.section];
    Equipe *equipe = [[_dictionaryOfEquipesByGroupe objectForKey:key] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = equipe.nom;
    cell.imageView.image = equipe.drapeau;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Equipe *equipe = _equipes[indexPath.row];
        [[segue destinationViewController] setEquipeItem:equipe];
    }
}

@end
