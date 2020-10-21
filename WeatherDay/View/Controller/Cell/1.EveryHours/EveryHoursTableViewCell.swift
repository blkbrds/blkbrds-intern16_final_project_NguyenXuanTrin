//
//  EveryHoursTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class EveryHoursTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: EveryHoursTableViewCellViewModel? {
        didSet {
            updateView()
        }
    }
    var heights: [Int] = []
    var temps: [Int] = []

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        configCollectionView()
    }

    private func configCollectionView() {
        collectionView.register(nibWithCellClass: EveryHoursCollectionViewCell.self)
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    private func updateView() {
        heights = []
        temps = []
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension EveryHoursTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 1 }
        return viewModel.numberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: EveryHoursCollectionViewCell.self, for: indexPath)
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        guard 0 <= indexPath.row && indexPath.row < heights.count else { return cell }
        cell.frame.origin.y = CGFloat(220 - heights[indexPath.row])
        return cell
    }
}

extension EveryHoursTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var temperature: Int = 0
        var height = 0
        if let forecastsEveryHours: ForecastsEveryHours = viewModel?.viewModelForCell(at: indexPath), let viewModel = viewModel {
            temperature = forecastsEveryHours.temperatureToday
            let max = viewModel.findMax()
            if temperature <= max / 2 {
                heights.append(120)
                height = 120
            } else {
                heights.append(temperature * 220 / max)
                height = temperature * 220 / max
            }
        }
        return CGSize(width: 60, height: height)
    }
}
