//
//  ResultViewController.swift
//  egumonApp
//
//  Created by いわし on 2020/09/20.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    
    
    @IBOutlet weak var monsterImageView: UIImageView!
    
    
    @IBOutlet weak var outputLabel: UILabel!
    
    // 1. 遷移先に渡したい値を格納する変数を用意する
    var outputcomment : String?
    var outputimage : String?
    var dictionaryNum:Int?
    var monsterdictionary:[Int:String] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if outputimage != nil || outputcomment != nil{
            monsterImageView.image = UIImage(named:outputimage!)
            outputLabel.text = outputcomment!
            print(outputimage!)
            print(outputcomment!)
            print(dictionaryNum!)
            
            monsterdictionary.updateValue(outputimage!, forKey: dictionaryNum!)
            print(monsterdictionary)
            let next = storyboard?.instantiateViewController(withIdentifier: "Library") as! LibraryViewController
            present(next, animated: true, completion: nil)
            UserDefaults.standard.set(dictionaryNum!, forKey: "add")
            
            
        }
    }
    
    
    
    //    戻るボタン
    @IBAction func BackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
   
    //    アラートを出す関数
    func showAlert(title:String,message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close:UIAlertAction = UIAlertAction(title: "close", style: .cancel, handler:{ (action:UIAlertAction!) -> Void in
        })
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    //    表示させる画像(モンスター)と番号を登録する｡
    //    var monsterDictionary:[String:Int] = [
    //        "illustrain08_bird01":0001, /* アクション0*/
    //        "b":0002,
    //        "c":0003,
    //        "d":0004,
    //        "e":0005
    //    ]
    
    
    
}
