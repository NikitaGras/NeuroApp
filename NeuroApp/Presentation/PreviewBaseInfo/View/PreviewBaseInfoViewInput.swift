//
//  PreviewBaseInfoPreviewBaseInfoViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 24/09/2021.
//  Copyright © 2021 MyCompany. All rights reserved.
//

protocol PreviewBaseInfoViewInput: AnyObject {
    func setupInitialState()
    func update(with state: Quiz.State)
}
