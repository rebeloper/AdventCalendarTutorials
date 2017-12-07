//
//  MainMenu.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 01/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
  override func didMove(to view: SKView) {
    print("Inside Main Menu")
    anchorPoint = CGPoint(x: 0.5, y: 0.5)
    addPlayButton()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      if touch == touches.first {
        print("Going to Gameplay scene")
        //ACTManager.shared.transition(self, toScene: .Gameplay)
        ACTManager.shared.transition(self, toScene: .Gameplay, transition: SKTransition.moveIn(with: .right, duration: 0.5))
      }
    }
  }
  
  func addPlayButton() {
    let playButton = SKSpriteNode(imageNamed: "ButtonPlay")
    playButton.position = CGPoint.zero
    addChild(playButton)
  }
  
}





















