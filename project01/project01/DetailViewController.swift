//
//  ViewController.swift
//  project01
//
//  Created by LeeChan on 5/24/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UISplitViewControllerDelegate, UINavigationControllerDelegate {
    
    weak var masterVC: MasterViewController?
    
    lazy var detailImageView: UIImageView = {
        let imgv = UIImageView()
        imgv.contentMode = .scaleAspectFit
        imgv.clipsToBounds = true
        imgv.translatesAutoresizingMaskIntoConstraints = false
        return imgv
    }()
    
    var detailItemName: Any? {
        didSet {
            guard let detail = detailItemName as? String else {  return  }
            detailImageView.image = UIImage(named: detail)
//            navigationItem.backBarButtonItem?.title = ""
            navigationItem.title = detail
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func setupViews() {
        view.addSubview(detailImageView)
        detailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: detailImageView)
        view.addConstraintsWithFormat("V:|-100-[v0]", views: detailImageView)
    }
    

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

}

