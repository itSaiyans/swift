
import UIKit

final class MyFriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
}

extension MyFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as! FriendsTableViewCell
        
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
}
