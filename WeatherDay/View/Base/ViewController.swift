//
//  ViewController.swift
//  MyApp
//
//  Created by iOSTeam on 2/21/18.
//  Copyright © 2018 Asian Tech Co., Ltd. All rights reserved.
//

import UIKit
import MVVM

class ViewController: UIViewController, MVVM.View {

    // MARK: - Life cycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setUpUI()
    }
    // MARK: - Public functions
    func setUpData() { }
    func setUpUI() {
        configNavi()
    }

    // MARK: - Private functions
    private func configNavi() {
        setHiddenTitleBackbutton()
    }

    func setHiddenTitleBackbutton() {
        switch self {
        case is SearchViewController:
            navigationController?.navigationItem.backBarButtonItem?.title = ""
            navigationController?.setNavigationBarHidden(true, animated: true)
        default: break
        }
    }
}
