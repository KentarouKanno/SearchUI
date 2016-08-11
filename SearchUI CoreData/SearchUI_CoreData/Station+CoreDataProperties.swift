//
//  Station+CoreDataProperties.swift
//  SearchUI_CoreData
//
//  Created by KentarOu on 2016/08/12.
//  Copyright © 2016年 KentarOu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Station {

    @NSManaged var word: String?
    @NSManaged var detailInfo: String?
    @NSManaged var relationWord: String?

}
