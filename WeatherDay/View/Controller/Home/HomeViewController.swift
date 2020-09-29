//
//  HomeViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

private struct Configure {
    static var titleName: String = "Home"
}

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var fullScreenImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModel = HomeViewModel()
    var weatherTodayCellId: String = "WeatherTodayCell"

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        configNavi()
        fullScreenImageView.addBlurEffect()
        configTableview()
    }

    // MARK: - Private Functions
    private func configNavi() {
        let sideMenuItem = UIBarButtonItem(image: UIImage(named: "ic_image_sidemenu"), style: .done, target: self, action: nil)
        navigationItem.leftBarButtonItem = sideMenuItem
        let plusItem = UIBarButtonItem(image: UIImage(named: "ic_image_plus"), style: .done, target: self, action: #selector(pushToSearch))
        navigationItem.rightBarButtonItem = plusItem

        // Change color title
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        navigationController?.navigationBar.tintColor = .white

        // Transparent navi
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }

    private func configTableview() {
        tableView.register(nibWithCellClass: WeatherTodayCell.self)
        tableView.register(nibWithCellClass: EveryHoursTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }

    // MARK: - Objc private functions
    @objc private func pushToSearch() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cellOne = tableView.dequeueReusableCell(withClass: WeatherTodayCell.self, for: indexPath)
            cellOne.viewModel = viewModel.viewModelForCellOne()
            cellOne.backgroundColor = .clear
            return cellOne
        case 1:
            let cellTwo = tableView.dequeueReusableCell(withClass: EveryHoursTableViewCell.self, for: indexPath)
            cellTwo.viewModel = viewModel.viewModelForCellTwo()
            cellTwo.backgroundColor = .clear
            return cellTwo
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 220
        case 1:
            return 220
        default:
            return UITableView.automaticDimension
        }
    }
}
