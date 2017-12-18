//
//  MainMenu.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 01/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
  
  lazy var playButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonPlay", buttonAction: {
      
      let chance = CGFloat.random(1, max: 10)
      if chance <= 5 {
        self.showAds()
      } else {
        self.startGameplay()
      }
      
    })
    button.zPosition = 1
    return button
  }()
  
  lazy var settingsButton: BDButton = {
    var button = BDButton(imageNamed: "ButtonSettings", buttonAction: {
      ACTManager.shared.transition(self, toScene: .Settings, transition: SKTransition.moveIn(with: .left, duration: 0.5))
    })
    
    button.scaleTo(screenWithPercentage: 0.17)
    button.zPosition = 1
    return button
  }()
  
  override func didMove(to view: SKView) {
    print("Inside Main Menu")
    
    NotificationCenter.default.addObserver(self, selector: #selector(self.startGameplayNotification(_:)), name: startGameplayNotificationName, object: nil)
    
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    playButton.position = CGPoint.zero
    addChild(playButton)
    //addPlayButton()
    playButton.logAvailableFonts()
    
    settingsButton.position = CGPoint(x: ScreenSize.width * 0.0, y: ScreenSize.heigth * -0.1)
    addChild(settingsButton)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    for touch in touches {
//      if touch == touches.first {
//        print("Going to Gameplay scene")
//        //ACTManager.shared.transition(self, toScene: .Gameplay)
//
//
//        enumerateChildNodes(withName: "//*", using: { (node, stop) in
//          if node.name == "playButton" {
//            if node.contains(touch.location(in: self)) {
//              ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))
//            }
//          }
//        })
//
//      }
//    }
  }
  
//  func addPlayButton() {
//    let playButton = SKSpriteNode(imageNamed: "ButtonPlay")
//    playButton.name = "playButton"
//    playButton.position = CGPoint.zero
//    addChild(playButton)
//  }
  
  @objc func startGameplayNotification(_ info:Notification) {
    startGameplay()
  }
  
  func startGameplay() {
    ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))

  }
  
  func showAds() {
    if !ACTPlayerStats.shared.getNoAds() {
      if !Chartboost.hasInterstitial(CBLocationMainMenu) {
        Chartboost.cacheInterstitial(CBLocationMainMenu)
        startGameplay()
      } else {
        Chartboost.showInterstitial(CBLocationMainMenu)
        Chartboost.cacheInterstitial(CBLocationMainMenu)
      }
    } else {
      startGameplay()
    }
  }
  
}





















