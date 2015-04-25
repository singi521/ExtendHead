//
//  CExpandHeader.swift
//  ExtendHead
//
//  Created by Vincent on 2015/4/19.
//  Copyright (c) 2015年 Vincent. All rights reserved.
//

import UIKit

let CExpandContentOffset = "contentOffset"

class CExpandHeader:NSObject,UIScrollViewDelegate {
    var scrollView:UIScrollView!
    var expandView:UIView!
    
    var expandHeight:CGFloat = 0.0
    
    class func expandWithScrollView(scrollView:UIScrollView ,expandView:UIView) -> CExpandHeader {
        var expandHeader:CExpandHeader = CExpandHeader()
        expandHeader.expandWithScrollView(scrollView,expandViewb: expandView)
        return expandHeader
    }
    
    private func expandWithScrollView(scrollView:UIScrollView ,expandViewb:UIView) {
    
    
        expandHeight = CGRectGetHeight(expandViewb.frame);
    
        self.scrollView = scrollView;
        self.scrollView.contentInset = UIEdgeInsetsMake(expandHeight, 0, 0, 0);
        self.scrollView.insertSubview(expandViewb, atIndex:0)
        
        //self.scrollView.addObserver:self forKeyPath:CExpandContentOffset options:NSKeyValueObservingOptionNew context:nil];
        
        self.scrollView.addObserver(self, forKeyPath: CExpandContentOffset, options: NSKeyValueObservingOptions.New, context: nil)
        
        self.scrollView.contentOffset = CGPointMake(0, -180)
    
        self.expandView = expandViewb
    
    //使View可以伸展效果  重要属性
        
        self.expandView.contentMode = UIViewContentMode.ScaleAspectFill
        
        self.expandView.clipsToBounds = true
    
        self.reSizeView()
    
        
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        
        if (keyPath != CExpandContentOffset) {
            return
        }
        self.scrollViewDidScroll(scrollView)
    }
    
    private func scrollViewDidScroll(scrollView:UIScrollView)
    {
    
        var offsetY = scrollView.contentOffset.y
        if(offsetY < expandHeight * -1) {
            var currentFrame = expandView.frame
            currentFrame.origin.y = offsetY;
            currentFrame.size.height = -1*offsetY
            expandView.frame = currentFrame
        }
    }
   
    
    
    private func reSizeView(){
        expandView.frame = CGRectMake(0, -1*expandHeight, CGRectGetWidth(expandView.frame),expandHeight)
    }
}