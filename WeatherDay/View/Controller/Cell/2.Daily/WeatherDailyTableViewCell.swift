//
//  WeatherDailyTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/29/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class WeatherDailyTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: WeatherDailyTableCellViewModel? {
        didSet {
            self.tableView.reloadData()
        }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        configTableView()
    }

    // MARK: - Private Functions
    private func configTableView() {
        tableView.register(nibWithCellClass: DailyTableViewCell.self)
        tableView.dataSource = self
    }
}

// MARK: - Extension
extension WeatherDailyTableViewCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 7 }
        return viewModel.numberOfRowInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: DailyTableViewCell.self, for: indexPath)
        guard let viewModel = viewModel else { return UITableViewCell() }
        cell.viewModel = viewModel.viewModelForRows(at: indexPath)
        return cell
    }
}
