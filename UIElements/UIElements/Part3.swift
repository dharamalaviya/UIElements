//
//  Part3.swift
//  UIElements
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Part3: UIViewController {
    
    private let mySegmentControl:UISegmentedControl = {
        let segmentControl = UISegmentedControl()
        segmentControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.addTarget(self, action: #selector(handleSegmentControl), for: .valueChanged)
        return segmentControl
    }()
    
    private let myLabelAge:UILabel = {
        let labelAge = UILabel()
        labelAge.text = "Age"
        labelAge.textAlignment = .left
        //labelAge.textColor = .white
        return labelAge
    }()

    private let myStepper:UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        return stepper
    }()
    
    private let myLabelFresher:UILabel = {
        let labelFresher = UILabel()
        labelFresher.text = "Are you fresher??"
        labelFresher.textAlignment = .left
        //labelFresher.textColor = .white
        return labelFresher
    }()
    
    private let mySwitch:UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitcher), for: .valueChanged)
        return switcher
    }()
    
    private let myToolBar:UIToolbar = {
        let toolbar = UIToolbar()
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: #selector(handelSpacer))
        let cancle = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancle))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera))
        toolbar.items = [spacer, cancle, gallery, camera]
        return toolbar
    }()
    
    @objc private func handelSpacer(){
        print("Spacer Called")
    }
    
    @objc private func handleCancle(){
        print("Cancle Called")
        self.dismiss(animated: true)
    }
    
    @objc private func handleGallery() {
        print("gallery called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc private func handleCamera() {
        print("camera called")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Camera not found. Try picking an image from your gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private let myLabelProfile:UILabel = {
        let labelExp = UILabel()
        labelExp.text = "Profile"
        labelExp.textAlignment = .left
        // labelExp.textColor = .white
        return labelExp
    }()
    
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    private let myImageViewP:UIImageView = {
        let imageViewP = UIImageView()
        imageViewP.contentMode = .scaleAspectFill
        imageViewP.clipsToBounds = true
        imageViewP.image = UIImage(named: "img1")
        return imageViewP
    }()
    
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabBar.items = [history, downloads]
        return tabBar
    }()
    
    private let myPickerView = UIPickerView()
    private let pickerData = ["Surat", "Baroda", "Vapi"]
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        //activity.style = .small
        activity.color = .red
        return activity
    }()
    
    @objc func handleActivity() {
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    
    private let myButtonCon:UIButton = {
        let buttonCon = UIButton()
        buttonCon.setTitle("Submit", for: .normal)
        buttonCon.addTarget(self, action: #selector(handleActivity), for: .touchUpInside)
        buttonCon.backgroundColor = .green
        buttonCon.layer.cornerRadius = 5
        return buttonCon
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(myImageViewP)
        view.addSubview(myToolBar)
        view.addSubview(myLabelProfile)
        view.addSubview(mySegmentControl)
        view.addSubview(myLabelAge)
        view.addSubview(myStepper)
        view.addSubview(myLabelFresher)
        view.addSubview(mySwitch)
        imagePicker.delegate = self
        view.addSubview(tabBar)
        tabBar.delegate = self
        view.addSubview(myPickerView)
        
        myPickerView.dataSource = self
        myPickerView.delegate = self
        view.addSubview(myActivityIndicatorView)
        view.addSubview(myButtonCon)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let toolBarHeight: CGFloat = view.safeAreaInsets.top + 40
        myToolBar.frame = CGRect(x: 0, y: 0, width: view.width, height: toolBarHeight)
        myLabelProfile.frame = CGRect(x: 0, y: myToolBar.bottom + 20, width: view.width, height: 40)
        myImageViewP.frame = CGRect(x: 20, y: myLabelProfile.bottom + 40, width: view.width - 40, height: 70)
        
        mySegmentControl.frame = CGRect(x: 20, y: myImageViewP.bottom + 10, width: view.width - 40, height: 30)
        myLabelAge.frame = CGRect(x: 20, y: mySegmentControl.bottom + 20, width: view.width - 40, height: 40)
        myStepper.frame = CGRect(x: 20, y: myLabelAge.bottom + 10, width: view.width - 40, height: 40)
        myLabelFresher.frame = CGRect(x: 20, y: myStepper.bottom + 20, width: view.width - 40, height: 40)
        mySwitch.frame = CGRect(x: 20, y: myLabelFresher.bottom + 10, width: view.width - 40, height: 40)
        myPickerView.frame = CGRect(x: 20, y: mySwitch.bottom + 20, width: view.width - 40, height: 40)
      
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 49
        tabBar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        myActivityIndicatorView.frame = CGRect(x: 20, y: myPickerView.bottom + 20, width: view.width - 40, height: 40)
        myButtonCon.frame = CGRect(x: 20, y:myActivityIndicatorView.bottom + 20, width: view.width - 40, height: 40)
    }

    @objc func handleSegmentControl(){
        print(mySegmentControl.selectedSegmentIndex)
    }
    
    @objc func handleStepper(){
        print(myStepper.value)
    }
    
    @objc func handleSwitcher(){
        print(mySwitch.isOn)
    }
    
}
extension Part3: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}

extension Part3:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageViewP.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}

extension Part3: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
    }
}

