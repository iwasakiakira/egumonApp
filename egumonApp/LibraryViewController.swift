//
//  LibraryViewController.swift
//  egumonApp
//
//  Created by いわし on 2020/09/21.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var RmonsterDictionary:[Int:String] = [:]
    
//    var RmonsterDictionary:[Int:String]? = UserDefaults.standard.object(forKey: "monsterDictionary") as? [Int : String]
//     (forKey: "monsterDictionary") -> [Int:String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(RmonsterDictionary)
        libraryTableView.delegate = self
        libraryTableView.dataSource = self
    }
    
    @IBOutlet weak var libraryTableView: UITableView!
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        キーで保存されたほにゃららを取り出す
        if UserDefaults.standard.object(forKey: "Library") != nil{
            RmonsterDictionary = UserDefaults.standard.object(forKey: "Library") as! [Int:String]
        }
    }
    //    表示させる画像(モンスター)と番号を登録する｡
    var monsterDictionary:[Int:String] = [
        0001:"a",
        0002:"b",
        0003:"c",
        0004:"d"
    ]
    
    var monsterDictionaryNum:[String] = [
        "0001",
        "0002",
        "0003",
        "0004",
        "0005",
    ]
    

    
//    テーブルビューの設定
    
//    セルの個数を指定するデリゲートメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    //    セルに値を設定するデータソースメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // セルに表示する値を設定する
        cell.textLabel!.text = monsterDictionary[indexPath.row]
        return cell
    }
    
    

}
