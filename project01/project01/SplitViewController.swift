//
//  SplitViewController.swift
//  project01
//
//  Created by LeeChan on 5/24/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            UINavigationController(rootViewController: MasterViewController()),
            UINavigationController(rootViewController: DetailViewController())
        ]
        
        delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }

//    func targetDisplayModeForAction(in svc: UISplitViewController) -> UISplitViewControllerDisplayMode {
//        let sharedApp = UIApplication.shared
//        return UISplitViewControllerDisplayMode.automatic
//    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}
