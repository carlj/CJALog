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
  
  CJALogEmergency(@"%s Emergency Log", __FUNCTION__);
  
  CJALogAlert(@"%s Alert Log", __FUNCTION__);

  CJALogCritical(@"%s Critical Log", __FUNCTION__);

  CJALogError(@"%s Error Log", __FUNCTION__);
  
  CJALogWarning(@"%s Warning Log", __FUNCTION__);
  
  CJALogNotice(@"%s Notice Log", __FUNCTION__);
  
  CJALogInfo(@"%s Info Log", __FUNCTION__);
  
  CJALogDebug(@"%s Debug Log", __FUNCTION__);
}

@end
