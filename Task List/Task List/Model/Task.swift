//
//  Task.swift
//  Task List
//
//  Created by Дмитрий Кривонос on 13.02.2023.
//

import Foundation
import RealmSwift

class Task: Object {
   @objc dynamic var name:String = ""
  
    @objc dynamic var time:Date = Date()
    
    
    override init(){
        super.init()
    }
    
    init(name: String,time: Date) {
        self.name = name
     
        self.time = time
    }
}

