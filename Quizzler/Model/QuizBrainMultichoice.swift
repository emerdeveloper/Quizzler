//
//  QuizBrainMultichoice.swift
//  Quizzler
//
//  Created by Emerson Javid Gonzalez Morales on 6/05/20.
//  Copyright © 2020 Emerson Javid Gonzalez Morales. All rights reserved.
//

import Foundation

struct QuizBrainMultichoice {
    var questionNumber = 0
    var score = 0
    
    let quiz = [
        QuestionMultichoice(text: "Which is the largest organ in the human body?", answers: ["Heart", "Skin", "Large Intestine"], rightAnswer: "Skin"),
        QuestionMultichoice(text: "Five dollars is worth how many nickels?", answers: ["25", "50", "100"], rightAnswer: "100"),
        QuestionMultichoice(text: "What do the letters in the GMT time zone stand for?", answers: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], rightAnswer: "Greenwich Mean Time"),
        QuestionMultichoice(text: "What is the French word for 'hat'?", answers: ["Chapeau", "Écharpe", "Bonnet"], rightAnswer: "Chapeau"),
        QuestionMultichoice(text: "In past times, what would a gentleman keep in his fob pocket?", answers: ["Notebook", "Handkerchief", "Watch"], rightAnswer: "Watch"),
        QuestionMultichoice(text: "How would one say goodbye in Spanish?", answers: ["Au Revoir", "Adiós", "Salir"], rightAnswer: "Adiós"),
        QuestionMultichoice(text: "Which of these colours is NOT featured in the logo for Google?", answers: ["Green", "Orange", "Blue"], rightAnswer: "Orange"),
        QuestionMultichoice(text: "What alcoholic drink is made from molasses?", answers: ["Rum", "Whisky", "Gin"], rightAnswer: "Rum"),
        QuestionMultichoice(text: "What type of animal was Harambe?", answers: ["Panda", "Gorilla", "Crocodile"], rightAnswer: "Gorilla"),
        QuestionMultichoice(text: "Where is Tasmania located?", answers: ["Indonesia", "Australia", "Scotland"], rightAnswer: "Australia")
    ]
    
    func getAnswers() -> [String] {
        return quiz[questionNumber].answers
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if (userAnswer == quiz[questionNumber].rightAnswer) {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
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
