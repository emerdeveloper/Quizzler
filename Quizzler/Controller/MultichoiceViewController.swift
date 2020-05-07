//
//  MultichoiceViewController.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 6/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import UIKit

class MultichoiceViewController: UIViewController, ModalHandler {

    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var buttonChoiceOne: UIButton!
    @IBOutlet weak var buttonChoiceTwo: UIButton!
    @IBOutlet weak var buttonChoiceThree: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizBrain = QuizBrainMultichoice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
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
        buttonChoiceOne.setTitle(quizBrain.getAnswers()[0], for: .normal)
        buttonChoiceTwo.setTitle(quizBrain.getAnswers()[1], for: .normal)
        buttonChoiceThree.setTitle(quizBrain.getAnswers()[2], for: .normal)

        let progress = quizBrain.getProgress()
        let score = quizBrain.getScore()
        labelQuestion.text = quizBrain.getQuestionText()
        progressBar.progress = progress
        labelScore.text = "Score: \(score)"
        buttonChoiceOne.backgroundColor = UIColor.clear
        buttonChoiceTwo.backgroundColor = UIColor.clear
        buttonChoiceThree.backgroundColor = UIColor.clear
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
