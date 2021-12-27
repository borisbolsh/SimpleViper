//
//  ListModuleViewController.swift
//  SimpleViper
//
//  Created by Boris Bolshakov on 27.12.21.
//  
//

import UIKit

final class ListModuleViewController: UIViewController {
    private let output: ListModuleViewOutput
    private let tableView = UITableView()
    private var viewModels = [CityViewModel]()
    private let addCityButton = UIButton(type: .system)

    init(output: ListModuleViewOutput) {
        self.output = output
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .yellow
        view.addSubview(self.tableView)
        view.addSubview(self.addCityButton)
        
        setupTableView()
        setupAddCityButton()
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.output.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
        let btnWidth = view.width - 48
        addCityButton.frame = CGRect(
           x: (view.width - btnWidth) / 2,
           y: view.bottom - 100,
           width: btnWidth,
           height: 56
        )
    }
}

extension ListModuleViewController: ListModuleViewInput {
    func set(viewModels: [CityViewModel]) {
        self.viewModels = viewModels
        self.tableView.reloadData()
    }
    
}

extension ListModuleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueCell(cellType: CityTableViewCell.self, for: indexPath)
        cell.textLabel?.text = self.viewModels[indexPath.row].name
        return cell
    }
}

extension ListModuleViewController: UITableViewDelegate {
    
}
private extension ListModuleViewController {
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.reuseIdentifier)
    }
    
    func setupAddCityButton() {
        self.addCityButton.addTarget(self, action: #selector(didTapAddCityButton), for: .touchUpInside)
        self.addCityButton.setTitle("Add city", for: .normal)
    }
    
    @objc
    func didTapAddCityButton() {
        self.output.didTapAddCityButton()
    }
}
