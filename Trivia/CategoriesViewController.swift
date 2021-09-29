//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Alejandro O. on 28-09-21.
//

import UIKit

class CategoriesViewController: UIViewController {
  
    

    @IBOutlet weak var tableView: UITableView!
    private var categories = ["Primera Categoria", "Segunda Categoria"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        func getCategories() {
            self.tableView.reloadData()
        }
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getCategories()
        
    }
}

    extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            categories.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = categories[indexPath.row]
            
            return cell
        } 
}
