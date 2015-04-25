//
//  ViewController.swift
//  ExtendHead
//
//  Created by Vincent on 2015/4/19.
//  Copyright (c) 2015年 Vincent. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {

    var header:CExpandHeader!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var customView = UIView(frame: CGRectMake(0, 0, 320, 180))
        var imageView = UIImageView(frame: CGRectMake(0, 0, 320, 180))
        imageView.image = UIImage(named: "image")
        customView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        //关键步骤 设置可变化背景view属性
        
        imageView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        imageView.clipsToBounds = true
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        customView.addSubview(imageView)
        
        var label = UILabel(frame: CGRectMake(0, 0, 320, 30))
            label.text = "自定義頭"
        
        label.textColor = UIColor.redColor()
        customView.addSubview(label)
        
        header = CExpandHeader.expandWithScrollView(self.tableView, expandView: customView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("MyCell") as! UITableViewCell
        
        cell.textLabel!.text = "BB"
        
        return cell
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
}

