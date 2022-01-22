//
//  HistoryMainHistoryMainInteractor.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/12/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

class HistoryMainInteractor: HistoryMainInteractorInput, Observer {
    weak var output: HistoryMainInteractorOutput!
    var service: QuizServiceProtocol!
    
    func initialized() {
        registerObserver()
    }
    
    func registerObserver() {
        service.register(self)
        service.didRegister(observer: self)
    }
    
    deinit {
        service.remove(self)
    }
    
    func update(with data: Any) {
        if let history = data as? [Session] {
            output.update(with: history)
        }
    }
}

