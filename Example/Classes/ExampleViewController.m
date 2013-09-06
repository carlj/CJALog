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
  
  CJALogAlert(@"Alert Log");

  CJALogCritical(@"Critical Log");

  CJALogError(@"Error Log");
  
  CJALogWarning(@"Warning Log");
  
  CJALogNotice(@"Notice Log");
  
  CJALogInfo(@"Info Log");
  
  CJALogDebug(@"Debug Log");
}

@end
