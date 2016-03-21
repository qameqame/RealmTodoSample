//
//  ViewController.swift
//  RealmTest2
//
//  Created by 亀山裕樹 on 2016/03/20.
//  Copyright © 2016年 Hiroki Kameyama. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var todoNameText: UITextField!
    
    @IBOutlet weak var dateLabel: UIDatePicker!
    @IBOutlet weak var tableView: UITableView!
    
    var toDoItems:Results<ToDo>?{
        do{
            let realm = try Realm()
            return realm.objects(ToDo)
        }catch{
            print("エラー")
        }
        return nil
    }
    
    @IBAction func dateChanged(sender: UIDatePicker) {
        
        print("dateChanged!!!!")
        
    }
        
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addToDo(sender: UIButton) {
        if isValidateInputContens() == false{
            return
        }
    
        let toDo = ToDo()
        toDo.name = todoNameText.text!
        
//        toDo.deadLine =
        
        
        do{
            let realm = try Realm()
            try realm.write{
                realm.add(toDo)
            }
            todoNameText.text = ""
        }catch{
            print("失敗")
        }
        tableView.reloadData()
    }

    private func isValidateInputContens() -> Bool {
        if let name = todoNameText.text{
            
            if name.characters.count == 0{
                return false
            }
        }else{
            
            return false
        }
        return true
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoItems?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let toDo = toDoItems?[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ToDoTableViewCell
        // Realmに登録したデータをラベルに値設定
        cell.nameLabel.text = toDo?.name
        
        print(toDo?.name)
        
        return cell
    }
}


