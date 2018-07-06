//
//  AppDelegate.m
//  Fighting
//
//  Created by kangqijun on 14-10-16.
//  Copyright (c) 2014年 kangqijun. All rights reserved.
//

#import "AppDelegate.h"
#import "SSZipArchive.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [application setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"application openURL,url=%@,sourceApplication=%@",url,sourceApplication);
    
    if ([[url absoluteString] rangeOfString:@"WhatsApp"].location != NSNotFound){
        //sourceApplication=net.whatsapp.WhatsApp
        
        NSString *lockScreenPath = [NSHomeDirectory() stringByAppendingFormat:@"/Documents"];
        [SSZipArchive unzipFileAtPath:url.path toDestination:lockScreenPath];
        
        NSArray *dirArray = [[NSFileManager defaultManager] directoryContentsAtPath:lockScreenPath];
        
        for (NSString *s in dirArray)
        {
            NSLog(@"%@", s);
        }
        
        /*
         2018-07-06 15:48:12.050253+0800 Test[3523:795822] application openURL,url=file:///private/var/mobile/Containers/Data/Application/2EA1EBF2-6F21-423C-B0D0-C9D7873FB097/Documents/Inbox/WhatsApp%20Chat%20-%20%E9%AB%98%E7%95%85-4.zip,sourceApplication=net.whatsapp.WhatsApp
         2018-07-06 15:48:12.072455+0800 Test[3523:795822] Inbox
         2018-07-06 15:48:12.072672+0800 Test[3523:795822] _chat.txt
         2018-07-06 15:48:12.072809+0800 Test[3523:795822] export
         2018-07-06 15:48:12.072940+0800 Test[3523:795822] export.txt
         (lldb)
         
         
         2018-07-06 15:50:28.415813+0800 Test[3523:795822] application openURL,url=file:///private/var/mobile/Containers/Data/Application/2EA1EBF2-6F21-423C-B0D0-C9D7873FB097/Documents/Inbox/WhatsApp%20Chat%20-%20%E9%AB%98%E7%95%85-5.zip,sourceApplication=net.whatsapp.WhatsApp
         2018-07-06 15:50:28.439597+0800 Test[3523:795822] 2018-04-23-PHOTO-00000005.jpg
         2018-07-06 15:50:28.439703+0800 Test[3523:795822] 2018-04-23-PHOTO-00000006.jpg
         2018-07-06 15:50:28.439802+0800 Test[3523:795822] Inbox
         2018-07-06 15:50:28.439894+0800 Test[3523:795822] _chat.txt
         2018-07-06 15:50:28.439983+0800 Test[3523:795822] export
         2018-07-06 15:50:28.440128+0800 Test[3523:795822] export.txt
         
         */
        
        NSString *path = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/_chat.txt"];
        
        
        //        NSString *content = [[NSString alloc] initWithContentsOfFile:chatPath encoding:NSUTF8StringEncoding error:&error];
        
        UIWebView *m_webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
        [m_webView setUserInteractionEnabled:YES];
        [m_webView loadRequest:requestObj];
        
        [self.window addSubview:m_webView];
        
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
