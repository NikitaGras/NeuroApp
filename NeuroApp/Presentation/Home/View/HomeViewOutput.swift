//
//  HomeHomeViewOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol HomeViewOutput {
    var quiz: Quiz { get }
    func viewIsReady()
    func openQuiz()
    func startTimer()
}
