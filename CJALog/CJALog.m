//
//  CJALog.m
//  CJALog
//
//  Created by Carl Jahn on 06.09.13.
//  Copyright (c) 2013 Carl Jahn. All rights reserved.
//

/*
 #define ASL_LEVEL_EMERG   0
 #define ASL_LEVEL_ALERT   1
 #define ASL_LEVEL_CRIT    2
 #define ASL_LEVEL_ERR     3
 #define ASL_LEVEL_WARNING 4
 #define ASL_LEVEL_NOTICE  5
 #define ASL_LEVEL_INFO    6
 #define ASL_LEVEL_DEBUG   7
 */

#import "CJALog.h"

void CJALogInit() {
  
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    asl_add_log_file(NULL, STDERR_FILENO);
  });
  
}

void CJALogSetSharedLogLevel(NSUInteger level) {
  
  asl_set_filter(NULL, ASL_FILTER_MASK_UPTO(level) );
}


BOOL CJALogWithLevel(NSUInteger level, NSString *format, ...) {
  
  CJALogInit();
  
  va_list ap;
	va_start(ap,format);
  
  int result = asl_log(NULL, NULL, level, [format UTF8String], ap);
  
	va_end(ap);
  
  if (0 == result) {
    return YES;
  }
  
  return NO;
}

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_EMERG
void CJALogEmergency(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_EMERG, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_ALERT
void CJALogAlert(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_ALERT, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_CRIT
void CJALogCritical(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_CRIT, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_ERR
void CJALogError(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_ERR, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_WARNING
void CJALogWarning(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_WARNING, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_NOTICE
void CJALogNotice(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_NOTICE, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_INFO
void CJALogInfo(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_INFO, format, ap);
  
	va_end(ap);
}
#endif

#if CJA_LOG_COMPILE_LOG_LEVEL >= ASL_LEVEL_DEBUG
void CJALogDebug(NSString *format, ...) {
  
  va_list ap;
	va_start(ap, format);
  
  CJALogWithLevel(ASL_LEVEL_DEBUG, format, ap);
  
	va_end(ap);
}
#endif
