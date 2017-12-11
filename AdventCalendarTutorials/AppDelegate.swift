//
//  AppDelegate.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 01/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

// 568.0
// 568.0
// 667.0
// 736.0
// 812.0
// 1024.0
// 1366.0

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ChartboostDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    setupChartboost()
    
    window = UIWindow()
    window?.makeKeyAndVisible()
    
    let gameViewController = GameViewController()
    window?.rootViewController = gameViewController
    
    ACTManager.shared.launch()
    
    return true
  }

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
  
  func setupChartboost() {
    Chartboost.start(withAppId: chartboostAppID, appSignature: chartboostAppSignature, delegate: self)
    Chartboost.cacheInterstitial(CBLocationMainMenu)
  }

  func shouldDisplayInterstitial(_ location: String!) -> Bool {
    NotificationCenter.default.post(name: stopBackgroundMusicNotificationName, object: nil, userInfo: nil)
    return true
  }
  
  func didDismissInterstitial(_ location: String!) {
    NotificationCenter.default.post(name: startBackgroundMusicNotificationName, object: nil, userInfo: nil)
    NotificationCenter.default.post(name: startGameplayNotificationName, object: nil, userInfo: nil)
  }
  
  func didCloseInterstitial(_ location: String!) {
    NotificationCenter.default.post(name: startBackgroundMusicNotificationName, object: nil, userInfo: nil)
    NotificationCenter.default.post(name: startGameplayNotificationName, object: nil, userInfo: nil)
  }
  
  func didClickInterstitial(_ location: String!) {
    NotificationCenter.default.post(name: startBackgroundMusicNotificationName, object: nil, userInfo: nil)
  }

}
















