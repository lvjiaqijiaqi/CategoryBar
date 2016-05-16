//
//  ViewController.swift
//  CategoryBar
//
//  Created by lvjiaqi on 16/5/15.
//  Copyright © 2016年 lvjiaqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var categoryBar:CategoryBar?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationItem.title = "水果市场"
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarPosition: UIBarPosition.Top, barMetrics: UIBarMetrics.Default)
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 222.0/255, green: 240.0/255, blue: 245.0/255, alpha: 1)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:CollectionViewBarConfig.HeaderBarWordsColor]
        
        let v0:UIView = UIView(frame: CGRectMake(0, -20, self.view!.frame.size.width, 20))
        v0.backgroundColor = UIColor(red: 222.0/255, green: 240.0/255, blue: 245.0/255, alpha: 1)
        self.navigationController?.navigationBar.addSubview(v0)
        
        self.tabBarController?.tabBar.backgroundColor =  UIColor(red: 222.0/255, green: 240.0/255, blue: 245.0/255, alpha: 1)
        self.tabBarController?.tabBar.backgroundImage = UIImage()
        self.tabBarController?.tabBar.shadowImage = UIImage()
        
        
        let v1:WaterMelonTV = WaterMelonTV(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        
        let v2:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v2.backgroundColor = UIColor.greenColor()
        let v3:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v3.backgroundColor = UIColor.blueColor()
        let v4:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v4.backgroundColor = UIColor.brownColor()
        let v5:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v5.backgroundColor = UIColor.yellowColor()
        let v6:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v6.backgroundColor = UIColor.redColor()
        let v7:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v7.backgroundColor = UIColor.greenColor()
        let v8:UIView = UIView(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height))
        v8.backgroundColor = UIColor.blueColor()
        
        let views:[UIView] = [v1,v2,v3,v4,v5,v6,v7,v8]
        let titles:[String] = ["苹果","水蜜桃","菠萝","西瓜","橙子","蜜瓜","葡萄","芒果"]
        let v:CategoryBar = CategoryBar(frame: CGRectMake(0, 0, self.view!.frame.size.width, self.view!.frame.size.height) , views:views , titles:titles)
        self.view.addSubview(v)
        
        self.categoryBar = v
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

