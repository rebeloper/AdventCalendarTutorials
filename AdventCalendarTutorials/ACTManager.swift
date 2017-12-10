//
//  ACTManager.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 04/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import Foundation
import SpriteKit

class ACTManager {
  
  enum SceneType {
    case MainMenu, Gameplay
  }
  
  private init() {}
  static let shared = ACTManager()
  
  public func launch() {
    firstLaunch()
  }
  
  private func firstLaunch() {
    if !UserDefaults.standard.bool(forKey: "isFirstLaunch") {
      
      print("This is our first launch")
      ACTPlayerStats.shared.setSounds(true)
      
      UserDefaults.standard.set(true, forKey: "isFirstLaunch")
      UserDefaults.standard.synchronize()
    }
  }
  
  func transition(_ fromScene: SKScene, toScene: SceneType, transition: SKTransition? = nil ) {
    guard let scene = getScene(toScene) else { return }
    
    if let transition = transition {
      scene.scaleMode = .resizeFill
      fromScene.view?.presentScene(scene, transition: transition)
    } else {
      scene.scaleMode = .resizeFill
      fromScene.view?.presentScene(scene)
    }
    
  }
  
  func getScene(_ sceneType: SceneType) -> SKScene? {
    switch sceneType {
    case SceneType.MainMenu:
      return MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
    case SceneType.Gameplay:
      return Gameplay(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
    }
  }
  
  func run(_ fileName: String, onNode: SKNode) {
    if ACTPlayerStats.shared.getSound() {
      onNode.run(SKAction.playSoundFileNamed(fileName, waitForCompletion: false))
    }
  }
  
}


































