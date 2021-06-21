//
//  Part2.swift
//  UIElements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part2: UIViewController {
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Registration Information"
        label.textAlignment = .center
        //label.backgroundColor = .black
        label.textColor = .red
        return label
    }()
    
    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter full name"
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Enter Address"
        textView.textAlignment = .center
        textView.backgroundColor = .gray
        return textView
    }()
    
    private let myTextFieldEmail:UITextField = {
        let textFieldEmail = UITextField()
        textFieldEmail.placeholder = "Enter email address"
        textFieldEmail.textAlignment = .center
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.backgroundColor = .gray
        return textFieldEmail
    }()
    
    private let myLabelDOB:UILabel = {
        let label = UILabel()
        label.text = "Date of Birth"
        label.textAlignment = .left
        //label.backgroundColor = .gray
        //label.textColor = .white
        return label
    }()
    
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        datePicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        datePicker.backgroundColor = .gray
        return datePicker
    }()

    private let myLabelExp:UILabel = {
        let labelExp = UILabel()
        labelExp.text = "Job Experience"
        labelExp.textAlignment = .left
       // labelExp.textColor = .white
        return labelExp
    }()
    
    private let mySlider:UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let myPageControl:UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.backgroundColor = .gray
        pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
        return pageControl
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(myLabel)
        view.addSubview(myTextField)
        view.addSubview(myTextView)
        view.addSubview(myTextFieldEmail)
        view.addSubview(myLabelDOB)
        view.addSubview(myDatePicker)
        view.addSubview(myLabelExp)
        view.addSubview(mySlider)
        view.addSubview(myButton)
        view.addSubview(myPageControl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 60)
        myTextField.frame = CGRect(x: 20, y: myLabel.bottom + 30, width: view.width - 40, height: 40)
        myTextView.frame = CGRect(x: 20, y: myTextField.bottom + 20, width: view.width - 40, height: 40)
        myTextFieldEmail.frame = CGRect(x: 20, y: myTextView.bottom + 20, width: view.width - 40, height: 40)
        myLabelDOB.frame = CGRect(x: 20, y: myTextFieldEmail.bottom + 20, width: view.width - 40, height: 40)
        myDatePicker.frame = CGRect(x: 20, y: myLabelDOB.bottom + 10, width: view.width - 40, height: 40)
        myLabelExp.frame = CGRect(x: 20, y: myDatePicker.bottom + 20, width: view.width - 40, height: 40)
        mySlider.frame = CGRect(x: 20, y: myLabelExp.bottom + 10, width: view.width - 40, height: 40)
        myButton.frame = CGRect(x: 20, y: mySlider.bottom + 20, width: view.width - 40, height: 40)
        myPageControl.frame = CGRect(x: 50, y: myButton.bottom + 10, width: view.width - 100, height: 40)
    }
    
    @objc func handleDateChange(){
        print(myDatePicker.date)
    }
    
    @objc func handleSlider() {
        print(mySlider.value)
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = Part3()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        present(nav, animated: false)
    }
    
    @objc func handlePageControl(){
        print(myPageControl.currentPage)
    }

}
