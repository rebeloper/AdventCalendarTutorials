//
//  GameViewController.swift
//  AdventCalendarTutorials
//
//  Created by Alex Nagy on 01/12/2017.
//  Copyright © 2017 Alex Nagy. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
  
  let skView: SKView = {
    let view = SKView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  lazy var backgroundMusic: AVAudioPlayer? = {
    guard let url = Bundle.main.url(forResource: kBackgroundMusicName, withExtension: kBackgroundMusicExtension) else {
      return nil
    }
    do {
      let player = try AVAudioPlayer(contentsOf: url)
      player.numberOfLoops = -1
      return player
    } catch {
      return nil
    }
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(skView)
    
    skView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    skView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    skView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    skView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    
    let scene = MainMenu(size: CGSize(width: ScreenSize.width, height: ScreenSize.heigth))
    scene.scaleMode = .aspectFill
    skView.presentScene(scene)
    skView.ignoresSiblingOrder = true
    
    playStopBackgroundMusic()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func playStopBackgroundMusic() {
    if ACTPlayerStats.shared.getSound() {
      backgroundMusic?.play()
    } else {
      backgroundMusic?.stop()
    }
  }
  
}















