//
//  MenuViewController.swift
//  MovieViewer
//
//  Created by Fred Fred on 18.06.2021.
//  
//

import UIKit
import PinLayout

final class MenuViewController: UIViewController {
	private let output: MenuViewOutput
    private let tableView = UITableView()
    init(output: MenuViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieViewCell.self, forCellReuseIdentifier: "MovieViewCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        view.addSubview(tableView)
        output.didLoadView()
	}
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.frame
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfItems = output.countItems()
        return numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath) as? MovieViewCell else {
                return .init()
            }
        let item = output.getItemById(id: indexPath.row)
        cell.configure(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
}
extension MenuViewController: MenuViewInput {
    func reloadData() {
        
        self.tableView.refreshControl?.endRefreshing()
        self.tableView.reloadData()
    }
    
    
}
