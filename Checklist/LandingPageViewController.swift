//
//  ViewController.swift
//  Checklist
//
//  Created by Neeraj Kumar Nittoori on 1/28/22.
//

import UIKit

class LandingPageViewController: UIViewController, UITableViewDataSource, SaveCheckListNotesDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var checkListItems: [CheckListItem] = []
    private lazy var rightBarButton: UIBarButtonItem = { UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd)) }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        navigationItem.rightBarButtonItem = rightBarButton
        getCheckListItemsAndReload()
    }
    
    func getCheckListItemsAndReload() {
        checkListItems = (try? context.fetch(CheckListItem.fetchRequest())) ?? []
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let checkListItem = checkListItems[indexPath.row]
        cell.textLabel?.text = checkListItem.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checkListItems.count
    }
    
    @objc private func didTapAdd() {
        present(UINavigationController(rootViewController: CheckListNotesViewController(delegate: self)), animated: true, completion: nil)
    }
    
    private func createChecklistItem(name: String) {
        let item = CheckListItem(context: context)
        item.name = name
        try? context.save()
    }
    
    func saveCheckList(itemNotes: String) {
        createChecklistItem(name: itemNotes)
        getCheckListItemsAndReload()
    }
}

