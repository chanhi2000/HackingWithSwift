//
//  ViewController.swift
//  project02
//
//  Created by LeeChan on 5/24/17.
//  Copyright © 2017 MarkiiimarK. All rights reserved.
//

import UIKit
import GameplayKit

private let projectTitle = "Guess The Flag"

class ViewController: UIViewController {
    
    lazy var button1: UIButton = {
        let btn = UIButton()
        btn.tag = 0
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.backgroundColor = .red
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var button2: UIButton = {
        let btn = UIButton()
        btn.tag = 1
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    lazy var button3: UIButton = {
        let btn = UIButton()
        btn.tag = 2
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.lightGray.cgColor
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
       return btn
    }()
    
    func buttonTapped(_ sender: UIButton) {
        var title: String?
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: askQuestion))
        present(ac, animated: true, completion: nil)
    }
    
    fileprivate func askQuestion(_ action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
    }
    
    var countries = [String]()
    var correctAnswer = 0
    var score = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = projectTitle
        view.backgroundColor = .gray
        
        setupViews()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        askQuestion(nil)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func setupViews() {
        
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        button1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -30).isActive = true
        
        button2.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button3.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 100).isActive = true
        button3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 30).isActive = true
    }

//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
}

