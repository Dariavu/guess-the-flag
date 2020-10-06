//
//  finalViewController.swift
//  Project2
//
//  Created by Daria Vuyiv on 10/5/20.
//  Copyright © 2020 Daria Vuyiv. All rights reserved.
//

import Foundation
import UIKit

class FinalViewContoller: UIViewController {
    
    // MARK: - Properties
    var finalScore = 0
    
    // MARK: - IBOutlets
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFinalScore(score: finalScore)
    
    }
    
    // MARK: - Public
    func setFinalScore(score: Int) {
        finalScoreLabel.text = "YOUR FINAL SCORE IS: \(finalScore)"
    }
}
