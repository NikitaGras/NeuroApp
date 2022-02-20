//
//  ExportExportViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 19/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class ExportViewController: UIViewController, ExportViewInput {
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var exportButton: RoundButton!
    var output: ExportViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: ExportViewInput
    func setupInitialState() {
        instructionLabel.text = String.Export.information
        exportButton.setTitle(String.Button.export, for: .normal)
        exportButton.setBackgroundColor(UIColor.NABlue, for: .normal)
        exportButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
    }
    
    @IBAction func export(_ sender: Any) {
        output.prepareCsvFile()
    }
    
    func export(csvFile: URL) {
        let vc = UIActivityViewController(activityItems: [csvFile], applicationActivities: nil)
        self.present(vc, animated: true, completion: nil)
    }
}
