//
//  ACTPlayerStats.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 09/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import Foundation
import SpriteKit

let kBackgroundMusicName = "BackgroundMusic"
let kBackgroundMusicExtension = "mp3"
let kSoundState = "kSoundState"

enum SoundFileName: String {
  case TapFile = "Tap.wav"
}

class ACTPlayerStats {
  
  private init() {}
  static let shared = ACTPlayerStats()
  
  func setSounds(_ state: Bool) {
    UserDefaults.standard.set(state, forKey: kSoundState)
    UserDefaults.standard.synchronize()
  }
  
  func getSound() -> Bool {
    return UserDefaults.standard.bool(forKey: kSoundState)
  }
}
