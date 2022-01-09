//
//  MessagesView.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import UIKit
import Foundation



class MessagesView: UITableViewController {
   
    // MARK: Properties
    var presenter: MessagesPresenterProtocol?
    var cells = [MessageForCell]()

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: MessageCellView.NAME, bundle: nil), forCellReuseIdentifier: MessageCellView.NAME)
        tableView.rowHeight = 80
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MessageCellView.NAME, for: indexPath) as! MessageCellView
        cell.data = cells[indexPath.item]
        return cell
    }
}

extension MessagesView: MessagesViewProtocol {
    // TODO: implement view output methods
    func onMessagesFetched(messages: [MessageForCell]) {
        cells = messages
        tableView.reloadData()
    }
}
