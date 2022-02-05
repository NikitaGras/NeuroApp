//
//  PartTwoModel.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27.01.2022.
//

import Foundation

public class PartTwoModel: NSObject, NSSecureCoding {
    var questionText: String? {
        return _questionText as String
    }
    private var _questionText: NSString
    var option: OptionModel?
    let responseTime: TimeInterval
    
    init(questionText: String, option: OptionModel, responseTime: TimeInterval) {
        self._questionText = questionText as NSString
        self.option = option
        self.responseTime = responseTime
    }
    
    convenience init(answer: PartTwoAnswer) {
        let option = OptionModel(option: answer.option)
        self.init(questionText: answer.questionText, option: option, responseTime: answer.responseTime)
    }
    
    //MARK: - NSSecureCoding
    public static var supportsSecureCoding: Bool = true
    
    private struct CodingKey {
        static let questionText = "questionText"
        static let option = "option"
        static let responseTime = "responseTime"
    }
    
    public required init?(coder: NSCoder) {
        self._questionText = coder.decodeObject(of: NSString.self, forKey: CodingKey.questionText) ?? ""
        self.option = coder.decodeObject(of: OptionModel.self, forKey: CodingKey.option)
        self.responseTime = coder.decodeDouble(forKey: CodingKey.responseTime)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(_questionText, forKey: CodingKey.questionText)
        coder.encode(option, forKey: CodingKey.option)
        coder.encode(responseTime, forKey: CodingKey.responseTime)
    }
}
