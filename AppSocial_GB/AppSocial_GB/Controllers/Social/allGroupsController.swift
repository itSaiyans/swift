//
//  allGroupsController.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

final class allGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var allGroups = GroupsDataStorage.shared.allGroups
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension allGroupsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.identifier, for: indexPath) as? GroupsTableViewCell else {return UITableViewCell()}
        
        cell.configure(allGroups[indexPath.row])
        
        return cell
    }
}
