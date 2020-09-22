//
//  ResultViewController.swift
//  egumonApp
//
//  Created by いわし on 2020/09/20.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
 func showAlert(title:String,message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close:UIAlertAction = UIAlertAction(title: "close", style: .cancel, handler:{ (action:UIAlertAction!) -> Void in
        })
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
}
