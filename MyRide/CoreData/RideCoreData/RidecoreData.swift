//
//  GroupCoreDatabaseFile.swift
//  MyRide
//
//  Created by Riyasat on 23/02/23.
//
import Foundation
import CoreData
import SystemConfiguration
import UIKit
import Alamofire

class RideCoreData{
    let appDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    static let sharedInstance = RideCoreData()
    // @see IUserDataAccess.create
    func create() throws{
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        // Create Entity Description
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "RideData", into: context) as! RideData
        newUser.rideName = ""
        
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
    
    func Save(rideDetails : [String : String]) throws{
        let context:NSManagedObjectContext = appDel.persistentContainer.viewContext
        // Create Entity Description
        let newSignal = NSEntityDescription.insertNewObject(forEntityName: "RideData", into: context) as! RideData
        newSignal.rideId = Utils.uniqueNumberGenerate()
        newSignal.rideName = Utils.unWrapString(string: rideDetails[NDrideNam])
        newSignal.startDate = Utils.unWrapString(string: rideDetails[NDstartDate])
        newSignal.endDate =  Utils.unWrapString(string: rideDetails[NDendDate])
        newSignal.weekName =  Utils.unWrapString(string: rideDetails[NDweekName])
        newSignal.startLocation =  Utils.unWrapString(string: rideDetails[NDstartlocation])
        newSignal.endLocation =  Utils.unWrapString(string: rideDetails[NDendLocation])
        newSignal.meetingTime =  Utils.unWrapString(string: rideDetails[NDMeetingTime])
        newSignal.briefingTime =  Utils.unWrapString(string: rideDetails[NDBriefingTime])
        newSignal.flagTime =  Utils.unWrapString(string: rideDetails[NDFlgTine])
        newSignal.cost =  Utils.unWrapString(string: rideDetails[NDCost])
        newSignal.mealPlan =  Utils.unWrapString(string: rideDetails[NDMeal])
        do {
            try context.save()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RideSaved"), object: nil, userInfo: nil)
        } catch  {
            print("Something went wrong.")
            
        }
    }
    
    // MARK: -  getting all signal from local database for store
    /// if Mobile is offline then we will save into local databae
    /// context is create connection between databse and app
    /// fetchRequest is fetching table from database.(Signal is table name)
    
    func fetchObservation() -> [RideData]{
        var SignalArray = [RideData]()
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RideData")
        do {
            let results = try context.fetch(fetchRequest)
            let sign = results as! [RideData]
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RideData")
        fetchRequest.predicate = NSPredicate(format: "rideId = %@", Gid)
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "RideData")
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
