//
//  ViewController.swift
//  Project2
//
//  Created by Daria Vuyiv on 10/3/20.
//  Copyright © 2020 Daria Vuyiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var seconds = 30
    var timer = Timer()
    
    // MARK: - IBOutlets
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var button3: UIButton!
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button1.layer.cornerRadius = 10
        button1.clipsToBounds = true
        
        button2.layer.borderWidth = 1
        button2.layer.cornerRadius = 10
        button2.clipsToBounds = true
        
        button3.layer.borderWidth = 1
        button3.layer.cornerRadius = 10
        button3.clipsToBounds = true
        
        askQuestion()
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        questionLabel.text = countries[correctAnswer].uppercased()
        
        scoreLabel.text = "\(score)"
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timeLabel.text = String(seconds)
        
        if seconds == 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let finalVC = storyboard.instantiateViewController(identifier: "FinalViewContoller") as? FinalViewContoller else { return }
            finalVC.finalScore = score 
            navigationController?.pushViewController(finalVC, animated: true)
            timer.invalidate()
        }
    }
    // MARK: - IBActions
    @IBAction func firstButtonTapped(_ sender: Any) {
        if correctAnswer == 0 {
            score += 1
        } else {
            score -= 1
        }
        askQuestion()
    }
    @IBAction func secondButtonTapped(_ sender: Any) {
        if correctAnswer == 1 {
            score += 1
        } else {
            score -= 1
        }
        askQuestion()
    }
    @IBAction func thirdButtonTapped(_ sender: Any) {
        if correctAnswer == 2 {
            score += 1
        } else {
            score -= 1
        }
        askQuestion()
    }
}

