//
//  ViewController.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 9/6/19.
//  Copyright © 2019 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalHandler {
    
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
        let score = quizBrain.getScore()
        let progress = quizBrain.getProgress()
        labelQuestion.text = quizBrain.getQuestionText()
        progressBar.progress = progress
        labelScore.text = "Score: \(score)"
        buttonTrue.backgroundColor = UIColor.clear
        buttonFalse.backgroundColor = UIColor.clear
        showPopup(progress: progress, score: score)
    }
    
    func showPopup(progress: Float, score: Int) {
        if (progress == 1) {
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Popup") as? PopupViewController
            {
                vc.score = String(Int(score * 10))
                vc.modalHandlerDelegate = self
                present(vc, animated: true)
            }
        }
    }
    
    func modalDismissed() {
        quizBrain.nextQuestion()
        updateUI()
    }
}

