//
//  QuizObserver.swift
//  NeuroApp
//
//  Created by Nikita Gras on 29.08.2021.
//

import Foundation

protocol QuizObserver: AnyObject {
    func update(with quiz: Quiz)
}
