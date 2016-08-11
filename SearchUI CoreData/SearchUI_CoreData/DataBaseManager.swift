//
//  DataBaseManager.swift
//  SearchUI_CoreData
//
//  Created by KentarOu on 2016/08/12.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit
import Foundation

class DataBaseManager: NSObject {
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    func addCoreData(data: DataModel) {
        
        let managedObjectContext = appDelegate.managedObjectContext
        
        let station = NSEntityDescription.insertNewObjectForEntityForName("Station", inManagedObjectContext: managedObjectContext) as! Station
        station.word         = data.word
        station.detailInfo   = data.detailInfo
        station.relationWord = data.relationWord
    }
    
    
    func getAllStation() -> [DataModel]? {
        
        let fetchRequest = NSFetchRequest(entityName: "Station")
        
        var dataModelArray: Array<DataModel> = []
        
        do {
            let stations = try appDelegate.managedObjectContext.executeFetchRequest(fetchRequest) as! [Station]
            for station in stations {
                dataModelArray.append(DataModel(word: station.word!, relationWord: station.relationWord!, detailInfo: station.detailInfo!))
            }
        } catch let error as NSError {
            print(error)
            return nil 
        }
        return dataModelArray
    }
}
