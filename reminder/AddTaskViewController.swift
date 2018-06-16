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
    @IBOutlet weak var CategorySegmentedControl: UISegmentedControl!
    
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var task: Task?
    
    // MARK: -
    var taskCategory = "ToDo"
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // taskに値が代入されていたら、textFieldとsegmentedControlにそれを表示
        if let task = task {
            TaskTextField.text = task.name
            taskCategory = task.category!
            switch task.category! {
                case "ToDo":
                    CategorySegmentedControl.selectedSegmentIndex = 0
                case "Shopping":
                    CategorySegmentedControl.selectedSegmentIndex = 1
                case "Assignment":
                    CategorySegmentedControl.selectedSegmentIndex = 2
                default:
                    CategorySegmentedControl.selectedSegmentIndex = 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions of Buttons
    @IBAction func addButtonTapped(_ sender: Any) {
        let taskName = TaskTextField.text
        if taskName == "" {
            dismiss(animated: true, completion: nil)
            return
        }
        
        // 受け取った値が空であれば、新しいTask型オブジェクトを作成する
        if task == nil {
            task = Task(context: context)
        }
        
        // 受け取ったオブジェクト、または、先ほど新しく作成したオブジェクトそのタスクのnameとcategoryに入力データを代入する
        if let task = task {
            task.name = taskName
            task.category = taskCategory
        }
        
        // 変更内容を保存する
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
