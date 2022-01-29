//
//  PartThreeModel.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27.01.2022.
//

import Foundation

public class PartThreeModel: NSObject, NSSecureCoding {
    var questionText: String?
    var userText: String?
    let ganningFoq: Double

    init(question: String, userText: String, ganningFoq: Double) {
        self.ganningFoq = ganningFoq
        self.userText = userText
        self.questionText = question
    }
    
    convenience init(answer: PartThreeAnswer) {
        self.init(question: answer.question, userText: answer.userText, ganningFoq: answer.ganningFoq)
    }
    
    //MARK: - NSSecureCoding
    public static var supportsSecureCoding: Bool = true
    
    private struct CodingKey {
        static let question = "question"
        static let userText = "userText"
        static let ganningFoq = "ganningFoq"
    }
    
    public required init?(coder: NSCoder) {
        self.questionText = coder.decodeObject(of: NSString.self, forKey: CodingKey.question) as String?
        self.userText = coder.decodeObject(of: NSString.self, forKey: CodingKey.userText) as String?
        self.ganningFoq = coder.decodeDouble(forKey: CodingKey.ganningFoq)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(questionText, forKey: CodingKey.question)
        coder.encode(userText, forKey: CodingKey.userText)
        coder.encode(ganningFoq, forKey: CodingKey.ganningFoq)
    }
}
