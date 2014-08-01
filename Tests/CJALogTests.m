//
//  CJALogTests.m
//  CJALogTests
//
//  Created by Carl Jahn on 06.09.13.
//  Copyright (c) 2013 Carl Jahn. All rights reserved.
//

#import "CJALogTests.h"
#import "CJALog.h"

@interface CJALogTests ()

@end

@implementation CJALogTests


- (BOOL)consoleOutputMatchString:(NSString *)string {

  //thanks to:
  //http://www.cocoanetics.com/2011/03/accessing-the-ios-system-log/
  
  aslmsg q, m;
  int i;
  int maxLoops = 500;
  
  const char *key, *val;
  
  q = asl_new(ASL_TYPE_QUERY);
  asl_set_query(q, ASL_KEY_SENDER, "CJALog", ASL_QUERY_OP_EQUAL);
  
  aslresponse r = asl_search(NULL, q);
  while (NULL != (m = aslresponse_next(r)))
  {
    NSMutableDictionary *tmpDict = [NSMutableDictionary dictionary];
    maxLoops -= 1;
    for (i = 0; (NULL != (key = asl_key(m, i))); i++)
    {
      NSString *keyString = [NSString stringWithUTF8String:(char *)key];
      
      val = asl_get(m, key);
      
      NSString *string = val?[NSString stringWithUTF8String:val]:@"";
      [tmpDict setObject:string forKey:keyString];
      
      if ([keyString isEqualToString:@"Message"]) {
        
        if ([string isEqualToString: string]) {
          return YES;
        }
        
      }
    }
    
    if (!maxLoops) {
      return NO;
    }
    
    //NSLog(tmpDict);
  }
  aslresponse_free(r);

  return NO;
}

- (void)testEmergLog {
  
  NSString *testString = @"Emergency Log Test";
  BOOL result = [self consoleOutputMatchString: testString];
  
  CJALogEmergency(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testAlertLog {
  
  NSString *testString = @"Alert Log Test";
  BOOL result = [self consoleOutputMatchString: testString];

  CJALogEmergency(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testCriticalLog {
 
  NSString *testString = @"Critical Log Test";
  BOOL result = [self consoleOutputMatchString: testString];

  CJALogCritical(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testErrorlLog {
  
  NSString *testString = @"Error Log Test";
  BOOL result = [self consoleOutputMatchString: testString];

  CJALogError(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testWarningLog {
  
  NSString *testString = @"Warning Log Test";
  BOOL result = [self consoleOutputMatchString: testString];

  CJALogWarning(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testNoticeLog {
 
  NSString *testString = @"Notice Log Test";
  BOOL result = [self consoleOutputMatchString: testString];

  CJALogNotice(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testInfoLog {
  
  NSString *testString = @"Info Log Test";
  BOOL result = [self consoleOutputMatchString: testString];
  
  CJALogInfo(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}

- (void)testDebugLog {
  
  NSString *testString = @"Debug Log Test";
  BOOL result = [self consoleOutputMatchString: testString];

  CJALogDebug(testString);
  
  XCTAssertTrue(result, @"didnt find test string: %@ in console output", testString);
}


@end
