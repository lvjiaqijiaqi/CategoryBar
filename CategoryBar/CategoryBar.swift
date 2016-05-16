//
//  CategoryBar.swift
//  CategoryBar
//
//  Created by lvjiaqi on 16/5/15.
//  Copyright © 2016年 lvjiaqi. All rights reserved.
//

import UIKit


class CategoryBar: UIScrollView {
    
    var displayViewArr:Set<Int> = []
    var headerBarView:HeaderBarView?
    var viewTitles:[String]?
    
    var viewItems:[UIView]?{
        didSet{
            for index in 0...self.viewItems!.count-1{
                viewItems?[index].frame.origin = CGPointMake(self.itemWidth*CGFloat(index), CollectionViewBarConfig.HeaderBarHeight)
                viewItems?[index].frame.size = CGSizeMake(self.frame.size.width, self.frame.size.height)
                viewItems?[index].tag = index
            }
            displayViewArr.insert(0)
            self.contentSize = CGSizeMake(self.itemWidth*CGFloat(self.viewItems!.count), self.frame.size.height)
        }
    }
    var itemWidth:CGFloat = 0
    
    
    convenience init(frame: CGRect , views:[UIView] , titles:[String]) {
           self.init(frame: frame)
           self.itemWidth = frame.size.width
           self.bounces = false
           self.delegate = self
           self.directionalLockEnabled = true
           self.pagingEnabled = true
           self.viewTitles = titles
           self.viewItems = views
           self.initViews()
           self.initHeaderView()
        
    }
    
    override init(frame: CGRect) {
         super.init(frame: frame)
    }
 
    
    func initViews(){
        for index in 0...self.viewItems!.count-1{
            viewItems?[index].frame.origin = CGPointMake(self.itemWidth*CGFloat(index), CollectionViewBarConfig.HeaderBarHeight)
            viewItems?[index].frame.size = CGSizeMake(self.frame.size.width, self.frame.size.height)
            viewItems?[index].tag = index
        }
        displayViewArr.insert(0)
        self.addSubview(viewItems![0])
        
        self.contentSize = CGSizeMake(self.itemWidth*CGFloat(self.viewItems!.count), self.frame.size.height)
    }
    
    
    func initHeaderView(){
        
        self.headerBarView = HeaderBarView()
        self.headerBarView!.itemsTitle = self.viewTitles!
        
        if viewItems!.count > CollectionViewBarConfig.HeaderBarItemNum {
            self.headerBarView!.itemWidth = self.frame.size.width/CGFloat(CollectionViewBarConfig.HeaderBarItemNum)
        }else {
            self.headerBarView!.itemWidth = self.frame.size.width/CGFloat(viewItems!.count)
        }
        
        self.headerBarView!.frame = CGRectMake(0, 0, self.frame.size.width ,CollectionViewBarConfig.HeaderBarHeight)
        
        self.headerBarView!.bounds = CGRectMake(0, 0, self.headerBarView!.itemWidth*CGFloat(viewItems!.count), CollectionViewBarConfig.HeaderBarHeight)
        
        self.addSubview(self.headerBarView!)
        
        self.headerBarView!.initConponent()

     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



extension CategoryBar:UIScrollViewDelegate{
    
}



extension CategoryBar{

    internal override func layoutSubviews() {

        let Xoffset = self.contentOffset.x
        let preIndex = Int(floor(Xoffset/self.itemWidth))
        var displaySets:Set<Int> = [preIndex]
        
        let scrollProgress = (Xoffset%self.itemWidth)/self.itemWidth
        
        if  scrollProgress != 0  {
              displaySets.insert(preIndex+1)
              self.viewItems?[preIndex].alpha = 1-scrollProgress
              self.viewItems?[preIndex+1].alpha = scrollProgress
        }else{
             self.viewItems?[preIndex].alpha = 1
             self.headerBarView?.updatePosition(preIndex+1)
        }
        let shouldAddToViews:Set<Int> = displaySets.subtract(self.displayViewArr)
        for x in shouldAddToViews {
            self.addSubview((self.viewItems?[x])!)
        }
        let shouldRemoveToViews:Set<Int> = self.displayViewArr.subtract(displaySets)
        for x in shouldRemoveToViews {
            self.viewItems?[x].removeFromSuperview()
        }
        self.displayViewArr = displaySets
        
    }
    
    
}