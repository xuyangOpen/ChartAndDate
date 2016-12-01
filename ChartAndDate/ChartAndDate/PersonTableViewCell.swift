//
//  PersonTableViewCell.swift
//  ChartAndDate
//
//  Created by 徐杨 on 2016/12/1.
//  Copyright © 2016年 H&X. All rights reserved.
//

import UIKit

typealias talkClosure = (Person) -> Void

class PersonTableViewCell: UITableViewCell {

    var btn = UIButton()
    var person:Person!
    var talk:talkClosure?
    
    func setValuesForLabel(person:Person){
        self.person = person
        self.textLabel?.text = person.name
        self.detailTextLabel?.text = person.pet.petName
        
        self.btn.frame = CGRect.init(x: self.contentView.bounds.width - 120, y: 7, width: 100, height: 30)
        self.btn.setTitle("宠物说话", for: .normal)
        self.btn.setTitleColor(UIColor.black, for: .normal)
        self.btn.addTarget(self, action: #selector(petBark), for: .touchUpInside)
        self.contentView.addSubview(self.btn)
    }
    
    func petBark(){
        if self.talk != nil {
            self.talk!(person)
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
