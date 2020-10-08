//
//  SearchViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol SearchViewControllerDelegate: class {
    func changeTitleHome(_ viewController: SearchViewController, needPerform action: SearchViewController.Action)
}

private struct Configure {
    static let titleName: String = "Add new locations"
}

final class SearchViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var resultTableView: UITableView!
    @IBOutlet private weak var historyTableView: UITableView!

    // MARK: - Properties
    var delegate: SearchViewControllerDelegate?
    var viewModel: SearchViewModel = SearchViewModel()
    private lazy var searchController = UISearchController(searchResultsController: nil)

    enum Action {
        case sendTitleHome(title: String)
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configNavi()
        configSearchUI()
    }

    // MARK: - Override functions
    override func setUpUI() {
        configTableView()
    }

    // MARK: - Private Functions
    private func configTableView() {
        resultTableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
        resultTableView.register(nibWithCellClass: SearchTableViewCell.self)
        resultTableView.delegate = self
        resultTableView.dataSource = self
        historyTableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
        historyTableView.register(nibWithCellClass: HistoryTableViewCell.self)
        historyTableView.delegate = self
        historyTableView.dataSource = self
    }

    private func configNavi() {
        let leftButton = UIBarButtonItem(image: UIImage(named: "img_back"), style: .plain, target: self, action: #selector(backButtonTouchUpInSide))
        navigationItem.leftBarButtonItem = leftButton
    }

    private func configSearchUI() {
        title = Configure.titleName
        navigationItem.searchController = searchController
        searchController.searchBar.searchTextField.textColor = .white
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        historyTableView.isHidden = true
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

    private func filterProvince(for searchText: String) {
        viewModel.getListProvince()
        if searchText.isEmpty {
            resultTableView.isHidden = true
            historyTableView.isHidden = false
        } else {
            viewModel.filterList = viewModel.filterList.filter { Province in
                Province.provinceName.lowercased().hasPrefix(searchText.lowercased())
            }
            historyTableView.isHidden = true
            resultTableView.isHidden = false
            resultTableView.reloadData()
        }
    }

    // MARK: - Objc Private Functions
    @objc private func backButtonTouchUpInSide() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == historyTableView {
            return viewModel.numberOfRowsInSectionHistoryTableview()
        } else {
            return viewModel.numberOfRowsInSectionResultTableview()
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == historyTableView {
            let cell = historyTableView.dequeueReusableCell(withClass: HistoryTableViewCell.self)
            cell.viewModel = viewModel.viewModelForItemHistoryTableView(indexPath: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withClass: SearchTableViewCell.self, for: indexPath)
            cell.viewModel = viewModel.viewModelForItemResultTableView(at: indexPath)
            return cell
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == historyTableView {
            let title: String = viewModel.keySearch.reversedList[indexPath.row]
            saveProvinceToRealm(searchKey: title)
            delegate?.changeTitleHome(self, needPerform: .sendTitleHome(title: title))
        } else {
            let title: String = viewModel.filterList[indexPath.row].provinceName
            saveProvinceToRealm(searchKey: title)
            delegate?.changeTitleHome(self, needPerform: .sendTitleHome(title: title))
        }
        navigationController?.popToRootViewController(animated: true)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterProvince(for: searchController.searchBar.text ?? "")
    }
}
