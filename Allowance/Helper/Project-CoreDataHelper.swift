//
//  Project-CoreDataHelper.swift
//  Allowance
//
//  Created by Seth Wright on 1/15/23.
//

import Foundation

extension Project {
    var projectTitle: String {
        title ?? ""
    }
    
    var projectDetail: String {
        detail ?? ""
    }
    
    var projectCreationDate: Date {
        creationDate ?? Date()
    }
    
    var projectItems: [Item] {
        items?.allObjects as? [Item] ?? []
    }
    
    var sortedItems: [Item] {
        projectItems.sorted { first, second in
            if first.completed == false && second.completed == true {
                return true
            } else if first.completed == true && second.completed == false {
                return false
            }
            
            if first.priority > second.priority {
                return true
            } else if first.priority < second.priority {
                return false
            }
            
            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    var completionAmount: Double {
        guard projectItems.isEmpty == false else { return 0 }
        let completedItems = projectItems.filter(\.completed)
        return Double(completedItems.count) / Double(projectItems.count)
    }
    
    static var example: Project {
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example project"
        project.detail = "This is an example project"
        project.closed = true
        project.creationDate = Date()
        
        return project
    }
}
