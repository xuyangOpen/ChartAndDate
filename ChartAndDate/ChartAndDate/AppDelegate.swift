//
//  AppDelegate.swift
//  ChartAndDate
//
//  Created by 徐杨 on 2016/11/30.
//  Copyright © 2016年 H&X. All rights reserved.
//

import UIKit
import JSPatch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        //开启JSPatch
        JPEngine.start()
        let sourcePath = Bundle.main.path(forResource: "classDemo", ofType: "js")
        let script = try?String.init(contentsOfFile: sourcePath!, encoding: String.Encoding.utf8)
        if script != nil{
            JPEngine.evaluateScript(script)
        }
        
        
        return true
    }

    /**
         // exec js file from network
         [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cnbang.net/test.js"]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
         NSString *script = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         [JPEngine evaluateScript:script];
         }];
         
         // exec local js file
         NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"sample" ofType:@"js"];
         NSString *script = [NSString stringWithContentsOfFile:sourcePath encoding:NSUTF8StringEncoding error:nil];
         [JPEngine evaluateScript:script];
     */
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

