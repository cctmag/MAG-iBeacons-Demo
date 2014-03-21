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


@interface ViewController ()

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;

@property (strong, nonatomic)  UIViewController *viewController;

@property (weak, nonatomic) IBOutlet UILabel *majorLabel;
@property (nonatomic) int oldBeaconMajor;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    [self locationManager:self.locationManager didStartMonitoringForRegion:self.beaconRegion];
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
    NSLog(@"Left Region");
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
        
        NSLog(@"same beacon");
        
    } else {
        
        if (self.oldBeaconMajor == 0) {
            self.oldBeaconMajor = foundBeaconMajor;
            [self whichBeacon:self.oldBeaconMajor new:foundBeaconMajor];
        } else {
        
            self.oldBeaconMajor = foundBeaconMajor;
        
            NSLog(@"%d new",foundBeaconMajor);
            NSLog(@"%d old",self.oldBeaconMajor);
        
            [_viewController dismissViewControllerAnimated:YES completion:^{
                [self whichBeacon:self.oldBeaconMajor new:foundBeaconMajor];
            }];
        }
    }
}

-(void)whichBeacon:(int)old new:(int)new {
    NSLog(@"which Beacon");
    
    NSLog(@"%d old 1",old);
    UIStoryboard *storyboard;
    
    NSString *str_newbeacon = [@(new) description];
    
    NSDictionary *dictBeacon = @{
                                @"45893": @"BeaconOneViewController",
                                @"19546": @"BeaconTwoViewController",
                                @"33127": @"BeaconHighlightVC-EMDM",
                                };
    
    NSString *storyboardName;
    
    switch( UI_USER_INTERFACE_IDIOM()) {
        case UIUserInterfaceIdiomPad:
            storyboardName = @"Main-iPad";
            break;
        case UIUserInterfaceIdiomPhone:
            storyboardName = @"Main";
            break;
        default:
            NSLog(@"UI_USER_INTERFACE_IDIOM not supported");
            break;
    }
    
    storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    [_viewController setModalPresentationStyle:UIModalPresentationFullScreen];
    
    NSString *vc_beacon_id = [dictBeacon valueForKey:str_newbeacon];
    
    if( nil == vc_beacon_id ){
        NSLog(@"No key found for beacon ID: %@", str_newbeacon);
    }
    
    _viewController = [storyboard instantiateViewControllerWithIdentifier:vc_beacon_id];
    [self presentViewController:_viewController animated:YES completion:nil];
    
    NSLog(@"segue to %@", vc_beacon_id);
    NSLog(@"%d old nested",old);
    
    NSLog(@"%d old 2",old);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
