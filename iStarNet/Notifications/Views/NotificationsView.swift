//
//  NotificationsView.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import UIKit
class NotificationsView: UITableViewController {
    
    // MARK: Properties
    var presenter: NotificationsPresenterProtocol?
    var cells = [NotificationTypeCell]()
    
    // MARK: Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter?.viewDidLoad()
        
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: NotificationCellView.NAME, bundle: nil), forCellReuseIdentifier: NotificationCellView.NAME)
        tableView.register(UINib(nibName: NotificationPostCellView.NAME, bundle: nil), forCellReuseIdentifier: NotificationPostCellView.NAME)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
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
        
        let type = cells[indexPath.item].type
        
        if type == .noti {
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationCellView.NAME, for: indexPath) as! NotificationCellView
            
            if let data = cells[indexPath.item].data as? NotificationForCell {
                cell.data = data
            }
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationPostCellView.NAME, for: indexPath) as! NotificationPostCellView
            
            if let data = cells[indexPath.item].data as? NotificationPostForCell {
                cell.data = data
            }
            
            return cell
        }
    }
}

extension NotificationsView: NotificationsViewProtocol {
    // TODO: implement view output methods
    func onNotificationsFetched(notifications: [NotificationTypeCell]) {
        cells = notifications
        tableView.reloadData()
    }
    
}
