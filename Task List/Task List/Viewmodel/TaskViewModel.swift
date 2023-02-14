//
//  TaskViewModel.swift
//  Task List
//
//  Created by Дмитрий Кривонос on 13.02.2023.
//

import Foundation
import RealmSwift

class TaskViewModel: NSObject {
    
    
    static var sharedInstance = TaskViewModel()
    
    var tasks = [Task]()
    
    typealias completionHandler = () -> Void
    
    
    let realm = try! Realm()
    
    func addTask(task:Task,completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.add(task)
        
        try! self.realm.commitWrite()
        
        completion()
    }
    
    func editTask(tasks:Task,updatedTask:Task,completion:completionHandler) {
        self.realm.beginWrite()
        
        //Delete the old task
        self.realm.delete(tasks)
        //Add updated task
        self.realm.add(updatedTask)
        
        try!self.realm.commitWrite()
        completion()
    }
    
    func deleteTask(task:Task, taskIndex:Int,completion:completionHandler){
        self.realm.beginWrite()
        
        //Delete the old task
        try!self.realm.delete(task)
       
        tasks.remove(at: taskIndex)
        
        
    }
    func loadTasks(completion: completionHandler){
        
        let saveTasks = self.realm.objects(Task.self)
        self.tasks.removeAll()
        self.tasks.append(contentsOf: saveTasks)
        
        try! self.realm.commitWrite()
        
        
    }
}
