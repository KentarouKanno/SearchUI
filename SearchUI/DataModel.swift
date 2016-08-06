//
//  DataModel.swift
//  SearchUI
//
//  Created by Kentarou on 2016/08/05.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation

class DataModel {
    
    var word:String!
    var detailInfo: String!
    var isShowDetail : Bool = false
    
    init(word: String, detailInfo: String) {
        self.word = word
        self.detailInfo = detailInfo
    }
    
    class func createData() -> [DataModel] {
        
        var resultArray :[DataModel] = []
        resultArray.append(DataModel(word: "新宿", detailInfo: "新宿 - 詳細情報、新宿 - 詳細情報、新宿 - 詳細情報、新宿 - 詳細情報、新宿 - 詳細情報、"))
        resultArray.append(DataModel(word: "新橋", detailInfo: "新橋 - 詳細情報、新橋 - 詳細情報、"))
        resultArray.append(DataModel(word: "原宿", detailInfo: "原宿 - 詳細情報"))
        resultArray.append(DataModel(word: "渋谷", detailInfo: "渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報"))
        resultArray.append(DataModel(word: "新宿三丁目", detailInfo: "新宿三丁目 - 詳細情報、新宿三丁目 - 詳細情報、新宿三丁目 - 詳細情報、新宿三丁目 - 詳細情報、"))
        resultArray.append(DataModel(word: "目黒", detailInfo: "目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、"))
        resultArray.append(DataModel(word: "恵比寿", detailInfo: "恵比寿 - 詳細情報、恵比寿 - 詳細情報、恵比寿 - 詳細情報、恵比寿 - 詳細情報、"))
        resultArray.append(DataModel(word: "代々木", detailInfo: "代々木 - 詳細情報"))
        resultArray.append(DataModel(word: "神泉", detailInfo: "神泉 - 詳細情報、神泉 - 詳細情報、神泉 - 詳細情報、"))
        resultArray.append(DataModel(word: "武蔵小杉", detailInfo: "武蔵小杉 - 詳細情報"))
        resultArray.append(DataModel(word: "武蔵中原", detailInfo: "武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報"))
        resultArray.append(DataModel(word: "武蔵溝ノ口", detailInfo: "武蔵溝ノ口 - 詳細情報"))
        resultArray.append(DataModel(word: "武蔵新城", detailInfo: "武蔵新城 - 詳細情報"))
        resultArray.append(DataModel(word: "溝の口", detailInfo: "溝の口 - 詳細情報"))
        resultArray.append(DataModel(word: "幡ヶ谷", detailInfo: "幡ヶ谷 - 詳細情報"))
        resultArray.append(DataModel(word: "代々木八幡", detailInfo: "代々木八幡 - 詳細情報"))
        resultArray.append(DataModel(word: "代々木公園", detailInfo: "代々木公園 - 詳細情報"))
        resultArray.append(DataModel(word: "明大前", detailInfo: "明大前 - 詳細情報"))
        resultArray.append(DataModel(word: "南新宿", detailInfo: "南新宿 - 詳細情報"))
        resultArray.append(DataModel(word: "参宮橋", detailInfo: "参宮橋 - 詳細情報"))
        
        return resultArray
    }
}