//
//  MotivationViewController.swift
//  Quoty
//
//  Created by Venkatesh on 06/08/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit
import AVFoundation
import ChameleonFramework

class MotivationViewController: UIViewController {
    
    var motivationData = MotivationData()
    @IBOutlet weak var backButton: UIButton!
    let speechSynthesizer = AVSpeechSynthesizer()
    
    @IBOutlet weak var motivationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        motivationData.delegate = self
        motivationData.networking()
        bgColor()
    }
  
//MARK: -Background color
    
    func bgColor(){
        view.backgroundColor = UIColor.randomFlat()
        motivationLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor!, isFlat: true)
        backButton.tintColor = UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor!, isFlat: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
}
//MARK: -Getting Motivation Data
extension MotivationViewController : MotivationDataDelegate{
    func getMotivation(motivation: String) {
        let speechUtterance = AVSpeechUtterance(string: motivation)
        DispatchQueue.main.async {
           self.motivationLabel.text = motivation
           speechUtterance.rate = 0.50
           self.speechSynthesizer.speak(speechUtterance)
            
        }
    }
    
    
}
