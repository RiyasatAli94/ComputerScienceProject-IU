//
//  GroupCoreDatabaseFile.swift
//  MyRide
//
//  Created by Keval Shah on 23/02/23.
//
import Foundation
import CoreData
import SystemConfiguration
import UIKit

class GroupCoreDatabaseClass{
    let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let sharedInstance = GroupCoreDatabaseClass()
    // @see IUserDataAccess.create
    func create() throws{
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        // Create Entity Description
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "GroupDetails", into: context) as! GroupDetails
        newUser.gName = ""
        
        do {
            try context.save()
        } catch  {
            print("Something went wrong.")
        }
    }
    
    // MARK: -  Saved all signal in local database
    /// if Mobile is offline then we will save into local databae
    /// context is create connection between databse and app
    /// fetchRequest is fetching table from database.(Signal is table name)
    
    func Sabe(GroupDetails : GroupModels) throws{
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        // Create Entity Description
        let newSignal = NSEntityDescription.insertNewObject(forEntityName: "GroupDetails", into: context) as! GroupDetails
        newSignal.gId = Utils.uniqueNumberGenerate()
        newSignal.gName = Utils.unWrapString(string: GroupDetails.groupName)
        newSignal.gimg = Utils.unWrapString(string: GroupDetails.groupImg)
        newSignal.gLastTime =  Utils.unWrapString(string: GroupDetails.groupLastTime)
        newSignal.gLastMessgae =  Utils.unWrapString(string: GroupDetails.groupLastMessage)
        do {
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SaveSignal"), object: nil, userInfo: nil)
        } catch  {
            print("Something went wrong.")
            
        }
    }
    
    // MARK: -  getting all signal from local database for store
    /// if Mobile is offline then we will save into local databae
    /// context is create connection between databse and app
    /// fetchRequest is fetching table from database.(Signal is table name)
    
    func fetchObservation() -> [GroupDetails]{
        var SignalArray = [GroupDetails]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupDetails")
        do {
            let results = try context.fetch(fetchRequest)
            let sign = results as! [GroupDetails]
            SignalArray = sign
            for sign1 in sign {
                //print(sign1.datetime!)//
            }
        }catch let err as NSError {
            print(err.debugDescription)
            
        }
        return SignalArray
    }
    
    // MARK :-  deleting signals in local database when all signals send one by one
    /// if Mobile is comes online then we will delete all signals into local databae
    /// context is create connection between databse and app
    /// fetchRequest is fetching table from database.(Signal is table name)
    func deleteObservation(Gid : String){
        // Initialize Fetch Request
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupDetails")
        fetchRequest.predicate = NSPredicate(format: "gId = %@", Gid)
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try context.fetch(fetchRequest)
            
            for item in items {
                // Deleting object from database
                context.delete(item as! NSManagedObject)
            }
            
            // Save Changes
            try context.save()
            // NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SignalDeleted"), object: nil, userInfo: nil)
            
        } catch {
            // Error Handlingdo{
            // ...
        }
    }
    
    // MARK :-  deleting signals in local database when all signals send one by one
    /// if Mobile is comes online then we will delete all signals into local databae
    /// context is create connection between databse and app
    /// fetchRequest is fetching table from database.(Signal is table name)
    func deleteObservation(){
        // Initialize Fetch Request
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroupDetails")
        // Configure Fetch Request
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try context.fetch(fetchRequest)
            
            for item in items {
                // Deleting object from database
                context.delete(item as! NSManagedObject)
            }
            
            // Save Changes
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GroupDetails"), object: nil, userInfo: nil)
            
        } catch {
            // Error Handling
            // ...
        }
    }
    
}
