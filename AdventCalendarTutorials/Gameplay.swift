//
//  Gameplay.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 05/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import SpriteKit
import StoreKit

class Gameplay: SKScene {
  
  lazy var backButton: BDButton = {
//    var button = BDButton(imageNamed: "ButtonBlue", buttonAction: {
//      ACTManager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .left, duration: 0.5))
//    })
    var button = BDButton(imageNamed: "ButtonBlue", title: "Back", buttonAction: {
      self.showAlert()
    })
    button.zPosition = 1
    button.scaleTo(screenWithPercentage: 0.25)
    return button
  }()
  
  func showAlert() {
    let okAction = UIAlertAction(title: "Ok", style: .default) { (result) in
      print("Ok button tapped.")
      ACTManager.shared.transition(self, toScene: .MainMenu, transition: SKTransition.moveIn(with: .left, duration: 0.5))
    }
    ACTManager.shared.showAlert(on: self, title: "Going Back", message: "You are leaving Gameplay.", preferredStyle: .alert, actions: [okAction], animated: true, delay: 3.0) {
      print("Showed alert.")
    }
    
  }
  
  lazy var countdownLabel: SKLabelNode = {
    var label = SKLabelNode(fontNamed: "BubbleGum")
    label.fontSize = CGFloat.universalFont(size: 36)
    label.zPosition = 2
    label.color = SKColor.white
    label.horizontalAlignmentMode = .left
    label.verticalAlignmentMode = .center
    label.text = "00:00"
    return label
  }()
  
  var counter = 0
  var counterTimer = Timer()
  var counterStartValue = 90
  
  var isGameOver = false
  
  lazy var scoreLabel: SKLabelNode = {
    var label = SKLabelNode(fontNamed: "BubbleGum")
    label.fontSize = CGFloat.universalFont(size: 36)
    label.zPosition = 2
    label.color = SKColor.white
    label.horizontalAlignmentMode = .right
    label.verticalAlignmentMode = .center
    label.text = "\(scoreStartValue)"
    return label
  }()
  
  var score = 0
  var scoreStartValue = 6
  
  override func didMove(to view: SKView) {
    print("Inside Gameplay")
    backgroundColor = .cyan
    backButton.position = CGPoint(x: ScreenSize.width * 0.2, y: ScreenSize.heigth * 0.85)
    addChild(backButton)
    
    countdownLabel.position = CGPoint(x: ScreenSize.width * 0.06, y: ScreenSize.heigth * 0.79)
    addChild(countdownLabel)
    
    scoreLabel.position = CGPoint(x: ScreenSize.width * 0.94, y: ScreenSize.heigth * 0.79)
    addChild(scoreLabel)
    
    counter = counterStartValue
    startCounter()
    
    score = scoreStartValue
    
    addSwipeGestureRecognizers()
    
  }
  
  func addSwipeGestureRecognizers() {
    let gestureDirections: [UISwipeGestureRecognizerDirection] = [.up, .right, .down, .left]
    for gestureDirection in gestureDirections {
      let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
      gestureRecognizer.direction = gestureDirection
      self.view?.addGestureRecognizer(gestureRecognizer)
    }
  }
  
  @objc func handleSwipe(gesture: UIGestureRecognizer) {
    if let gesture = gesture as? UISwipeGestureRecognizer {
      switch gesture.direction {
      case .up:
        print("Swiped up")
      case .right:
        print("Swiped right")
      case .down:
        print("Swiped down")
      case .left:
        print("Swiped left")
      default:
        print("No such gesture")
      }
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch in touches {
      if touch == touches.first {
        print("Tapped")
        
        if !isGameOver {
          score -= 1
          updateScore()
        }
        
        if score <= 0 {
          isGameOver = true
          gameOver(won: true)
        }
      }
    }
  }
  
  func startCounter() {
    counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
  }
  
  func stopCounter() {
    counterTimer.invalidate()
  }
  
  @objc func decrementCounter() {
    
    if !isGameOver {
      
      if counter <= 1 {
        stopCounter()
        isGameOver = true
        gameOver(won: false)
      }
      
      counter -= 1
      //countdownLabel.text = "\(counter)"
      
      let minutes = counter / 60
      let seconds = counter % 60
      let minutesText = minutes < 10 ? "0\(minutes)" : "\(minutes)"
      let secondsText = seconds < 10 ? "0\(seconds)" : "\(seconds)"
      
//      if minutes < 10 {
//        minutesText = "0\(minutes)"
//      }
//
//      if seconds < 10 {
//        secondsText = "0\(seconds)"
//      }
      
      countdownLabel.text = "\(minutesText):\(secondsText)"
      
    }
  }
  
  func updateScore() {
    scoreLabel.text = "\(score)"
  }
  
  func gameOver(won: Bool) {
    print("Game Over with status: \(won)")
    
    if won {
      SKStoreReviewController.requestReview()
    }
    
  }
  
}













