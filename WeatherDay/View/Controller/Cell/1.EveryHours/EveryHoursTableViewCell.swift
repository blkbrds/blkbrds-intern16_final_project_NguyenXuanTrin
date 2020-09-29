//
//  EveryHoursTableViewCell.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/28/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class EveryHoursTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!

    // MARK: - Properties
    var viewModel: EveryHoursTableViewCellViewModel? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    var maxTemp: Int = 30
    var minTemp: Int = 0
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
}

// MARK: - UICollectionViewDelegate
extension EveryHoursTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 5 }
        return viewModel.numberOfItemsInSection()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withClass: EveryHoursCollectionViewCell.self, for: indexPath)
        guard let viewModel = viewModel else { return UICollectionViewCell() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        cell.frame.origin.y = CGFloat(220 - temps[indexPath.row])
        return cell
    }
}

extension EveryHoursTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var temp: EveryHours
        var temperature: Int = 0
        temp = viewModel?.viewModelForCell(at: indexPath) as! EveryHours
        temperature = temp.temperature
        temps.append(temperature * 220 / maxTemp)
        if temperature > minTemp && temperature < maxTemp {
            return CGSize(width: 70, height: temperature * 220 / maxTemp)
        } else {
            return CGSize(width: 70, height: 220)
        }
    }
}

