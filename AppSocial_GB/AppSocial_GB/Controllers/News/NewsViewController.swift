//
//  NewsViewController.swift
//  AppSocial_GB
//
//  Created by Stas Danilov on 22.06.2021.
//

import UIKit

class NewsViewController: UITableViewController {
    
    var news = NewsDataStorage.shared.news

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsViewCell") as? NewsViewCell
        else {
            return UITableViewCell()
        }
        
        cell.configure(news: news[indexPath.row])

        return cell
    }

}
