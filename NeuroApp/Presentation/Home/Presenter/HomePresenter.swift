//
//  HomeHomePresenter.swift
//  NeuroApp
//
//  Created by Nikita Gras on 12/07/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//
import Foundation

class HomePresenter: HomeModuleInput, HomeViewOutput, HomeInteractorOutput {
    lazy var timer: Timer = {
        let timeInterval = 1.0
        let timer = Timer(timeInterval: timeInterval, repeats: true) { [weak self] timer in
            self?.setupButtonTitle()
        }
        return timer
    }()
    
    weak var view: HomeViewInput!
    
    var interactor: HomeInteractorInput!
    var router: HomeRouterInput!
    
    var quiz: Quiz {
        interactor.quiz
    }
    
    func viewIsReady() {
        view.setupInitialState()
        interactor.initialized()
    }
    
    func update(with quiz: Quiz) {
        view.update(with: quiz)
    }
    
    func update(with user: User) {
        view.update(with: user)
    }
    
    func openQuiz() {
        if interactor.quiz.state == .begin {
            router.openPreviewBaseInfo()
        }
        if interactor.quiz.isProceed {
            router.openPreviewPartInfo()
        }
    }
    
    func openLogin() {
        router.openLogin()
    }
    
    //MARK: - Timer
    func startTimer() {
        RunLoop.current.add(timer, forMode: .default)
    }
    
    func setupButtonTitle() {
        let currentTime = Date().timeIntervalSince1970
        let startTime = interactor.getFinishTime()
        let interval = 26.0
        let timeInterval = interval - (currentTime - startTime)
        
        if timeInterval > 1 {
            view.setupButtonTitle(with: timeInterval.rounded())
        } else {
            timer.invalidate()
            interactor.startNewQuiz()
            timer = {
                let timeInterval = 1.0
                let timer = Timer(timeInterval: timeInterval, repeats: true) { [weak self] timer in
                    self?.setupButtonTitle()
                }
                return timer
            }()
        }
    }
}
