//
//  MasterViewController.swift
//  project01
//
//  Created by LeeChan on 5/24/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

private let ProjectMasterTitle = "StormViewer"
private let ImageCellIdentifier = "imgCellId"

class MasterViewController: UITableViewController, UINavigationControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = ProjectMasterTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        tableView.register(ImageCell.self, forCellReuseIdentifier: ImageCellIdentifier)
        
        setupFileSystemManager()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController!.navigationBar.topItem!.title = ""
        super.viewWillDisappear(animated)
    }
    
    
    var objects = [String]()
    
    fileprivate func setupFileSystemManager() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {  objects.append(item)  }
        }
    }
    
    lazy var detailVC: DetailViewController = {
        let vc = DetailViewController()
        vc.masterVC = self
        return vc
    }()
    
    // MARK: - TableView Settings
    override func numberOfSections(in tableView: UITableView) -> Int {  return 1  }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ImageCellIdentifier, for: indexPath) as! ImageCell
        let object = objects[(indexPath as NSIndexPath).row]
        
        cell.nameLabel.text = object
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {  return true  }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nav = UINavigationController(rootViewController: detailVC)
        detailVC.detailItemName = objects[indexPath.item] as String
//        detailVC.splitViewController?.title = ""
        self.splitViewController?.showDetailViewController(nav, sender: nil)
        
    }
    
}
