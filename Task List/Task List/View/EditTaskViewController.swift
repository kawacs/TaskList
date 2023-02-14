//
//  EditTaskViewController.swift
//  Task List
//
//  Created by Дмитрий Кривонос on 13.02.2023.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func saveButton(_ sender: Any) {
        
        let newTask = Task(name: name.text ?? "", time: datePicker.date)
        vm.editTask(tasks: self.task!, updatedTask: newTask) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        vm.deleteTask(task: self.task!, taskIndex: self.index!) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    var task:Task?
    var index:Int?
    
    let vm = TaskViewModel.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myTask = self.task{
            name.text = myTask.name
            datePicker.date = myTask.time
        }
    }
}
