//
//  DetailViewController.swift
//  project03b
//
//  Created by LeeChan on 9/8/16.
//  Copyright © 2016 MarkiiimarK. All rights reserved.
//

import UIKit
import Social

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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        view.addSubview(detailImageView)
        
        detailImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        detailImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        view.addConstraintsWithFormat("H:|-30-[v0]-30-|", views: detailImageView)
        view.addConstraintsWithFormat("V:|-100-[v0]", views: detailImageView)
    }
    
    func shareButtonTapped() {
//        handleDefaultImageShare(image: detailImageView.image!)
        handleFacebookTwitterSharing(image: detailImageView.image!)
    }
    
    fileprivate func handleDefaultImageShare(image: UIImage?) {
        if let image = image {
            let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
            vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
            present(vc, animated: true, completion: nil);
        }
    }
    
    // MARK: - Social Library
    fileprivate func handleFacebookTwitterSharing(image: UIImage?) {
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            vc.setInitialText("Look at this great picture!")
            if let image = image {  vc.add(image)  }
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            present(vc, animated: true, completion: nil)
        }
    }
    
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}


