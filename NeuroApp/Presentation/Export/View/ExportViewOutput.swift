//
//  ExportExportViewOutput.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import Foundation

protocol ExportViewOutput {
    func viewIsReady()
    func prepareCsvFile()
}
