

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
   
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 8]
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    
    let alarmSound = URL(fileURLWithPath: Bundle.main.path(forResource: "alarm_sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()

    
    @IBAction func hardestSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        titleLabel.text = hardness
      
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        
        if secondsPassed < totalTime {
            
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
        }
        else  {
            timer.invalidate()
            titleLabel.text = "Done"
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }
        
    }
    
    
}
