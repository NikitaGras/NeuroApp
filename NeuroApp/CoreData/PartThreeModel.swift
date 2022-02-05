//
//  PartThreeModel.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27.01.2022.
//

import Foundation

public class PartThreeModel: NSObject, NSSecureCoding {
    var questionText: String? {
        return _questionText as String
    }
    var userText: String? {
        return _userText as String
    }
    private var _questionText: NSString
    private var _userText: NSString
    let ganningFoq: Double

    init(question: String, userText: String, ganningFoq: Double) {
        self.ganningFoq = ganningFoq
        self._userText = userText as NSString
        self._questionText = question as NSString
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
        self._questionText = coder.decodeObject(of: NSString.self, forKey: CodingKey.question) ?? ""
        self._userText = coder.decodeObject(of: NSString.self, forKey: CodingKey.userText) ?? ""
        self.ganningFoq = coder.decodeDouble(forKey: CodingKey.ganningFoq)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(_questionText, forKey: CodingKey.question)
        coder.encode(_userText, forKey: CodingKey.userText)
        coder.encode(ganningFoq, forKey: CodingKey.ganningFoq)
    }
}
