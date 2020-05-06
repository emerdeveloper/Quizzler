//
//  ViewController.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 9/6/19.
//  Copyright © 2019 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrainTrueFalse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelQuestion.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        
        if quizBrain.checkAnswer(userAnswer!) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI() {
        labelQuestion.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        labelScore.text = "Score: \(quizBrain.getScore())"
        buttonTrue.backgroundColor = UIColor.clear
        buttonFalse.backgroundColor = UIColor.clear
    }
}

