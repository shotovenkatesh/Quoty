//
//  JokeViewController.swift
//  Quoty
//
//  Created by Venkatesh on 03/08/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit
import AVFoundation
import ChameleonFramework

class JokeViewController: UIViewController{
    
    let speechSynthesizer = AVSpeechSynthesizer()
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var jokeLabel: UILabel!
    
    var jokeData = JokeData()
    var joke : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeData.delegate = self
        jokeData.networking()
        bgColor()
    }
//MARK: -Background Color
    func bgColor(){
        view.backgroundColor = UIColor.randomFlat()
        jokeLabel.textColor = UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor!, isFlat: true)
        backButton.tintColor = UIColor(contrastingBlackOrWhiteColorOn: view.backgroundColor!, isFlat: true)
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
}
//MARK: -Getting the joke
extension JokeViewController : JokeDataDelegate{
    func getJoke(joke: String) {
        let speechUtterance = AVSpeechUtterance(string: joke)
        DispatchQueue.main.async {
            self.jokeLabel.text = joke
            self.speechSynthesizer.speak(speechUtterance)
            
        }
        
    }
    
}
