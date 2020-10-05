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

final class HomeViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var fullScreenImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: HomeViewModel = HomeViewModel()
    var sunAndWind: SunandWindView = SunandWindView()
    var refreshControl = UIRefreshControl()
    var imageArray: [UIImage] = [#imageLiteral(resourceName: "img_02"), #imageLiteral(resourceName: "img_05"), #imageLiteral(resourceName: "img_04"), #imageLiteral(resourceName: "img_03"), #imageLiteral(resourceName: "img_01")]


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        configNavi()
        configTableview()
        configPulltoRefesh()
        UIScreen.main.brightness = CGFloat(1)
    }

    override func setUpData() {
        super.setUpData()
        handleCallApi()
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
        tableView.register(nibWithCellClass: WeatherTodayTableViewCell.self)
        tableView.register(nibWithCellClass: EveryHoursTableViewCell.self)
        tableView.register(nibWithCellClass: SubTableViewCell.self)
        tableView.register(nibWithCellClass: DailyTableViewCell.self)
        tableView.register(nibWithCellClass: DetailsOfDayCell.self)
        tableView.register(nibWithCellClass: MapTableViewCell.self)
        tableView.register(nibWithCellClass: SunandWindTableViewCell.self)
        tableView.register(nibWithCellClass: AmountofRainTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }

    private func configPulltoRefesh() {
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }

    private func loadDataCondition(completion: @escaping () -> Void) {
        viewModel.loadCondition() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: completion()
            case .failure(let error):
                DispatchQueue.main.async {
                    this.alert(error: error)
                }
            }
        }
    }

    private func loadDataForecasts(completion: @escaping () -> Void) {
        viewModel.loadForecasts() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: completion()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataAtmosphere(completion: @escaping () -> Void) {
        viewModel.loadAtmosphere() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: completion()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataLocation(completion: @escaping () -> Void) {
        viewModel.loadLocation() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: completion()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataAstronomy(completion: @escaping () -> Void) {
        viewModel.loadAstronomy() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: completion()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataForecastsArray(completion: @escaping () -> Void) {
        viewModel.loadForecastsArray() { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success: completion()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func handleCallApi() {
        //HUD.show()
        let dispatchGroup = DispatchGroup()
        // loadDataCondition
        dispatchGroup.enter()
        loadDataCondition {
            dispatchGroup.leave()
        }
        // loadDataForecasts
        dispatchGroup.enter()
        loadDataForecasts {
            dispatchGroup.leave()
        }
        // loadDataForecastsArray
        dispatchGroup.enter()
        loadDataForecastsArray {
            dispatchGroup.leave()
        }
        // loadDataAtmosphere
        dispatchGroup.enter()
        loadDataAtmosphere {
            dispatchGroup.leave()
        }
        // loadDataLocation
        dispatchGroup.enter()
        loadDataLocation {
            dispatchGroup.leave()
        }
        // loadDataAstronomy
        dispatchGroup.enter()
        loadDataAstronomy {
            dispatchGroup.leave()
        }
        // loadDataLocation
        dispatchGroup.enter()
        loadDataLocation {
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            //HUD.popActivity()
            self.tableView.reloadData()
        }
    }

    // MARK: - Objc private functions
    @objc private func pushToSearch() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc func refresh(_ sender: AnyObject) {
        UIView.transition(with: fullScreenImageView, duration: 0.8,
            options: .transitionCrossDissolve,
            animations: {
                self.fullScreenImageView.image = self.imageArray.randomItem
                self.refreshControl.endRefreshing()
            })
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = HomeViewModel.HomeSectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        switch sectionType {
        case .weatherToday:
            guard let rowType = HomeViewModel.WeatherToday(rawValue: indexPath.row) else {
                return UITableViewCell()
            }
            switch rowType {
            case .row0:
                let cellOne = tableView.dequeueReusableCell(withClass: WeatherTodayTableViewCell.self, for: indexPath)
                cellOne.viewModel = viewModel.viewModelForCellOne()
                cellOne.backgroundColor = .clear
                return cellOne
            case .row1:
                let cellTwo = tableView.dequeueReusableCell(withClass: EveryHoursTableViewCell.self, for: indexPath)
                cellTwo.viewModel = viewModel.viewModelForCellTwo()
                cellTwo.backgroundColor = .clear
                return cellTwo
            }
        case .weatherDayofWeek:
            switch indexPath.row {
            case 0:
                let cellThree = tableView.dequeueReusableCell(withClass: SubTableViewCell.self)
                return cellThree
            default:
                let cellFour = tableView.dequeueReusableCell(withClass: DailyTableViewCell.self, for: indexPath)
                cellFour.viewModel = viewModel.viewModelForCellFour(at: indexPath)
                return cellFour
            }
        case .weatherDetails:
            let cellFive = tableView.dequeueReusableCell(withClass: DetailsOfDayCell.self)
            cellFive.viewModel = viewModel.viewModelForCellFive()
            return cellFive
        case .map:
            let cellSix = tableView.dequeueReusableCell(withClass: MapTableViewCell.self)
            cellSix.viewModel = viewModel.viewModelForCellSix()
            return cellSix
        case .sunAndWind:
            let cellSeven = tableView.dequeueReusableCell(withClass: SunandWindTableViewCell.self)
            cellSeven.viewModel = viewModel.viewModelForCellSeven()
            return cellSeven
        case .amountOfRain:
            let cellEight = tableView.dequeueReusableCell(withClass: AmountofRainTableViewCell.self)
            cellEight.viewModel = viewModel.viewModelForCellEight()
            return cellEight
        }
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let sectionType = HomeViewModel.HomeSectionType(rawValue: indexPath.section)
        switch sectionType {
        case .weatherToday:
            let rowType = HomeViewModel.WeatherToday(rawValue: indexPath.row)
            switch rowType {
            case .row0: return 220
            case .row1: return 220
            default: return UITableView.automaticDimension
            }
        case .weatherDayofWeek:
            let rowType = HomeViewModel.WeatherDailys(rawValue: indexPath.row)
            switch rowType {
            case .row0: return 32
            case .row1: return 64
            default: return UITableView.automaticDimension
            }
        case .weatherDetails:
            return 199
        case .map:
            return 220
        case .sunAndWind:
            return 220
        case .amountOfRain:
            return 220
        default: return UITableView.automaticDimension
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 5, let cell = tableView.cellForRow(at: indexPath) as? SunandWindTableViewCell {
            cell.viewModel = viewModel.viewModelForCellSeven()
        }
    }
}
