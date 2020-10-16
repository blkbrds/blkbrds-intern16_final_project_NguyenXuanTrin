//
//  HomeViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/23/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import SideMenu
import UIKit

final class HomeViewController: ViewController, UINavigationControllerDelegate {

    // MARK: - IBOutlets
    @IBOutlet weak var fullScreenImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorImageView: UIImageView!

    // MARK: - Properties
    var viewModel: HomeViewModel = HomeViewModel()
    var sunAndWind: SunandWindView = SunandWindView()
    var refreshControl = UIRefreshControl()
    var imageArray: [UIImage] = [#imageLiteral(resourceName: "img_02"), #imageLiteral(resourceName: "img_05"), #imageLiteral(resourceName: "img_04"), #imageLiteral(resourceName: "img_03"), #imageLiteral(resourceName: "img_01")]
    var menu: SideMenuNavigationController?
    var locationName: String = ""


    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        configTableview()
        configPulltoRefesh()
        configSideMenu()
        UIScreen.main.brightness = CGFloat(1)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.setContentOffset(.zero, animated: true)
        errorImageView.isHidden = true
        UIView.transition(with: fullScreenImageView, duration: 0.6,
            options: .transitionCrossDissolve,
            animations: {
                self.fullScreenImageView.image = self.imageArray.randomItem
            })
        fetchData()
        if locationName == "" {
            locationName = "Đà Nẵng"
        }
        title = locationName
        handleCallApi(locationName: locationName)
    }

    // MARK: - Private Functions
    private func configNavi() {
        title = locationName
        let sideMenuItem = UIBarButtonItem(image: UIImage(named: "ic_image_sidemenu"), style: .done, target: self, action: #selector(didTapMenu))
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

    private func configSideMenu() {
        let vc = SideMenuTableViewController()
        menu = SideMenuNavigationController(rootViewController: vc)
        vc.delegate = self
        menu?.leftSide = true
        SideMenuManager.default.leftMenuNavigationController = menu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
    }

    private func fetchData() {
        viewModel.fetchKeySearch()
        getFirst()
    }

    private func getFirst() {
        locationName = viewModel.getFirstKey() ?? ""
    }

    private func loadDataCondition(locationTitle: String, completion: @escaping () -> Void) {
        viewModel.loadCondition(location: locationTitle) { [weak self] result in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
                this.errorImageView.isHidden = false
                this.errorImageView.image = this.imageArray.randomItem
            }
        }
    }

    private func loadDataForecasts(locationTitle: String, completion: @escaping () -> Void) {
        viewModel.loadForecasts(location: locationTitle) { [weak self] result in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataAtmosphere(locationTitle: String, completion: @escaping () -> Void) {
        viewModel.loadAtmosphere(location: locationTitle) { [weak self] result in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataLocation(locationTitle: String, completion: @escaping () -> Void) {
        viewModel.loadLocation(location: locationTitle) { [weak self] result in
            completion()
            guard let this = self else { return }
            switch result {
            case .success:
                this.handleForecastsAPI()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataAstronomy(locationTitle: String, completion: @escaping () -> Void) {
        viewModel.loadAstronomy(location: locationTitle) { [weak self] result in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataForecastsArray(locationTitle: String, completion: @escaping () -> Void) {
        viewModel.loadForecastsArray(location: locationTitle) { [weak self] result in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    private func loadDataForecastsEveryHourList(lat: Double, lon: Double, completion: @escaping () -> Void) {
        viewModel.loadForecastsEveryHours(lat: lat, lon: lon) { [weak self] (result) in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }
    
    private func loadDataDailyWeather(lat: Double, lon: Double, completion: @escaping () -> Void) {
        viewModel.loadDailyWeather(lat: lat, lon: lon) { [weak self] (result) in
            completion()
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    func handleCallApi(locationName: String) {
        HUD.show()
        let dispatchGroup = DispatchGroup()
        // loadDataLocation
        dispatchGroup.enter()
        loadDataLocation(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        // loadDataCondition
        dispatchGroup.enter()
        loadDataCondition(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        // loadDataForecasts
        dispatchGroup.enter()
        loadDataForecasts(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        // loadDataForecastsArray
        dispatchGroup.enter()
        loadDataForecastsArray(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        // loadDataAtmosphere
        dispatchGroup.enter()
        loadDataAtmosphere(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        // loadDataLocation
        dispatchGroup.enter()
        loadDataLocation(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        // loadDataAstronomy
        dispatchGroup.enter()
        loadDataAstronomy(locationTitle: locationName) {
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            HUD.popActivity()
        }
    }
    
    func handleForecastsAPI() {
        HUD.show()
        let dispatchGroup = DispatchGroup()
        dispatchGroup.enter()
        loadDataForecastsEveryHourList(lat: viewModel.location.lat, lon: viewModel.location.lon) {
            dispatchGroup.leave()
        }
        dispatchGroup.enter()
        loadDataDailyWeather(lat: viewModel.location.lat, lon: viewModel.location.lon) {
            dispatchGroup.leave()
        }
        dispatchGroup.notify(queue: .main) {
            HUD.popActivity()
            self.tableView.reloadData()
        }
    }

// MARK: - Objc private functions
    @objc private func pushToSearch() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func didTapMenu() {
        guard let menu = menu else { return }
        menu.delegate = self
        present(menu, animated: true)
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
}

extension HomeViewController: SideMenuViewControllerDelegate {
    func changeTitleHome(_ viewController: SideMenuTableViewController, needPerform action: SideMenuTableViewController.Action) {
        switch action {
        case .sendTitleHome(title: let titleResult):
            if titleResult != locationName {
                title = titleResult
                locationName = titleResult
                handleCallApi(locationName: locationName)
                tableView.setContentOffset(.zero, animated: true)
                self.errorImageView.isHidden = true
            }
        }
    }
}
