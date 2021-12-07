//
//  String+errorDescription.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12.07.2021.
//

import Foundation

extension String {
    static let error = "Error"
    
    struct Error {
        static let `default` = "Something going wrong. Try again later"
        static let noUser = "Sorry, your data was lost"
    }
    
    struct ValidationError {
        static let wrongName = "Wrong name"
        static let wrongAge = "Wrong age"
        static let wrongEmail = "Wrong email"
        static let shortAnswer = "Your answer must contain more than 50s characters"
    }
    
    struct UserStatus {
        static let none = "Your cognitive behavior status will appear here after you complete at least 3 questionnaires"
        static let negative = "Negative"
        static let positive = "Positive"
    }
    
    struct QuizState {
        static let begin = "BEGIN QUESTIONNAIRE"
        static let proceed = "RESUME QUESTIONNAIRE"
        static let notAvailable = "DAYS UNTIL NEXT SESSION"
    }
    
    struct Preview {
        static let beginInfo = "Please answer the next few questions as quiqly as you can and to the best of your ability. The questionaire will consist of 3 parts: Self-Efficacy, Short-Answer and Long-Answer questions"
        static let partOneTitle = "Part 1: Self Efficacy"
        static let partOneInfo = "The following questions are designed to help us get a better understanding of any symptoms you might be experiencing in the areas of attention, memmory, organization and thinking. Please try to be objective in your answers."
        static let partTwoTitle = "Part 2: Short Answer"
        static let partTwoInfo = "The following questions are designed to test you using a few simple short-answer questions. Please try to answer these questions quickly and correctly."
        static let partThreeTitle = "Part 3: Long Answer"
        static let partThreeInfo = "The following questions are designed to test you using a few long-answer question. Please try to provide detailed medium-sized answers. You might find the dictating feature in your keyboard helpful."
    }
    
    struct Warning {
        static let title = "Warning"
        static let message = "Are you sure you want to erase your data in this app?"
    }
    
    struct PartOneQuiz {
        static let taskText = "Using the scale provided, please rate how certain you are can do the folloving actions:"
        static let leftScaleDescription = "Cannot do at all"
        static let centerScaleDescription = "Modarately can do"
        static let rightScaleDescription = "Highly certain can do"
    }
    
    struct PartThreeQuiz {
        static let placeholder = "Input your answer here"
    }
    
    struct Button {
        static let next = "NEXT"
        static let begin = "BEGIN"
        static let ok = "OK"
        static let goHome = "GO TO HOME PAGE"
        static let backHome = "Home"
        static let backQuiz = "Questionnaire"
    }
    
    struct Score {
        static let score = "Score:"
        static let avarage = "Averge:"
        static let partOne = "Part 1:"
        static let partTwo = "Part 2:"
        static let partThree = "Part 3:"
        
        static let mainText = "Thank you for finishing the questionnaire! \n\nYou scores are:"
        static let yourRecentScore = "Your recent scores:"
    }
    struct History {
        static let empty = "You have no history yet. You can watch your history if you have answered at least one quiestionnaire!"
    }
}
