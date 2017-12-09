//
//  Extension.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 01/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import UIKit

enum UIUserInterfaceIdiom: Int {
  case undefined
  case phone
  case pad
}

struct ScreenSize {
  static let width = UIScreen.main.bounds.size.width
  static let heigth = UIScreen.main.bounds.size.height
  static let maxLength = max(ScreenSize.width, ScreenSize.heigth)
  static let minLength = min(ScreenSize.width, ScreenSize.heigth)
}

struct DeviceType {
  static let isiPhone4OrLess = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength < 568.0
  static let isiPhone5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 568.0
  static let isiPhone6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 667.0
  static let isiPhone6Plus = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 736.0
  static let isiPhoneX = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.maxLength == 812.0
  static let isiPad = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1024.0
  static let isiPadPro = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.maxLength == 1366.0
  
}

public extension CGFloat {
  public static func universalFont(size: CGFloat) -> CGFloat {
    if DeviceType.isiPhone4OrLess {
      return size * 0.6
    }
    
    if DeviceType.isiPhone5 {
      return size * 0.8
    }
    
    if DeviceType.isiPhone6 {
      return size * 1.0
    }
    
    if DeviceType.isiPhone6Plus {
      return size * 1.0
    }
    
    if DeviceType.isiPhoneX {
      return size * 1.0
    }
    
    if DeviceType.isiPad {
      return size * 2.1
    }
    
    if DeviceType.isiPadPro {
      return size * 2.1
    } else {
      return size * 1.0
    }
  }
}





















