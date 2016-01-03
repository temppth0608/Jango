//
//  FoodList.swift
//  jango
//
//  Created by knight on 2015. 12. 25..
//  Copyright © 2015년 hyunjeong,sanghyun. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class FoodManage {
    //Food테이블에 대한 불러오기,저장,삭제,변경(CRUD) 기능을 정의해놓은 클래스
    //2015.12.25 작성
    
    func FoodList() -> NSArray{
        var results = [NSManagedObject]()//NSManageObject 배열 형태로 검색된 리스트를 리턴함
        // appDelegate 열어주기, managedContext 사용 초기화
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //FetchRequest에 Food엔티티 저장
        let fetchRequest = NSFetchRequest(entityName: "Food")
        
        //Food에 있는 값을 배열형태로 불러들여옴
        do {
            results =
                try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            print("본인이 저장한 Food 전체 목록을 불러옴")
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return results
    }
    
    
    func FoodSave(title: String, text: String, expireDate: NSDate, regDate: NSDate, categorySmall: String, categoryBig: String) -> Bool{
        
        // appDelegate 열어주기, managedContext 사용 초기화
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        let managedContext = appDel.managedObjectContext
        
        let en = NSEntityDescription.entityForName("Food", inManagedObjectContext: context)
        
        let newFood =  Food(entity: en!, insertIntoManagedObjectContext: context)
        
        var key_value = String(arc4random())
        
        let fetchRequest = NSFetchRequest(entityName: "Food")
        
        var resultSet:NSArray = []
        
        var results = [NSManagedObject]()
        do {
            results =
                try managedContext.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            
            resultSet = results
            print("save 중복검사 테스트 갯수 : \(resultSet.count)")
            var i:Int = 1
            if(resultSet.count == 1){
                print("no data in resultSet")
            }else{
                while i < resultSet.count{
                    print("반복횟수 : \(i)")
                    if(key_value == resultSet[i].valueForKey("f_key") as! String){
                        key_value = String(arc4random())
                        i = 0
                    }else{
                        i = i + 1
                    }
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        newFood.f_key = key_value
        newFood.f_title = title
        newFood.f_text = text
        newFood.f_regDate = regDate
        newFood.f_expireDate = expireDate
        newFood.f_categorySmall = categorySmall
        newFood.f_categoryBig = categoryBig
        //Food data model에 있는 값을 입력받은 값들로 채워줌
        do{
            try context.save()
            print("새로운 음식 정보 저장 완료 \(title), \(text)")
            return true
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
            return false
        }
    }
    
    
    func FoodUpdate(key:String, title: String, text: String, expireDate: NSDate, regDate: NSDate, categorySmall: String, categoryBig: String){
        
        // appDelegate 열어주기, managedContext 사용 초기화
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Food")
        request.predicate = NSPredicate(format: "f_key = %@", key)
        
        do {
            if let fetchResults =
                try appDel.managedObjectContext.executeFetchRequest(request) as? [NSManagedObject] {
                    if fetchResults.count != 0{
                        let managedObject = fetchResults[0]
                        managedObject.setValue(title, forKey: "f_title")
                        managedObject.setValue(text, forKey: "f_text")
                        managedObject.setValue(expireDate, forKey: "f_expireDate")
                        managedObject.setValue(regDate, forKey: "f_regDate")
                        managedObject.setValue(categorySmall, forKey: "f_categorySmall")
                        managedObject.setValue(categoryBig, forKey: "f_categoryBig")
                    }
            }
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        do{
            try context.save()
            print("기존 정보 업데이트 완료")
        }catch let error as NSError{
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    func FoodDelete(dataToDelete:NSManagedObject){
        // appDelegate 열어주기, managedContext 사용 초기화
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        managedContext.deleteObject(dataToDelete)
        print("선택한 오브젝트 삭제")
    }
    
    /*func FoodSave(title: String, text: String, expireDate: NSDate, regDate: NSDate, categorySmall: String, categoryBig: String){
    // appDelegate 열어주기, managedContext 사용 초기화
    let appDelegate =
    UIApplication.sharedApplication().delegate as! AppDelegate
    
    let managedContext = appDelegate.managedObjectContext
    
    // entity(테이블)에 만들어놓은 CoreDate 테이블인 'Food'를 설정
    let entity =  NSEntityDescription.entityForName("Food",
    inManagedObjectContext:managedContext)
    
    let food = NSManagedObject(entity: entity!,
    insertIntoManagedObjectContext: managedContext)
    // 'Food'엔티티의 제목,내용 등을 입력시킴
    food.setValue(title, forKey: "f_title")
    food.setValue(text, forKey: "f_text")
    food.setValue(expireDate, forKey: "f_expireDate")
    food.setValue(regDate, forKey: "f_regDate")
    food.setValue(categorySmall, forKey: "f_categorySmall")
    food.setValue(categoryBig, forKey: "f_categoryBig")
    
    //4
    do {
    try managedContext.save()
    print("새로운 음식 정보 저장 완료 \(title), \(text)")
    } catch let error as NSError  {
    print("Could not save \(error), \(error.userInfo)")
    }
    }*/
}