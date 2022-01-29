//
//  ScoreScreenScoreScreenViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 20/11/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol ScoreScreenViewInput: AnyObject, ViewInput {
    func setupInitialState()
    func setup(with result: Session)
}
