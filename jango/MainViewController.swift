//
//  ViewController.swift
//  jango
//
//  Created by 박태현 on 2015. 12. 25..
//  Copyright © 2015년 hyunjeong,sanghyun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var jangoSayTableView: UITableView!
    @IBOutlet weak var oneCollectionView: UICollectionView!
    
    @IBOutlet weak var twoCollectionView: UICollectionView!
    @IBOutlet weak var threeCollectionView: UICollectionView!
    @IBOutlet weak var fourCollectionView: UICollectionView!
    
    var jangoSay = ["안녕, 나는 장고야! 우리집을 깨끗이 유지해줘!!","11월 16일에 산 우유의 유통기한이 2틀 남았어!!", "A", "B", "C"]
    var jangoItem1 = ["jango", "jango"]
    var jangoItem2 = ["jango", "jango", "jango", "jango", "jango"]
    var jangoItem3 = ["jango", "jango", "jango", "jango"]
    var jangoItem4 = ["jango", "jango", "jango", "jango"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return jangoSay.count
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = jangoSayTableView.dequeueReusableCellWithIdentifier("JangoSayTableViewCell", forIndexPath: indexPath) as! JangoSayTableViewCell
        
        cell.jangoImageView.image = UIImage(named: "jango.png")
        cell.ballonImageView.image = UIImage(named: "balloon.png")
        cell.jangoLabel.text = jangoSay[indexPath.row]
        
        return cell
    }
    
    internal func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == oneCollectionView
        {return jangoItem1.count}
        
        else if collectionView == twoCollectionView
        {return jangoItem2.count}
        
        else if collectionView == threeCollectionView
        {return jangoItem3.count}
        
        else if collectionView == fourCollectionView
        {return jangoItem4.count}
        
        return 0
    }
    
    internal func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FoodCell", forIndexPath: indexPath) as! FoodCollectionViewCell
       
        if collectionView == oneCollectionView
        {
            cell.foodImageView.image = UIImage(named: "\(jangoItem1[indexPath.row]).png")
        } else if collectionView == twoCollectionView
        {
            cell.foodImageView.image = UIImage(named: "\(jangoItem2[indexPath.row]).png")
        }
        else if collectionView == threeCollectionView
        {
            cell.foodImageView.image = UIImage(named: "\(jangoItem3[indexPath.row]).png")
        }
        else if collectionView == fourCollectionView
        {
            cell.foodImageView.image = UIImage(named: "\(jangoItem4[indexPath.row]).png")
        }
        
        return cell
    }
}