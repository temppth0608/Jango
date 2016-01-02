//
//  MainTabBarController.swift
//  jango
//
//  Created by 장섭 심 on 2015. 12. 27..
//  Copyright © 2015년 hyunjeong,sanghyun. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //텝바를 클릭하였을 때 변경
        UITabBarItem.appearance().setTitleTextAttributes(NSDictionary(object: UIColor.greenColor(), forKey: NSFontAttributeName) as! [String : AnyObject], forState: UIControlState.Selected)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
