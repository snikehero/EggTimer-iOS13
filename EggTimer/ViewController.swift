//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    let softEgg = 5
    let mediumEgg = 7
    let hardEgg = 12
    var totalTime = 0
    var secondsPassed = 0
    
    @IBOutlet weak var timerChange: UILabel!
    
    @IBOutlet weak var timerSeconds: UILabel!
    let eggTimes: [String : Int] = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 0
        timerChange.text = hardness
        timerSeconds.text = "Seconds: \(eggTimes[hardness]!)"
       timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            timerSeconds.text = "Seconds: \(totalTime - secondsPassed)"
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            timerChange.text = "DONE!"
        }
    }
}
