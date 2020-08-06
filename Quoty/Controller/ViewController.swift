//
//  ViewController.swift
//  Quoty
//
//  Created by Venkatesh on 25/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var BottomButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonBorder(top: topButton, middle: middleButton, bottom: BottomButton)
        
    }
    
    
    func buttonBorder(top:UIButton , middle:UIButton , bottom:UIButton ){
        top.layer.cornerRadius = 25
        top.layer.borderWidth = 3.0
        top.layer.borderColor = UIColor.darkGray.cgColor
        
        middle.layer.cornerRadius = 25
        middle.layer.borderWidth = 3.0
        middle.layer.borderColor = UIColor.darkGray.cgColor
        
        bottom.layer.cornerRadius = 25
        bottom.layer.borderWidth = 3.0
        bottom.layer.borderColor = UIColor.darkGray.cgColor
    }
    
    @IBAction func jokeButtonPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "joke", sender: self)
    }

    
}

