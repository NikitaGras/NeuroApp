//
//  PartOneMpdel.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27.01.2022.
//

import Foundation

public class PartOneModel: NSObject, NSSecureCoding {
    var questionText: String?
    let value: Int
    
    init(questionText: String, value: Int) {
        self.questionText = questionText
        self.value = value
    }
    
    convenience init(answer: PartOneAnswer) {
        self.init(questionText: answer.questionText, value: answer.value)
    }
    
    // MARK: - NSSecureCoding
    public static var supportsSecureCoding: Bool = true
    
    private struct CodingKey {
        static let questionText = "questionText"
        static let value = "value"
    }
    
    required public init?(coder: NSCoder) {
        self.questionText = coder.decodeObject(of: NSString.self, forKey: CodingKey.questionText) as String?
        self.value = coder.decodeInteger(forKey: CodingKey.value)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(questionText, forKey: CodingKey.questionText)
        coder.encode(value, forKey: CodingKey.value)
    }
}
