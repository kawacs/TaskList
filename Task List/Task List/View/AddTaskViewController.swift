//
//  AddTaskViewController.swift
//  Task List
//
//  Created by Дмитрий Кривонос on 13.02.2023.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func saveButton(_ sender: Any) {
        
        let task = Task(name: taskName.text ?? "", time:datePicker.date)
        let vm = TaskViewModel.sharedInstance
        vm.addTask(task:task){
            self.navigationController?.popViewController(animated: true)
            
        }
    }
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
    }


