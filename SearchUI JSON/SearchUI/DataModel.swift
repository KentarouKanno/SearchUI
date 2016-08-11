//
//  DataModel.swift
//  SearchUI
//
//  Created by Kentarou on 2016/08/05.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import Foundation

class DataModel {
    
    var word        : String = ""
    var detailInfo  : String = ""
    var relationWord: String = ""
    var isShowDetail: Bool = false
    
    init(dict: NSDictionary) {
        word         = dict["word"] as! String
        relationWord = dict["relationWord"] as! String
        detailInfo   = dict["detailInfo"] as! String
    }
    
    init(word: String,relationWord:String, detailInfo: String) {
        self.word = word
        self.relationWord = relationWord
        self.detailInfo = detailInfo
    }
    
    class func createData() -> [DataModel] {
        
        var resultArray :[DataModel] = []
        resultArray.append(DataModel(word: "新宿", relationWord: "新宿,新宿三丁目,伊勢丹",  detailInfo: "新宿 - 詳細情報、新宿 - 詳細情報、新宿 - 詳細情報、新宿 - 詳細情報、新宿 - 詳細情報、"))
        resultArray.append(DataModel(word: "新橋", relationWord: "新橋,おじさん,サラリーマン,SL", detailInfo: "新橋 - 詳細情報、新橋 - 詳細情報、"))
        resultArray.append(DataModel(word: "原宿", relationWord: "原宿,fashion,竹下通り", detailInfo: "原宿 - 詳細情報"))
        resultArray.append(DataModel(word: "渋谷", relationWord: "渋谷,fashion,ブランド,109,道玄坂", detailInfo: "渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報、渋谷 - 詳細情報"))
        resultArray.append(DataModel(word: "新宿三丁目", relationWord: "新宿三丁目,伊勢丹", detailInfo: "新宿三丁目 - 詳細情報、新宿三丁目 - 詳細情報、新宿三丁目 - 詳細情報、新宿三丁目 - 詳細情報、"))
        resultArray.append(DataModel(word: "目黒", relationWord: "目黒,中目黒,目黒雅叙園", detailInfo: "目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、目黒 - 詳細情報、"))
        resultArray.append(DataModel(word: "恵比寿", relationWord: "恵比寿,Ebisu,ビール", detailInfo: "恵比寿 - 詳細情報、恵比寿 - 詳細情報、恵比寿 - 詳細情報、恵比寿 - 詳細情報、"))
        resultArray.append(DataModel(word: "代々木", relationWord: "代々木,代々木公園,代々木八幡,代々木ゼミナール", detailInfo: "代々木 - 詳細情報"))
        resultArray.append(DataModel(word: "神泉", relationWord: "神泉", detailInfo: "神泉 - 詳細情報、神泉 - 詳細情報、神泉 - 詳細情報、"))
        resultArray.append(DataModel(word: "武蔵小杉", relationWord: "武蔵小杉", detailInfo: "武蔵小杉 - 詳細情報"))
        resultArray.append(DataModel(word: "武蔵中原", relationWord: "武蔵中原", detailInfo: "武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報、武蔵中原 − 詳細情報"))
        resultArray.append(DataModel(word: "武蔵溝ノ口", relationWord: "武蔵溝ノ口", detailInfo: "武蔵溝ノ口 - 詳細情報"))
        resultArray.append(DataModel(word: "武蔵新城", relationWord: "武蔵新城", detailInfo: "武蔵新城 - 詳細情報"))
        resultArray.append(DataModel(word: "溝の口", relationWord: "溝の口,武蔵溝ノ口", detailInfo: "溝の口 - 詳細情報"))
        resultArray.append(DataModel(word: "幡ヶ谷", relationWord: "幡ヶ谷", detailInfo: "幡ヶ谷 - 詳細情報"))
        resultArray.append(DataModel(word: "代々木八幡", relationWord: "代々木八幡", detailInfo: "代々木八幡 - 詳細情報"))
        resultArray.append(DataModel(word: "代々木公園", relationWord: "代々木公園", detailInfo: "代々木公園 - 詳細情報"))
        resultArray.append(DataModel(word: "明大前", relationWord: "明大前,明治大学", detailInfo: "明大前 - 詳細情報"))
        resultArray.append(DataModel(word: "南新宿", relationWord: "南新宿,新宿", detailInfo: "南新宿 - 詳細情報"))
        resultArray.append(DataModel(word: "参宮橋", relationWord: "参宮橋,明治神宮", detailInfo: "参宮橋 - 詳細情報"))

        return resultArray
    }
}