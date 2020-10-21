//
//  SideMenuTableViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol SideMenuViewControllerDelegate: class {
    func changeTitleHome(_ viewController: SideMenuTableViewController, needPerform action: SideMenuTableViewController.Action)
}

final class SideMenuTableViewController: UITableViewController {

    // MARK: - Properties
    weak var delegate: SideMenuViewControllerDelegate?
    var viewModel: SideMenuViewModel = SideMenuViewModel()
    enum Action {
        case sendTitleHome(title: String)
    }

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchKeyLocation()
        tableView.reloadData()
    }

    func configTableView() {
        navigationController?.navigationBar.isHidden = true
        tableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
        tableView.register(nibWithCellClass: OptionLocationTableViewCell.self)
        tableView.register(nibWithCellClass: LocationsTableViewCell.self)
    }

    private func saveProvinceToRealm(searchKey: String) {
        viewModel.saveProvinceToRealm(searchKey: searchKey) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }
    
    private func fetchKeyLocation() {
        viewModel.fetchKeyLocation { result in
            switch result {
            case .success: break
            case .failure(let error):
                self.alert(error: error)
            }
        }
    }

    // MARK: - Objc method
    @objc func handleEditButtonTouchUpInside() {
        let vc = ArrayLocationTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(inSection: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SideMenuViewModel.SideMenuSectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        switch sectionType {
        case .location:
            switch indexPath.row {
            case 0:
                let cellTwo = tableView.dequeueReusableCell(withClass: OptionLocationTableViewCell.self)
                cellTwo.editButton.addTarget(self, action: #selector(handleEditButtonTouchUpInside), for: .touchUpInside)
                return cellTwo
            default:
                let cellThree = tableView.dequeueReusableCell(withClass: LocationsTableViewCell.self, for: indexPath)
                cellThree.viewModel = viewModel.viewModelForItemLocationTableView(indexPath: indexPath)
                return cellThree
            }
        }
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionType = SideMenuViewModel.SideMenuSectionType(rawValue: indexPath.section)
        switch sectionType {
        case .location:
            switch indexPath.row {
            case 0: break
            default:
                let title = viewModel.keySearch.reversedList[indexPath.row - 1]
                saveProvinceToRealm(searchKey: title)
                delegate?.changeTitleHome(self, needPerform: .sendTitleHome(title: title))
                dismiss(animated: true)
            }
        case .none: break
        }
    }
}
