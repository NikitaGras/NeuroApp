//
//  OptionModel.swift
//  NeuroApp
//
//  Created by Nikita Gras on 27.01.2022.
//

import Foundation

public class OptionModel: NSObject, NSSecureCoding {
    var value: String?
    let isRight: Bool
    let isImage: Bool
    
    init(value: String, isRight: Bool, isImage: Bool) {
        self.value = value
        self.isRight = isRight
        self.isImage = isImage
    }
    
    convenience init(_ option: Option) {
        self.init(value: option.value, isRight: option.isRight, isImage: (option is ImageOption))
    }
    
    //MARK: - NSSecureCoding
    public static var supportsSecureCoding: Bool = true
    
    private struct CodingKey {
        static let value = "value"
        static let isRight = "isRight"
        static let isImage = "isImage"
    }
    
    public required init?(coder: NSCoder) {
        value = coder.decodeObject(of: NSString.self, forKey: CodingKey.value) as String?
        isRight = coder.decodeBool(forKey: CodingKey.isRight)
        isImage = coder.decodeBool(forKey: CodingKey.isImage)
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(value, forKey: CodingKey.value)
        coder.encode(isRight, forKey: CodingKey.isRight)
        coder.encode(isImage, forKey: CodingKey.isImage)
    }
}
