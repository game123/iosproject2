//
//  ViewController.swift
//  Project2
//
//  Created by Kevin Chan on 8/22/20.
//  Copyright © 2020 Visionary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        countries += ["estonia", "france", "germany",
            "ireland", "italy", "monaco", "nigeria",
            "poland", "russia", "spain", "uk", "us"]
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]),
            for: .normal)
        button2.setImage(UIImage(named: countries[1]),
        for: .normal)
        button3.setImage(UIImage(named: countries[2]),
        for: .normal)
        
        title = countries[correctAnswer].uppercased() + "    Total score:\(score)"
        questionCount += 1
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var msg: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            msg = "Your score is \(score)"
        } else {
            title = "Wrong"
            score -= 1
            msg = "Wrong answer! Your score is \(score)"
            
        }
        
        if ( questionCount == 10 ) {
            var fTitle: String
                fTitle = "You have answer 10 questions"
            var tmp = 0
            tmp = score
            var fScore: String
                fScore = "Your total score is \(tmp)"
            questionCount = 0
            score = 0
            let qc = UIAlertController(title: fTitle, message: fScore,
                preferredStyle: .alert)
            qc.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
            
            present(qc, animated: true)
        }
        
        let ac = UIAlertController(title: title, message:
                msg, preferredStyle:
            .alert)
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        
        present(ac, animated: true)
        
        
    }
    
}

