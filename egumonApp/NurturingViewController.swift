//
//  NurturingViewController.swift
//  egumonApp
//
//  Created by いわし on 2020/09/20.
//  Copyright © 2020 iwasi. All rights reserved.
//

import UIKit

class NurturingViewController: UIViewController {
    
    var ActionCount = 0
    
    @IBOutlet weak var ActionCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(monsterDictionary)
        ActionCountLabel.text = "ActionCount:\(ActionCount)"
    }
    
    //    アクションが100に満たない状態でたまごを割ってモンスターをかえす｡
    @IBAction func BreakButton(_ sender: Any) {
      // ① UIAlertControllerクラスのインスタンスを生成
         // タイトル, メッセージ, Alertのスタイルを指定する
         // 第3引数のpreferredStyleでアラートの表示スタイルを指定する
        let alert: UIAlertController = UIAlertController(title: "Break the Egg?", message: "Really？", preferredStyle:  UIAlertController.Style.alert)

         // ② Actionの設定
         // Action初期化時にタイトル, スタイル, 押された時に実行されるハンドラを指定する
         // 第3引数のUIAlertActionStyleでボタンのスタイルを指定する
         // OKボタン
        let defaultAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:{
             // ボタンが押された時の処理を書く（クロージャ実装）
             (action: UIAlertAction!) -> Void in
             let move2RVC = self.storyboard?.instantiateViewController(withIdentifier: "MoveResult") as! ResultViewController
             //           ほにゃらら秒後にリザルト画面に遷移する｡
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                 self.present(move2RVC,animated: true,completion: nil)
             }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                self.ActionCount = 0
                self.ActionCountLabel.text = "ActionCount:\(self.ActionCount)"
            }
         })
        
         // キャンセルボタン
        let cancelAction: UIAlertAction = UIAlertAction(title: "cancel", style: UIAlertAction.Style.cancel, handler:{
             // ボタンが押された時の処理を書く（クロージャ実装）
             (action: UIAlertAction!) -> Void in
             print("Cancel")
         })

         // ③ UIAlertControllerにActionを追加
         alert.addAction(cancelAction)
         alert.addAction(defaultAction)

         // ④ Alertを表示
        present(alert, animated: true, completion: nil)
    }
    
    @IBOutlet weak var b: UIButton!
    @IBAction func b(_ sender: Any) {
        ButtonAction()
        Moveview1(title: "What is the egg like?", message: "おや?たまごのようすが?")

    }
    
    //    Bottonを押したときの処理(ボタンが多いので関数化)
    func ButtonAction(){
        ActionCount += 10
        print(ActionCount)
        ActionCountLabel.text = "ActionCount:\(ActionCount)"
        
    }
    
    //    ActionCountが到達した場合に画面遷移を行う関数
    func Moveview1(title:String,message:String){
        if ActionCount == 100{
            MoveView2(title: title, message: message)
        }
    }

    //    "Was born!!画面に遷移する関数"
    func MoveView2(title:String,message:String){
            let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let close:UIAlertAction = UIAlertAction(title: "close", style: .cancel, handler:{ (action:UIAlertAction!)in
                let move2RVC = self.storyboard?.instantiateViewController(withIdentifier: "MoveResult") as! ResultViewController
                //           ほにゃらら秒後にリザルト画面に遷移する｡
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                    self.present(move2RVC,animated: true,completion: nil)
                }
            })
            alert.addAction(close)
            present(alert, animated: true, completion: nil)
            
            //           ほにゃらら秒後にActionCountを0にして再表示する｡
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.ActionCount = 0
                self.ActionCountLabel.text = "ActionCount:\(self.ActionCount)"
            }
        }
    
    //    アラートを表示させる関数
    func showAlert(title:String,message:String){
        let alert:UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let close:UIAlertAction = UIAlertAction(title: "close", style: .cancel, handler:{ (action:UIAlertAction!) -> Void in
        })
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    func moveDictionary(){
        let userDefaults = UserDefaults.standard
        if userDefaults.object(forKey: "Library") != nil{
            monsterDictionary = userDefaults.object(forKey: "Library") as! [Int:String]
        }
    }
  
    //    表示させる画像(モンスター)と番号を登録する｡
    var monsterDictionary:[Int:String] = [
        0001:"a",
        0002:"b",
        0003:"c",
        0004:"d"
    ]
    
    
}
