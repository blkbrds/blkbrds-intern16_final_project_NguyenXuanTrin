//
//  SearchViewController.swift
//  WeatherDay
//
//  Created by PCI0004 on 9/25/20.
//  Copyright © 2020 Thinh Nguyen X. All rights reserved.
//

import UIKit

private struct Configure {
    static let titleName: String = "Add new locations"
}

final class SearchViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Configure.titleName
        configNavi()
        tableView.backgroundColor = #colorLiteral(red: 0.1131554469, green: 0.128916502, blue: 0.1580072343, alpha: 1)
    }

    // MARK: - Private Functions
    private func configNavi() {
        let cancelItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelAction))
        navigationItem.rightBarButtonItem = cancelItem
        navigationItem.leftBarButtonItem = nil
    }

    // MARK: - Ojbc private functions
    @objc private func cancelAction() {
        navigationController?.popViewController(animated: true)
    }
}
