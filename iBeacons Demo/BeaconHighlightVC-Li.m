//
//  BeaconHighlightVC-Li.m
//  iBeacons Demo
//
//  Created by Danny Holmes on 3/21/14.
//  Copyright (c) 2014 Mobient. All rights reserved.
//

#import "BeaconHighlightVC-Li.h"

@interface BeaconHighlightVC_Li ()

//@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation BeaconHighlightVC_Li

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadContent];
}

- (void)loadContent {
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-20)];;
    
    UIView *firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    UIView *secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    float w = self.view.frame.size.width;
    float h = self.view.frame.size.height;
    
    ///////////////////////////
    ///////////////////////////
    
    ScaledImageView *scanner = [[ScaledImageView alloc] initWithFrame:CGRectMake(345, 255, w*.55, 304)];//345, 285, 430, 304
    ScaledImageView *body = [[ScaledImageView alloc] initWithFrame:CGRectMake(0, 509, w*.53, 304)];//0, 509, 430, 304
    
    ChochinTextView *titleBanner1 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, 91, 768, 190)];//0, 91, 768, 190
    ChochinTextView *firstText1 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, 265, w*.45, 197)];//0, 265, 350, 197
    ChochinTextView *secondText1 = [[ChochinTextView alloc] initWithFrame:CGRectMake(418, 630, w*.45, 350)];//418, 630, 350, 350
    
    titleBanner1.text = [NSString stringWithFormat:@"Real-time 3D Human Body Scanning, Measurement, and Posture Analysis using Kinects"];
    titleBanner1.font = [UIFont fontWithName:@"Cochin-bold" size:34.0];
    firstText1.text = [NSString stringWithFormat:@"We develop a real-time 3D body scanning system to provide efficient and automatic 3D body scan. The system is built with 16 Microsoft Kinect sensors."];
    secondText1.text = [NSString stringWithFormat:@"The measurements and analysis on the human body are important tasks in multiple biomedical research tasks. Rather than performing the physical measurements the subject, we aim to efficiently acquire the digital models through real-time body scans upon which various digital measurements and computer-aided analysis can be conducted."];

    scanner.image = [UIImage imageNamed:@"3DScanner.png"];
    body.image = [UIImage imageNamed:@"3DBody.png"];
    
    [firstView addSubview:titleBanner1];
    [firstView addSubview:scanner];
    [firstView addSubview:body];
    [firstView addSubview:secondText1];
    [firstView addSubview:firstText1];
    
    ///////////////////////////
    ///////////////////////////
    
    ChochinTextView *titleBanner2 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, h+20, w, h*.12)];
    ChochinTextView *text1 = [[ChochinTextView alloc] initWithFrame:CGRectMake(w*.5, titleBanner2.frame.origin.y+titleBanner2.frame.size.height+80, w*.5, h*.2)];
    ScaledImageView *scanAndPrint = [[ScaledImageView alloc] initWithFrame:CGRectMake(0, h+titleBanner1.frame.size.height+10, w*.5, h*.3)];
    ChochinTextView *text2 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, text1.frame.origin.y+text1.frame.size.height+80, w*.5, h*.035)];
    ChochinTextView *text3 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, text2.frame.origin.y+text2.frame.size.height-2, w, h*.03)];
    ChochinTextView *text4 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, text3.frame.origin.y+text3.frame.size.height-2, w, h*.03)];
    ChochinTextView *text5 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, text4.frame.origin.y+text4.frame.size.height-2, w, h*.03)];
    ScaledImageView *skullModeling = [[ScaledImageView alloc] initWithFrame:CGRectMake(0, text5.frame.origin.y+text5.frame.size.height, w, h*.275)];
    ChochinTextView *text6 = [[ChochinTextView alloc] initWithFrame:CGRectMake(0, skullModeling.frame.origin.y+skullModeling.frame.size.height+5, w*.485, h*.36)];
    ChochinTextView *text7 = [[ChochinTextView alloc] initWithFrame:CGRectMake(w*.515, text6.frame.origin.y, w*.485, h*.36)];
    ScaledImageView *facialRecon = [[ScaledImageView alloc] initWithFrame:CGRectMake(0, text7.frame.origin.y+text7.frame.size.height, w, h*.275)];
    
    titleBanner2.text = [NSString stringWithFormat:@"Computational Forensics: Digital Skull Restoration and Facial Reconstruction"];
    titleBanner2.font = [UIFont fontWithName:@"Cochin-bold" size:34.0];
    
    text1.text = [NSString stringWithFormat:@"We study computational forensic skull and face modeling, and develop 3D geometric modeling and analysis tools to facilitate forensic, medical, and archeological tasks and research."];
    text2.text = [NSString stringWithFormat:@"Recently we have been working on:"];
    text3.text = [NSString stringWithFormat:@"Skull Restoration: reassemble fragmented skull evidence and repair their damaged regions."];
    text4.text = [NSString stringWithFormat:@"Skull Assessment: determine the basic bio-profile (ancestry, sex, etc) of the skull."];
    text5.text = [NSString stringWithFormat:@"Facial Reconstruction: recreate craniofacial structure and face geometry from the skull."];
    text6.text = [NSString stringWithFormat:@"The restoration and analysis of skull evidence and the reconstruction of unidentified body's face from its skull are important tasks in forensic investigation and law enforcement. The current state-of-the-art techniques in skull and face modeling adoped in law investigation are performed manually by forensic specialists."];
    text7.text = [NSString stringWithFormat:@"Despite their success in many law enforcement cases, the procedures are relatively slow, expensive, and reliant on forensic specialists' expertise. Our goal is to augment these state-of-the-art manual restoration and reconstruction techniques using cutting-edge 3D geometric modeling techniques, and migrate the manual pipeline into a digital environment."];
    
    text2.textAlignment = NSTextAlignmentLeft;
    text3.textAlignment = NSTextAlignmentLeft;
    text4.textAlignment = NSTextAlignmentLeft;
    text5.textAlignment = NSTextAlignmentLeft;
    text6.textAlignment = NSTextAlignmentLeft;
    text7.textAlignment = NSTextAlignmentLeft;
    UIFont *listFont = [UIFont fontWithName:@"Cochin" size:20.0];
    text3.font = listFont;
    text4.font = listFont;
    text5.font = listFont;
    
    scanAndPrint.image = [UIImage imageNamed:@"3DScanAndPrint.jpg"];
    skullModeling.image = [UIImage imageNamed:@"SkullModeling.png"];
    facialRecon.image = [UIImage imageNamed:@"FacialReconstruction.jpg"];
    
    [secondView addSubview:titleBanner2];
    [secondView addSubview:scanAndPrint];
    [secondView addSubview:text1];
    [secondView addSubview:text2];
    [secondView addSubview:text3];
    [secondView addSubview:text4];
    [secondView addSubview:text5];
    [secondView addSubview:text6];
    [secondView addSubview:text7];
    [secondView addSubview:skullModeling];
    [secondView addSubview:facialRecon];
    
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height * 2.55);
    
    [scrollView addSubview:firstView];
    [scrollView addSubview:secondView];
    
    [self.view addSubview:scrollView];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor] CGColor], (id)[[UIColor colorWithWhite:.75 alpha:1] CGColor], (id)[[UIColor colorWithWhite:.5 alpha:1] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
