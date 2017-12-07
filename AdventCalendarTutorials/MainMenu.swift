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
      ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))
    })
    button.zPosition = 1
    return button
  }()
  
  override func didMove(to view: SKView) {
    print("Inside Main Menu")
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    playButton.position = CGPoint.zero
    addChild(playButton)
    //addPlayButton()
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
  
}





















