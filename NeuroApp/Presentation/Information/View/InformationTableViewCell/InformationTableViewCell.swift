//
//  InformationTableViewCell.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05.02.2022.
//

import UIKit

class InformationTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var informationLabel: UILabel!
    @IBOutlet weak var arrowImageView: UIImageView!
    
    var state: InformationTableViewCellState!
    
    override func awakeFromNib() {
        self.state = InformationCellClosedState()
        state.update(self)
        self.selectionStyle = .none
    }
    
    func fill(with information: Information) {
        titleLabel.text = information.title
        informationLabel.text = information.text
    }
    
    func changeState(_ completion: @escaping () -> Void) {
        state = state is InformationCellOpenState ? InformationCellClosedState() : InformationCellOpenState()
        state.update(self)
        completion()
    }
}
