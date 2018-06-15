#import "NotificationManager.h"
#import <React/RCTLog.h>

bool isGranted;
@implementation NotificationManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(showNotification:(NSString *)title message:(NSString *)message callback:(RCTResponseSenderBlock)callback)
{
  RCTLogInfo(@"Pretending to create an event %@ at %@", title, message);
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  UNAuthorizationOptions options = UNAuthorizationOptionAlert + UNAuthorizationOptionSound;
  // request notofication permission
  [center requestAuthorizationWithOptions:options completionHandler:^(BOOL granted, NSError * _Nullable error) {
    if (granted) {
      RCTLogInfo(@"Permission granted");
      // build the notification
      UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
      content.title = title;
      content.body = message;
      content.sound = [UNNotificationSound defaultSound];
      //trigger notification
      UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:1 repeats:NO];
      //generate notification
      UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"UNLocalNotification" content:content trigger:trigger];
      [center addNotificationRequest:request withCompletionHandler:nil];
    }
  }];
}
@end

