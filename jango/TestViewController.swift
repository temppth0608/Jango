//
//  TestViewController.swift
//  jango
//
//  Created by knight on 2016. 1. 3..
//  Copyright © 2016년 hyunjeong,sanghyun. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    
    @IBOutlet weak var f_name: UITextField!
    @IBOutlet weak var text: UITextField!
    @IBOutlet weak var categoryBIg: UITextField!
    @IBOutlet weak var cateogorySmall: UITextField!
    @IBOutlet weak var regDate: UITextField!
    @IBOutlet weak var expireDate: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add_action(sender: AnyObject) {
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
