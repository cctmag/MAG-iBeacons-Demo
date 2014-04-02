//
//  ViewController.m
//  iBeacons Demo
//
//  Created by Danny Holmes on 3/14/14.
//  Copyright (c) 2014 LSU MAG. All rights reserved.
//

#import "ViewController.h"
#import "BeaconOneViewController.h"
#import "BeaconTwoViewController.h"
#import "BeaconHighlightVC-Li.h"


@interface ViewController ()

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic)  UIViewController *viewController;

@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (nonatomic) int oldBeaconMajor;


///////////
////// Temporary: for Testing

- (IBAction)toLiVC:(id)sender;

///////////

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
    NSLog(@"Loaded");
//    for (NSString *familyName in [UIFont familyNames]) {
//        for (NSString *fontName in [UIFont fontNamesForFamilyName:familyName]) {
//            NSLog(@"%@", fontName);
//        }
//    }
    
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"B9407F30-F5F8-466E-AFF9-25556B57FE6D"];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"edu.MAG.LSU"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
     NSLog(@"Beacon Found");
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    //NSLog(@"Left Region");
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons firstObject]; //maybe lastObject?
    NSLog(@"%@",beacons);
    
    int foundBeaconMajor = [beacon.major intValue];
    NSLog(@"%d new",foundBeaconMajor);
    NSLog(@"%d old",self.oldBeaconMajor);
    
    if (foundBeaconMajor == self.oldBeaconMajor) {
        
        //NSLog(@"same beacon");
        
    } else {
        
        if (self.oldBeaconMajor == 0) {
            self.oldBeaconMajor = foundBeaconMajor;
            [self whichBeacon:self.oldBeaconMajor new:foundBeaconMajor];
        } else {
            NSLog(@"Returning to Home Screen");
            self.oldBeaconMajor = foundBeaconMajor;
        
            //NSLog(@"%d new",foundBeaconMajor);
            //NSLog(@"%d old",self.oldBeaconMajor);
            NSLog(@"RESET SCREEN");
            [_viewController dismissViewControllerAnimated:YES completion:^{
                [self whichBeacon:self.oldBeaconMajor new:foundBeaconMajor];
            }];
        }
    }
}

-(void)whichBeacon:(int)old new:(int)new {
    //NSLog(@"which Beacon");
    //NSLog(@"%d old 1",old);
    
    UIStoryboard *storyboard;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] ==UIUserInterfaceIdiomPad) {
        storyboard = [UIStoryboard storyboardWithName:@"Main-iPad" bundle:nil];
    } else {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    
    [_viewController setModalPresentationStyle:UIModalPresentationFullScreen];
    
    if (new == 10) {//45893
        _viewController = [storyboard instantiateViewControllerWithIdentifier:@"BeaconOneViewController"];
        [self presentViewController:_viewController animated:YES completion:nil];
        //NSLog(@"segue to one");
        //NSLog(@"%d old nested",old);
    }
    
    if (new == 20) {//19546
        _viewController = [storyboard instantiateViewControllerWithIdentifier:@"BeaconTwoViewController"];
        [self presentViewController:_viewController animated:YES completion:nil];
        //NSLog(@"segue to two");
        //NSLog(@"%d old nested",old);
    }
    
    if (new == 1000) {
        NSLog(@"Segue to EMDM");
        _viewController = [storyboard instantiateViewControllerWithIdentifier:@"BeaconHighlightVC-EMDM"];
        [self presentViewController:_viewController animated:YES completion:nil];
    }
    
    if (new == 1001) {
        NSLog(@"Segue to Li");
        _viewController = [storyboard instantiateViewControllerWithIdentifier:@"BeaconHighlightVC-Li"];
        [self presentViewController:_viewController animated:YES completion:nil];
    }
    
    // NSLog(@"%d old 2",old);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

///////////
////// Temporary: for Testing

- (IBAction)toLiVC:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main-iPad" bundle:nil];
    [_viewController setModalPresentationStyle:UIModalPresentationFullScreen];
    _viewController = [storyboard instantiateViewControllerWithIdentifier:@"BeaconHighlightVC-Li"];
    [self presentViewController:_viewController animated:YES completion:nil];
}
@end
