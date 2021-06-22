//
//  MyGroupsController.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 10.06.2021.
//

import UIKit

final class MyGroupsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groups = GroupsDataStorage.shared.groups
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addGroup(_ segue: UIStoryboardSegue) {
        
        guard
            let SourceController = segue.source as? allGroupsController,
            let indexPressedCell = SourceController.tableView.indexPathForSelectedRow
        else {
            return
        }
        
        let group = SourceController.allGroups[indexPressedCell.row]
        if !groups.contains(where: {$0.name == group.name}) {
            groups.append(group)
            tableView.reloadData()
        }
    }
}



extension MyGroupsController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GroupsTableViewCell.identifier, for: indexPath) as? GroupsTableViewCell else {return UITableViewCell()}
        
        cell.configure(groups[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
