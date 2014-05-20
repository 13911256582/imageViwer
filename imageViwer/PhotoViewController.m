//
//  PhotoViewController.m
//  imageViwer
//
//  Created by ShaoLing on 4/26/14.
//  Copyright (c) 2014 dastone.cn. All rights reserved.
//

#import "PhotoViewController.h"
#import "ViewController.h"
#import "MyPhoto.h"

@interface PhotoViewController ()

@property (weak, nonatomic) IBOutlet UIRefreshControl *refreschControl;
@property (strong, nonatomic) NSMutableArray *photosInfo;

@end

@implementation PhotoViewController

static NSString *myURL = @"http://114.215.109.207:3000/photos.json";

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)refreshTouched:(UIBarButtonItem *)sender {
    NSLog(@"refresh touched");
    [self fetchPhotosInfo];
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    [self fetchPhotosInfo];
}

- (void)fetchPhotosInfo {
    
    NSURL *url = [NSURL URLWithString:myURL];
    NSData *jsonResult = [NSData dataWithContentsOfURL:url];
    //NSString *content = [NSString stringWithContentsOfURL:url encoding:nil error:NULL];
    
    NSArray *propertyList= [NSJSONSerialization JSONObjectWithData:jsonResult options:0 error:NULL];
    
    /*for (int i = 0; i < 20; i++) {
        [self.photosInfo addObject:[NSString stringWithFormat:@"photo info %d", i]];
    }*/
    
    if (!_photosInfo) {
        _photosInfo = [[NSMutableArray alloc]init];
    }
    
    if ([self.photosInfo count]) {
        [self.photosInfo removeAllObjects];
    }
    
        
    for (NSDictionary *photo in propertyList) {
            MyPhoto *mph = [[MyPhoto alloc]init];
            mph.title = [photo valueForKey:@"title"];
            mph.description = [photo valueForKey:@"description"];
            mph.imageURL = [photo valueForKey:@"imageURL"];
            [self.photosInfo addObject:mph];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.photosInfo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Photo Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSUInteger row = indexPath.row;
    cell.textLabel.text = [[self.photosInfo objectAtIndex:row] title];
    cell.detailTextLabel.text = [[self.photosInfo objectAtIndex:row] description];
    
    //NSDictionary *photo = self.photos[indexPath.row];
    
    return cell;
}


- (void)preparePhotoViewController:(ViewController *)imageVC photoURL:(NSString *)url{
    [imageVC viewImageWithURL:url];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
    
        if (indexPath){
            if ([segue.identifier isEqualToString:@"Display Photo"]) {
                if ([segue.destinationViewController isKindOfClass:[ViewController class]]) {
                    MyPhoto *mph = [self.photosInfo objectAtIndex:indexPath.row];
                    [self preparePhotoViewController:segue.destinationViewController
                                             photoURL:mph.imageURL];
                }
            }
        }
    }
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
