//
//  ACTManager.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 04/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import Foundation

class ACTManager {
  private init() {}
  static let shared = ACTManager()
  
  public func launch() {
    firstLaunch()
  }
  
  private func firstLaunch() {
    if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
      
      print("This is our first launch")
      
      UserDefaults.standard.set(true, forKey: "isFirstLaunch")
      UserDefaults.standard.synchronize()
    }
  }
  
}
