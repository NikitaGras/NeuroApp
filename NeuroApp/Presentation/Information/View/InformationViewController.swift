//
//  InformationInformationViewController.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05/02/2022.
//  Copyright © 2022 MyCompany. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController, InformationViewInput {
    @IBOutlet weak var tableView: UITableView!
    
    var output: InformationViewOutput!
    
    let information: [Information] = [
        Information(title: String.Information.title, text: String.Information.text),
        Information(title: String.Information.title, text: String.Information.text),
        Information(title: String.Information.title, text: String.Information.text),
        Information(title: String.Information.title, text: String.Information.text),
        Information(title: String.Information.title, text: String.Information.text),]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
        tableView.register(cell: InformationTableViewCell.self)
    }

    func setupInitialState() {
        
    }
}

extension InformationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.identifier) as! InformationTableViewCell
        cell.fill(with: information[indexPath.row])
        return cell
    }
}

extension InformationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? InformationTableViewCell else {
            return
        }
        tableView.beginUpdates()
        cell.changeState {
            tableView.endUpdates()
        }
    }
}
