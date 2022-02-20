//
//  ExportExportViewInput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import Foundation

protocol ExportViewInput: AnyObject, ViewInput {
    func setupInitialState()
    func export(csvFile: URL)
}
