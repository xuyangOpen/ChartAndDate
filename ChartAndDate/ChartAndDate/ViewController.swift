//
//  ViewController.swift
//  ChartAndDate
//
//  Created by 徐杨 on 2016/11/30.
//  Copyright © 2016年 H&X. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let myTableView = UITableView()
    var dataSource = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.white
        
        for i in 0...10 {
            dataSource.append("\(i+1)元素")
        }
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.frame = self.view.bounds
        self.view.addSubview(self.myTableView)
        
        
        self.showClsRuntime(cls: PersonTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idetifier") ?? UITableViewCell.init(style: .default, reuseIdentifier: "idetifier")
        
        cell.textLabel?.text = self.dataSource[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("执行origin方法")
    }
    
    func showClsRuntime(cls:AnyClass){
        var methodNum:UInt32 = 0
        let methodList = class_copyMethodList(cls, &methodNum)
        for index in 0..<numericCast(methodNum) {
            let method:Method = methodList![index]!
//            print(String.init(cString: method_getTypeEncoding(method)))
            print("类名" + String.init(describing: method_getName(method)))
        }
        
        var properyNum:UInt32 = 0
        let properyList = class_copyPropertyList(cls, &properyNum)
        for index in 0..<numericCast(properyNum) {
            let property:objc_property_t = properyList![index]!
            print("属性名" + String.init(cString: property_getName(property)))
//            print(String.init(cString: property_getAttributes(property)))
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

