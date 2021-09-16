//
//  PreviewPreviewViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 06/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol PreviewViewInput: AnyObject {
    func setupInitialState()
    func showStartScreen(_ quiz: Quiz)
    func showPart(_ quiz: Quiz)
}
