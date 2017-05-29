//
//  SplitViewController.swift
//  project03b
//
//  Created by LeeChan on 9/26/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            UINavigationController(rootViewController: MasterViewController()),
            UINavigationController(rootViewController: DetailViewController())
        ]
        delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

}
