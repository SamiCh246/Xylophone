//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!//hold option to view definition

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)//! ensures that every image attached to the IBAction has a title. Otherwise, it should have a ?
    }
    
    @IBAction func keyPressed2(_ sender: UIButton)
    {
        //Reduces the sender's (the button that got pressed) opacity to half.
        sender.alpha = 0.5
        //Code should execute after 0.2 second delay.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
        //Bring's sender's opacity back up to fully opaque.
        sender.alpha = 1.0
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //url is a constant made to locate our sound file resource from the main bundle in the disk area located for the app
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
/*try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
playback category gives priority to the sound to be played even when the phone is silent
this change tye default audio session and creates a new session in which sound is played even when phone in silent*/
    }
}

