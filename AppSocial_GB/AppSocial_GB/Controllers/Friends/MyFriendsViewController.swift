
import UIKit

extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()

        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }

        return result
    }
}

final class MyFriendsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var users = UsersDataStorage.shared.users
    private var firstLetters = [String]()
    private var sortedFriends = [[User]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstLetters = getFirstLetters(users)
        sortedFriends = sortFriends(users, letters: firstLetters)
    }
    
    private func sortFriends(_ users: [User], letters: [String]) -> [[User]] {
        var sortedFriends = [[User]]()
        
        letters.forEach { letter in
            let letterFriend = users.filter { String($0.name.prefix(1)) == letter }.sorted(by: {$0.name < $1.name})
            sortedFriends.append(letterFriend)
        }

        return sortedFriends
    }
    
    private func getFirstLetters(_ users: [User]) -> [String] {
        let userNames = users.map { $0.name }
        let firstLetters = userNames.map { String($0.prefix(1)) }.sorted()
        return firstLetters.removeDuplicates()
    }
    
    func viewCollection (_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "showUserImage", for: indexPath) as! FriendsCollectionCell
        
        return cell
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showUserImage",
           let destinationController = segue.destination as? FriendsCollection,
           let indexSelectedCell = tableView.indexPathForSelectedRow{
            let user = users[indexSelectedCell.row]
            destinationController.friends = user.friends
        }
    }
}

extension MyFriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortedFriends[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell()
            
        }
        let user = sortedFriends[indexPath.section][indexPath.row]
        
        cell.configure(user)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return firstLetters[section]
    }
}
