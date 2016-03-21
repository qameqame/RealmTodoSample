//
//  ToDo.swift
//  RealmTest2
//
//  Created by 亀山裕樹 on 2016/03/20.
//  Copyright © 2016年 Hiroki Kameyama. All rights reserved.
//

import Foundation
import RealmSwift


class ToDo: Object{
    dynamic var name = ""
    dynamic var deadLine = NSDate(timeIntervalSince1970: 0)
    dynamic var isComplete = false
}

