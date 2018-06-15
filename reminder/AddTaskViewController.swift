//
//  AddTaskViewController.swift
//  reminder
//
//  Created by NagaiNaoki on 2018/06/15.
//  Copyright © 2018年 nmr. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var TaskTextField: UITextField!
    @IBOutlet weak var CategorySegmentedControll: UISegmentedControl!
    
    // MARK: -
    var taskCategory = "ToDo"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions of Buttons
    @IBAction func addButtonTapped(_ sender: Any) {
        // TextFieldに何も入力されていない場合は何もせずに1つ目のビューへ戻ります。
        let taskName = TaskTextField.text
        if taskName == "" {
            print("receive black task")
            dismiss(animated: true, completion: nil)
            return
        }
        
        // context(データベースを扱うのに必要)を定義。
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        // taskにTask(データベースのエンティティです)型オブジェクトを代入します。
        let task = Task(context: context)
        
        // Task型データのname、categoryプロパティに入力、選択したデータを代入します。
        task.name = taskName
        task.category = taskCategory
        
        print("receive task", task)
        
        // 上で作成したデータをデータベースに保存します。
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func categoryChosen(_ sender: UISegmentedControl) {
        // choose category of task
        switch sender.selectedSegmentIndex {
            case 0:
                taskCategory = "ToDo"
            case 1:
                taskCategory = "Shopping"
            case 2:
                taskCategory = "Assignment"
            default:
                taskCategory = "ToDo"
        }
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
