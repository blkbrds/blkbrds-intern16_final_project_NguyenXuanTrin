//
//  SideMenuTableViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/7/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

final class SideMenuTableViewController: UITableViewController {
    
    // MARK: - Properties
    var viewModel: SideMenuViewModel = SideMenuViewModel()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        configTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchKeyLocation()
        tableView.reloadData()
    }
    
    func configTableView() {
        tableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
        tableView.register(nibWithCellClass: ProfileTableViewCell.self)
        tableView.register(nibWithCellClass: OptionLocationTableViewCell.self)
        tableView.register(nibWithCellClass: LocationsTableViewCell.self)
        tableView.register(nibWithCellClass: NotificationsTableViewCell.self)
    }
    
    // MARK: - Objc method
    @objc func handleEditButtonTouchUpInside() {
        let vc = ArrayLocationTableViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return viewModel.numberOfSections()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRowsInSection(inSection: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let sectionType = SideMenuViewModel.SideMenuSectionType(rawValue: indexPath.section) else { return UITableViewCell() }
        switch sectionType {
        case .profile:
            let cellOne = tableView.dequeueReusableCell(withClass: ProfileTableViewCell.self, for: indexPath)
            return cellOne
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
        case .notification:
            let cellFour = tableView.dequeueReusableCell(withClass: NotificationsTableViewCell.self)
            return cellFour
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionType = SideMenuViewModel.SideMenuSectionType(rawValue: indexPath.section)
        switch sectionType {
        case .profile: print("a")
        case .location:
            switch indexPath.row {
            case 0:
                print("a")
            default:
                SceneDelegate.shared.vc.check = false
                SceneDelegate.shared.vc.locationName = viewModel.keySearch.reversedList[indexPath.row - 1]
                dismiss(animated: true)
            }
        case .notification: print("a")
        case .none: print("a")
        }
    }
}
