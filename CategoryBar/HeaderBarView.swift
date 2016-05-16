//
//  collectionViewBarExtension.swift
//  collectionViewBar
//
//  Created by lvjiaqi on 16/5/9.
//  Copyright © 2016年 lvjiaqi. All rights reserved.
//

import UIKit


class HeaderBarView: UIView {
    
    var itemIndex:Int = 1
    var itemsTitle:[String] = Array()
    var items:[UILabel] = Array()
    var itemWidth:CGFloat = 0
    var swimmingView:UIView?
    
    var scrollView:UIScrollView?{
        get{
           return superview as? UIScrollView
        }
    }
 
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        if keyPath == "contentOffset" {
            
             let offsetX  = change!["new"]?.CGPointValue()
            
             var origin = self.frame.origin
             origin = CGPointMake((offsetX?.x)!, origin.y)
             self.frame.origin = origin
             
             let ratio = (offsetX?.x)!/(self.scrollView!.frame.size.width)
             self.swimmingView!.frame.origin = CGPointMake(self.itemWidth*ratio, 0)

        }
    }

    
    func initConponent(){
        
        self.frame.origin = CGPointZero
        self.backgroundColor =  CollectionViewBarConfig.HeaderBarBackgroundColor
        
        let wordsMaskView:UIView = UIView(frame: CGRectMake(0, 0, self.frame.size.width, self.frame.size.height))
        wordsMaskView.backgroundColor = UIColor(red: 0, green:0, blue: 0, alpha: 0.3)
        
        self.items.reserveCapacity(self.itemsTitle.count)
        for index:Int in 1...self.itemsTitle.count {
            let label = UILabel()
            label.frame = CGRectMake(self.itemWidth*(CGFloat(index)-1), 0, self.itemWidth, self.frame.size.height)
            label.text = "\(self.itemsTitle[index-1])"
            label.font = UIFont(name: "Arial", size: 16.0)
            label.textAlignment = NSTextAlignment.Center
            label.backgroundColor = UIColor.clearColor()
            self.items.append(label)
            wordsMaskView.addSubview(label)
        }
        self.maskView = wordsMaskView
        self.swimmingView = UIView(frame: CGRectMake(0, 0, self.itemWidth, self.frame.size.height))
        self.swimmingView?.backgroundColor = CollectionViewBarConfig.HeaderBarWordsColor
        self.addSubview(self.swimmingView!)

        if let scrollView = self.scrollView {
            scrollView.addObserver(self, forKeyPath: "contentOffset", options: NSKeyValueObservingOptions.New, context: nil)
        }
        
    }
    
    func updatePosition(index:Int){
        
        if self.itemIndex == index { return }
        
        self.itemIndex = index
        
        let leftLimit:Int = Int(ceil(Double(CollectionViewBarConfig.HeaderBarItemNum)/2))
        let rightLimit = self.itemsTitle.count-leftLimit+1
        var offset:CGFloat = 0;
        if index <= leftLimit {
            offset = 0
        }else if index >= rightLimit{
            offset = self.itemWidth*(CGFloat(self.itemsTitle.count)-CGFloat(CollectionViewBarConfig.HeaderBarItemNum))
        }else{
            offset = self.itemWidth*CGFloat(index-leftLimit)
        }
        
        var origin = self.bounds.origin
        origin.x = offset
        
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
               self.bounds.origin = origin
            }) { (true) in
                
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count == 1 {
            if let touch:UITouch = touches.first {
                let Xoffset = touch.locationInView(self).x
                let itemIndex = floor(Xoffset/self.itemWidth)
                self.scrollView?.setContentOffset(CGPointMake(itemIndex*(self.scrollView?.frame.size.width)!, (self.scrollView?.contentOffset.y)! ), animated: false)
            }
        }
        
    }
    
    
}

