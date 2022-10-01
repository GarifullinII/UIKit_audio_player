//
//  ViewController.swift
//  UIKit_audio_player
//
//  Created by Ildar Garifullin on 01/10/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var slider = UISlider()

    @IBOutlet var sliderVolume: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // slider
        self.slider.frame = CGRect(x: 110, y: 480, width: 200, height: 23)
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100
        self.view.addSubview(slider)
        self.slider.addTarget(self,
                              action: #selector(changeSlider),
                              for: .valueChanged)
        
        // player
        do {
            if let audioPath = Bundle.main.path(forResource: "I'm a soldier", ofType: "mp3") {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        self.player.play()
    }
    
    // action
    @IBAction func playButton(_ sender: UIButton) {
        self.player.play()
    }
    
    @IBAction func pauseButton(_ sender: UIButton) {
        self.player.pause()
    }
    
    @IBAction func actionSliderVolume(_ sender: UISlider) {
        self.player.volume = self.sliderVolume.value
    }
    
    // func changeSlider
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
}

