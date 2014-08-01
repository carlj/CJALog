//
//  ExampleViewController.m
//  CJALog
//
//  Created by Carl Jahn on 06.09.13.
//  Copyright (c) 2013 Carl Jahn. All rights reserved.
//

#import "ExampleViewController.h"

#import "CJALog.h"

@implementation ExampleViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    CJALogEmergency(@"Emergency Log");
    CJALogEmergency(@"Emergency in function: %s", __FUNCTION__);

    CJALogAlert(@"Alert Log");
    CJALogAlert(@"Alert Log in %s", __FUNCTION__);

    CJALogCritical(@"Critical Log");
    CJALogCritical(@"Critical Log in %s", __FUNCTION__);

    CJALogError(@"Error Log");
    CJALogError(@"Error Log in %s", __FUNCTION__);
    
    CJALogWarning(@"Warning Log");
    CJALogWarning(@"Warning Log in %s", __FUNCTION__);
    
    CJALogNotice(@"Notice Log");
    CJALogNotice(@"Notice Log in %s", __FUNCTION__);
    
    CJALogInfo(@"Info Log");
    CJALogInfo(@"Info Log in %s", __FUNCTION__);
    
    CJALogDebug(@"Debug Log");
    CJALogDebug(@"Debug Log in %s", __FUNCTION__);
}

@end
