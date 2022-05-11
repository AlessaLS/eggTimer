//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
   
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var Done: UILabel!
    let eggTimes = ["Soft": 300, "Medium": 420, "Hard": 720]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPast = 0

    @IBAction func selectedHard(_ sender: UIButton) {
       
        
        timer.invalidate()
        let hardness = sender.currentTitle!
       totalTime = eggTimes[hardness]!
        
        progressbar.progress = 0.0
        secondsPast = 0
        Done.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPast < totalTime {
            secondsPast += 1
            progressbar.progress = Float(secondsPast) / Float(totalTime)
            print(Float(secondsPast) /  Float(totalTime))
        } else {
            timer.invalidate()
          Done.text = "DONE!"
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    player = try! AVAudioPlayer(contentsOf: url!)
                    player.play()
            }
        }
    }
