//
//  Gameplay.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 05/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class Gameplay: SKScene {
  
  lazy var backButton: BDButton = {
//    var button = BDButton(imageNamed: "ButtonBlue", buttonAction: {
//      ACTManager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .left, duration: 0.5))
//    })
    var button = BDButton(imageNamed: "ButtonBlue", title: "Back", buttonAction: {
      ACTManager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .left, duration: 0.5))
    })
    button.zPosition = 1
    button.scaleTo(screenWithPercentage: 0.25)
    return button
  }()
  
  
  override func didMove(to view: SKView) {
    print("Inside Gameplay")
    backgroundColor = .cyan
    backButton.position = CGPoint(x: ScreenSize.width * 0.2, y: ScreenSize.heigth * 0.85)
    addChild(backButton)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//    for touch in touches {
//      if touch == touches.first {
//        print("Going to Main Menu scene")
//
//      }
//    }
  }
}













