//
//  WaterMelonTV.swift
//  collectionViewBar
//
//  Created by lvjiaqi on 16/5/10.
//  Copyright © 2016年 lvjiaqi. All rights reserved.
//

import UIKit

extension WaterMelonTV:UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
      let cell =  tableView.dequeueReusableCellWithIdentifier("waterMelonCell")
        cell?.textLabel?.text = "苹果（Malus pumila Mill.）：是落叶乔木，通常树木可高至15米，但栽培树木一般只高3-5米左右。树干呈灰褐色，树皮有一定程度的脱落。苹果树开花期是基于各地气候而定，但一般集中在4-5月份。苹果是异花授粉植物，大部分品种自花不能结成果实。"
        cell?.textLabel?.font = UIFont(name: "Arial", size: 10)
        cell?.textLabel?.numberOfLines = 0
        cell?.imageView?.image = UIImage(named: "apple")
        return cell!
    }
}

extension WaterMelonTV:UITableViewDelegate{
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
}


class WaterMelonTV: UITableView {
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.dataSource = self
        self.delegate = self
        self.registerClass(UITableViewCell.self, forCellReuseIdentifier: "waterMelonCell")
        self.directionalLockEnabled = true
        self.backgroundColor =  UIColor(red: 222.0/255, green: 240.0/255, blue: 245.0/255, alpha: 0.6)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
