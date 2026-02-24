//
//  CoreDataManager.swift
//  Foodie
//
//  Created by S, Praveen (Cognizant) on 11/10/25.
//

import Foundation
import CoreData

struct PersistenceController {
    
    static let shared = PersistenceController()
    let container : NSPersistentContainer
    var viewContext : NSManagedObjectContext {
       container.viewContext
    }
    private init (inMemory : Bool = false) {
        container = NSPersistentContainer(name: "FoodEntities")
        container.loadPersistentStores { description, error in
            if let error = error as? NSError {
                print(error.localizedDescription)
            }
        }
        //printURL()
    }
    
    func save () async  {
        do {
            try viewContext.save()
        }
        catch {
            print("error saving the data")
        }
    }
  
   
    func addOrder (orderItems : OrderModel) async  {
        printURL()
        let order = Orders(context: viewContext)
        order.orderId = UUID()
        order.totalAmount = Int64(orderItems.totalPrize)
        
      
       
       
        for item in orderItems.orderItems {
            let items = OrderItems(context: viewContext)
            items.describe = item.describe
            items.image = item.image
            items.price = item.price
            items.quantity = Int64(item.quantity)
            items.item = item.name
           
            items.orders = order
            
           
        }
        
       
         await save()
        
           
    }
    
    func updatePricingOfItem (param : Orders) {
        let fetchRequest : NSFetchRequest<Orders> = Orders.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "totalPrize > lld" , 100 )
        
        do {
            let result = try viewContext.fetch(fetchRequest).first
            result?.totalAmount = 100
            
        }
        catch {
            print("error updating the orderId")
        }
        
        
    }
    func getordersContainingTea ( param : String = "Apple") -> [OrderItems] {
        let fetchrequest : NSFetchRequest = OrderItems.fetchRequest()
        fetchrequest.predicate = NSPredicate(format: "item = %@", param)
        do {
            let result = try viewContext.fetch(fetchrequest)
            return result
        }
        catch {
            print("error retrieving")
        }
       return []
    }
    
   
    func printURL () {
        if let url =   PersistenceController.shared.container.persistentStoreDescriptions.first?.url {
            print(url)
        }
    }
    
}

