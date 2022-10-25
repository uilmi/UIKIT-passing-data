//
//  ViewController.swift
//  UIKIT-passing-data
//
//  Created by Ulul I. on 17/10/22.
//

import UIKit
/*
 - Custom initializer
 - Completion handler (closure)
 - NotificationCenter post
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return table
    }()
    
    
    private let data = [
        ["apple", "sony", "google", "microsoft"],
        ["one", "two", "three", "four"],
        ["USA", "UK", "Indonesia", "Singapore"]
    ]

    var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("custom"), object: nil, queue: .main, using: { notification in
            
            guard let object = notification.object as? [String: UIColor] else {
                return
            }
            
            guard let color = object["color"] else {
                return
            }
            
            self.view.backgroundColor = color
            self.tableView.isHidden = true
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let items = data[indexPath.section]
        
        let vc = SecondViewController(selectedItem: items[indexPath.row], relatedItems: items)
        present(UINavigationController(rootViewController: vc), animated: true)
    }
    
     

}

