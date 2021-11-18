//
//  PlaceholderTextView.swift
//  NeuroApp
//
//  Created by Nikita Gras on 18.11.2021.
//

import UIKit

class PlaceholderTextView: UITextView, UITextViewDelegate {
    var placeholderText: String? {
        didSet {
            textColor = placeholderColor
            text = placeholderText
        }
    }
    private var placeholderColor: UIColor = UIColor.lightGray
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        self.delegate = self
        setupTextView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.delegate = self
        setupTextView()
    }
    
    private func setupTextView() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textColor == placeholderColor {
            textColor = UIColor.black
            textView.text = ""
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if text == "" {
            text = placeholderText
            textColor = placeholderColor
        }
    }
}
