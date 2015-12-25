//
//  coredata_load.swift
//  jango
//
//  Created by knight on 2015. 12. 25..
//  Copyright © 2015년 hyunjeong,sanghyun. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Food)
class Food: NSManagedObject {
    @NSManaged var f_key:String?
    @NSManaged var f_title:String?
    @NSManaged var f_text:String?
    @NSManaged var f_categoryBig:String?
    @NSManaged var f_categorySmall:String?
    @NSManaged var f_regDate:NSDate?
    @NSManaged var f_expireDate:NSDate?
}


