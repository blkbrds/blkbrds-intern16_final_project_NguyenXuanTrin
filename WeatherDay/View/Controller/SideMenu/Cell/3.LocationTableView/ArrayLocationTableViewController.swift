//
//  ArrayLocationTableViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 10/8/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

class ArrayLocationTableViewController: UITableViewController {

    // MARK: - Properties
    var viewModel: ArrayLoactionViewModel = ArrayLoactionViewModel()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        configTableview()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchKeyLocation()
    }

    // MARK: - Functions
    func configNavi() {
        title = "Edit locations"
        let leftButton = UIBarButtonItem(image: UIImage(named: "ic_image_plus"), style: .plain, target: self, action: #selector(pushToSearch))
        navigationItem.leftBarButtonItem = leftButton
        let rightButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popToHome))
        navigationItem.rightBarButtonItem = rightButton
    }

    func configTableview() {
        tableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
        tableView.register(nibWithCellClass: CellforArrayTableViewCell.self)
    }

    private func saveProvinceToRealm(searchKey: String) {
        viewModel.saveProvinceToRealm(searchKey: searchKey) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success:
                print("Successed")
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

    private func removeKeyLocation(locationName: String) {
        viewModel.removeKeyLocation(locationName: locationName) { [weak self] (result) in
            guard let this = self else { return }
            switch result {
            case .success: break
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }

    // MARK: - Objc methods
    @objc private func pushToSearch() {
        let vc = SearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func popToHome() {
        navigationController?.popToRootViewController(animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.numberOfRowsInSectionLocationArrayTableview()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: CellforArrayTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.viewModelForItemLocationTableView(indexPath: indexPath)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            removeKeyLocation(locationName: viewModel.keySearch.reversedList[indexPath.row])
            tableView.reloadData()
        case .insert: break
        case .none: break
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title: String = viewModel.keySearch.reversedList[indexPath.row]
        saveProvinceToRealm(searchKey: title)
        navigationController?.popToRootViewController(animated: true)
    }
}
