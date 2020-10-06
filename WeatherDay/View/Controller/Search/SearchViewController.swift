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
    @IBOutlet private weak var tableView: UITableView!

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
        configSearchUI()
    }

    // MARK: - Override functions 
    override func setUpUI() {
        tableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
        tableView.register(nibWithCellClass: SearchTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - Private Functions
    private func configSearchUI() {
        title = Configure.titleName
        navigationItem.searchController = searchController
        searchController.searchBar.searchTextField.textColor = .white
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
    }
    
    private func filterProvince(for searchText: String) {
        viewModel.getListProvince()
        if searchText.isEmpty {
            viewModel.filter = viewModel.listProvince
        } else {
            viewModel.filter = viewModel.listProvince.filter { Province in
                Province.provinceName.lowercased().hasPrefix(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClass: SearchTableViewCell.self, for: indexPath)
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let title: String = viewModel.filter[indexPath.row].provinceName
        delegate?.changeTitleHome(self, needPerform: .sendTitleHome(title: title))
        navigationController?.popToRootViewController(animated: true)
    }
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterProvince(for: searchController.searchBar.text ?? "")
    }
}
