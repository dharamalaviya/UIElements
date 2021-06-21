//
//  ViewController.swift
//  UIElements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "img1")
        return imageView
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Go for Registration", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0) {
            self.myProgressView.setProgress(1.0, animated: true)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(myImageView)
        view.addSubview(myButton)
        view.addSubview(myProgressView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myImageView.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 300)
        myProgressView.frame = CGRect(x: 20, y: myImageView.bottom + 40, width: view.width - 40, height: 60)
        myButton.frame = CGRect(x: 20, y: myProgressView.bottom + 40, width: view.width - 40, height: 60)
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = Part2()
        
        navigationController?.pushViewController(vc, animated: true)
    }

    
}

