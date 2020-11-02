//
//  ViewController.swift
//  SearchFlickerDemo
//
//  Created by 江柏毅 on 2020/11/1.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var searchButton: UIButton!
    @IBOutlet var searchName:  UITextField!
    @IBOutlet var searchContent:  UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.backgroundColor = UIColor.gray
        searchButton.isEnabled = false
        
        
        
        searchName.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)

        searchContent.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        searchButton.addTarget(self, action: #selector(self.clickButton(_:)), for: .touchDown)


    }
    @objc func clickButton(_ button:UIButton) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "PHOTO") {
            present(controller, animated: true, completion: nil)
        }
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if searchName.hasText && searchContent.hasText
        {
            searchButton.isEnabled = true
            searchButton.backgroundColor = UIColor.systemBlue
        }
        else {
            searchButton.isEnabled = false
            searchButton.backgroundColor = UIColor.gray
        }
    }
    
    
    
}

