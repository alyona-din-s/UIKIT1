//
//  UIKit2TableViewController.swift
//  Test_1
//
//  Created by admin_user on 12/09/24.
//
 
import UIKit

enum Section : String {
    case continent1 = "North America"
    case continent2 = "Europe"
    case continent3 = "Asia"
}

struct Item: Hashable {
    let id = UUID()
    let title: String
    let continent: Section
}

class UIKit2TableViewController: UITableViewController {

    var dataSource: UITableViewDiffableDataSource<Section, Item>!
    var cities: [Item] = []
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "city_cell")
        // Create the data source
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "city_cell", for: indexPath)
            cell.textLabel?.text = item.title
            return cell
        }
        
        // Populate the data source with the initial data
        cities = [
            Item(title: "New York", continent: .continent1),
            Item(title: "London", continent: .continent2),
            Item(title: "Tokyo", continent: .continent3)
        ]
        applySnapshot(items: cities)
        
        addSearchBar()
    }
    
    func addSearchBar(){
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.delegate = self
    }
    
    func applySnapshot(items: [Item]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        let categories = Set(items.map { $0.continent })
        let sections = Array<Section>(categories)
        snapshot.appendSections(sections)
        for section in sections {
            let items = items.filter { $0.continent == section }
            snapshot.appendItems(items, toSection: section)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}




// MARK: - UISearchBarDelegate
extension UIKit2TableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filteredItems = cities.filter(){ item in
            searchText.isEmpty || item.title.localizedStandardContains(searchText)
        }
        applySnapshot(items: filteredItems)
    }
}



 
