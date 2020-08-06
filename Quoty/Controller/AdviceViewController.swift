//
//  AdviceViewController.swift
//  Quoty
//
//  Created by Venkatesh on 06/08/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit
import AVFoundation
import ChameleonFramework

class AdviceViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var adviceLabel: UILabel!
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var adviceData = AdviceData()
    override func viewDidLoad() {
        super.viewDidLoad()
        adviceData.delegate = self
        adviceData.networking()
        bgColor()
        
    }
    
//MARK: -Background Color
    func bgColor(){
        view.backgroundColor = UIColor.randomFlat()
        adviceLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor!, isFlat: true)
        backButton.tintColor = UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor!, isFlat: true)
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }

}
extension AdviceViewController: AdviceDataDelegate{
    func getAdvice(advice: String) {
        let speechUtterance = AVSpeechUtterance(string: advice)
        DispatchQueue.main.async {
            self.adviceLabel.text = advice
            self.speechSynthesizer.speak(speechUtterance)
        }
    }
    
    
}
