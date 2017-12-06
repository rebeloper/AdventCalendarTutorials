//
//  Gameplay.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 05/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit

class Gameplay: SKScene {
  override func didMove(to view: SKView) {
    print("Inside Gameplay")
    backgroundColor = .cyan
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      if touch == touches.first {
        print("Going to Main Menu scene")
        ACTManager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .right, duration: 0.5))
      }
    }
  }
}
