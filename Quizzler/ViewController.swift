//
//  ViewController.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 9/6/19.
//  Copyright © 2019 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let quiz = [ ["Four + Two is equal to Six", "True"],
                 ["Five - Three is greater tha One", "True"],
                 ["Three  + Eight is less than Ten", "False"]]
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelQuestion.text = quiz[questionNumber][0]
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        if (userAnswer == quiz[questionNumber][1]) {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if questionNumber < (quiz.count - 1) {
                questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        
        updateQuestion()
    }
    
    private func updateQuestion() {
        labelQuestion.text = quiz[questionNumber][0]
    }
}

