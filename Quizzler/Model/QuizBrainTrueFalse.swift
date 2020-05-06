//
//  QuizBrain.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 6/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import Foundation

struct QuizBrainTrueFalse {
    
    let quiz = [
        QuestionTrueFalse(text: "A slug's blood is green.", answer: "True"),
        QuestionTrueFalse(text: "Approximately one quarter of human bones are in the feet.", answer: "True"),
        QuestionTrueFalse(text: "The total surface area of two human lungs is approximately 70 square metres.", answer: "True"),
        QuestionTrueFalse(text: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", answer: "True"),
        QuestionTrueFalse(text: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", answer: "False"),
        QuestionTrueFalse(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True"),
        QuestionTrueFalse(text: "You can lead a cow down stairs but not up stairs.", answer: "False"),
        QuestionTrueFalse(text: "Google was originally called 'Backrub'.", answer: "True"),
        QuestionTrueFalse(text: "Buzz Aldrin's mother's maiden name was 'Moon'.", answer: "True"),
        QuestionTrueFalse(text: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", answer: "False"),
        QuestionTrueFalse(text: "No piece of square dry paper can be folded in half more than 7 times.", answer: "False"),
        QuestionTrueFalse(text: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", answer: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if (userAnswer == quiz[questionNumber].answer) {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        Float(questionNumber + 1)/Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func nextQuestion() {
        if questionNumber < (quiz.count - 1) {
                questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
