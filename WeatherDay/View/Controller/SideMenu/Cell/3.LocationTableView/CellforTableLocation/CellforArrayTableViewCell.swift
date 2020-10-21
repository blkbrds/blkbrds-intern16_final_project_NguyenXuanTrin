//
//  CellforArrayTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/8/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class CellforArrayTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var locationNameLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: CellforArrayViewModel? {
        didSet {
            updateView()
        }
    }
    
    // MARK: - Life cycle
    override func awakeFromNib() {
        backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
    }
    
    // MARK: - Functions
    func updateView() {
        guard let viewModel = viewModel else { return }
        locationNameLabel.text = viewModel.locationName
    }
    
}
