//
//  ProfileView.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//

import UIKit

class ProfileView: UITableViewController {
    
    // MARK: - Properties
    
    var presenter: ProfilePresenterProtocol?
    var header: ProfileHeaderView!
    var cells = [PostForCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupHeader()
        setupNavBar()
        presenter?.viewDidLoad()
        
    }
    
    private func setupTableView() {
        tableView.register(UINib(nibName: PostCellView.NAME, bundle: nil), forCellReuseIdentifier: PostCellView.NAME)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 300
    }
    
    private func setupHeader() {
        header = ProfileHeaderView.instanceFromNib()
        let user = UserPersistence.shared.getCurrentUser()
        if let user = user {
            header.imgProfile.sd_setImage(with: URL(string: user.imagePath!) , completed: nil)
            header.lblName.text = user.email ?? "No name"
            
        }
        tableView.tableHeaderView = header
    }
    
    func setupNavBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.action, target: self, action: #selector(askLogOut))
    }
    
    @objc private func askLogOut() {
        
        let sheetAlert = UIAlertController(title: nil, message: "¿Cerrar sesión?", preferredStyle: UIAlertController.Style.actionSheet)
        
        sheetAlert.addAction(UIAlertAction(title: "Sí, salir de aquí", style: UIAlertAction.Style.destructive, handler: { _ in
            self.presenter?.logOut()
        }))
        
        sheetAlert.addAction(UIAlertAction(title: "Cancelar", style: UIAlertAction.Style.cancel, handler: { _ in
            
        }))
        
        self.present(sheetAlert, animated: true, completion: nil)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if let headerView = tableView.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCellView.NAME, for: indexPath) as! PostCellView
        cell.data = cells[indexPath.item]
        return cell
    }
    
}

extension ProfileView: ProfileViewProtocol {
    // TODO: implement view output methods
    func onPostsFetched(posts: [PostForCell]) {
        cells = posts
        tableView.reloadData()
    }
}

