//
//  HomeView.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import UIKit


import Foundation
import UIKit



class HomeView: UITableViewController {
    
    // MARK: Properties
    var presenter: HomePresenterProtocol?
    var cells = [PostForCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: PostCellView.NAME, bundle: nil), forCellReuseIdentifier: PostCellView.NAME)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return cells.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCellView.NAME, for: indexPath) as! PostCellView
        cell.data = cells[indexPath.item]
        return cell
    }
}

extension HomeView: HomeViewProtocol {
    // TODO: implement view output methods
    func onPostFetched(posts: [PostForCell]) {
        cells = posts
        tableView.reloadData()
    }
}

