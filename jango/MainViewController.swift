//
//  ViewController.swift
//  jango
//
//  Created by 박태현 on 2015. 12. 25..
//  Copyright © 2015년 hyunjeong,sanghyun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UITableViewDataSource {

    @IBOutlet weak var jangoSayTableView: UITableView!
    
    var jangoSay = ["안녕, 나는 장고야! 우리집을 깨끗이 유지해줘!!","11월 16일에 산 우유의 유통기한이 2틀 남았어!!"]
    
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
        return 2
    }
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = jangoSayTableView.dequeueReusableCellWithIdentifier("JangoSayTableViewCell", forIndexPath: indexPath) as! JangoSayTableViewCell
        
        cell.jangoImageView.image = UIImage(named: "jango.png")
        cell.ballonImageView.image = UIImage(named: "balloon.png")
        cell.jangoLabel.text = jangoSay[indexPath.row]
        
        return cell
    }

}