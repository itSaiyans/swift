
import UIKit

final class MyFriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = UsersDataStorage.shared.users
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func viewCollection (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showUserImage", for: indexPath) as! FriendsCollectionCell
        
        return cell
        }

    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showUserImage",
           let destinationController = segue.destination as? FriendsCollection,
           let indexSelectedCell = tableView.indexPathForSelectedRow{
            _ = users[indexSelectedCell.row]
            destinationController.friends = users
            
        }
    }*/
}

extension MyFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()}
        
        cell.configure(users[indexPath.row])
        
        return cell
    }
}
