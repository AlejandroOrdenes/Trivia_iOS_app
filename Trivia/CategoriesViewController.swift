//
//  CategoriesViewController.swift
//  Trivia
//
//  Created by Alejandro O. on 28-09-21.
//


import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
//    private var categories = ["Primera Categoria", "Segunda Categoria"]

    var viewModel: CategoriesViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = CategoriesViewModel(service: CategoriesService())
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getCategories()

    }
    
        func getCategories() {
             
            viewModel.getCategoriesServ() {
                self.tableView.reloadData()
        }

    }
       
}


extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {



    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showQuestions(for: viewModel.getCategory(at: indexPath.row))
        print(viewModel.getCategory(at: indexPath.row).name)
        print(viewModel.getCategory(at: indexPath.row).id)
        

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       viewModel.getCategoriesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = viewModel.getCategory(at: indexPath.row).name
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = UIColor(named: "Alkemy")
        return cell
    }

    private func showQuestions(for category: Category) {

        let questionViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
        questionViewController.title = category.name
        questionViewController.categoryID = category.id

        navigationController?.pushViewController(questionViewController, animated: true)
    }
    

}


