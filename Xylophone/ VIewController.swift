//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation // Step 1

class ViewController: UIViewController, AVAudioPlayerDelegate { // Step 2
    
    var audioPlayer : AVAudioPlayer! // Step 3
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        let selectedSoundFileName : String = soundArray[sender.tag - 1]
        playSound(selectedSound: selectedSoundFileName)
        
    }
    
    func playSound(selectedSound : String) {
        
        let soundURL = Bundle.main.url(forResource: selectedSound, withExtension: "wav") // Step 4
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!) // Step 5
        }
        catch {
            print(error)
        }
        
        audioPlayer.play() // Step 6
        
    }

}

