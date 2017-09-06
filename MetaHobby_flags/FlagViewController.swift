//
//  ViewController.swift
//  MetaHobby_flags
//
//  Created by qst0 on 9/5/17.
//  Copyright © 2017 qst0. All rights reserved.
//

import UIKit
import GameplayKit

class FlagViewController: UIViewController {
    
    @IBOutlet weak var flagButton1: UIButton!
    @IBOutlet weak var flagButton2: UIButton!
    @IBOutlet weak var flagButton3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flagButton1.layer.borderWidth = 1
        flagButton2.layer.borderWidth = 1
        flagButton3.layer.borderWidth = 1
        
        flagButton1.layer.borderColor = UIColor.lightGray.cgColor
        flagButton2.layer.borderColor = UIColor.lightGray.cgColor
        flagButton3.layer.borderColor = UIColor.lightGray.cgColor
        
        //How to create your own color:
        //UIColor(red: 1.0, green: 0.6, blue: 0.2, alpha: 1.0).cgColor
        
        //Changed the countries to have capitilzation here, then lowercase in the image name
        countries += ["Estonia", "France", "Germany", "Ireland", "Italy",
                      "Monaco", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
        
        askQuestion() //Ask the first questions and we're off!
        print("😎👌 We have lift off! 🚀")
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        flagButton1.setImage(UIImage(named: countries[0].lowercased()), for: .normal)
        flagButton2.setImage(UIImage(named: countries[1].lowercased()), for: .normal)
        flagButton3.setImage(UIImage(named: countries[2].lowercased()), for: .normal)
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = "Which flag is from \(countries[correctAnswer])?"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"; score += 1
        } else {
            title = "Wrong"; score -= 1
        }
        
        let alertText = "Your score is \(score)."
        
        let ac = UIAlertController(title: title, message: alertText, preferredStyle: .alert)
        //use .alert for changes and .actionSheet for sets of options
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        // .default .cancle and .destructive (types of AC actions)
        present(ac, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

