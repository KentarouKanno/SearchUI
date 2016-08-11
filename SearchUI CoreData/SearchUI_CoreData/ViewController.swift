//
//  ViewController.swift
//  SearchUI
//
//  Created by Kentarou on 2016/08/05.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    
    // 全データ
    var dataArray   : Array<DataModel> = []
    // 検索時表示用データ
    var displayArray: Array<DataModel> = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // APIアクセスしてデータを取得する(現在はBundleのData.json)
        APIManager.downLoadDataAPI { (dataModelArray) -> () in
            
            let dataBaseM = DataBaseManager()
            
            // DataBaseに保存
            for model in dataModelArray! {
                dataBaseM.addCoreData(model)
            }
            
            // DataBaseから読み込み
            if let dataModel = dataBaseM.getAllStation() {
                self.dataArray    = dataModel
                self.displayArray = dataModel
            }
        
            self.tableView.reloadData()
        }
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        searchController.searchBar.delegate = self
    }
    
    // SearchBarに文字列を入力された時に呼ばれる
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        
        if !searchController.searchBar.text!.isEmpty {
            displayArray = dataArray.filter { (value) -> Bool in
                
                var match = false
                // 文字列をカンマ区切りで文字列配列に分割
                let relationWordArray = value.relationWord.componentsSeparatedByString(",")
                
                relationWordArray.forEach({ (word) -> () in
                    // 前方一致で適合した場合True
                    if word.hasPrefix(searchController.searchBar.text!) {
                        match = true
                    }
                })
                
                return match
                
                // 前方一致の場合
                //value.word.hasPrefix(searchController.searchBar.text!)
                
                // 後方一致の場合
                //value.word.hasSuffix(searchController.searchBar.text!)
                
                // 部分一致の場合
                //value.word.lowercaseString.containsString(searchController.searchBar.text!)
            }
            
            tableView.reloadData()
            print("入力文字 = ",searchController.searchBar.text!)
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            displayArray = dataArray
            tableView.reloadData()
        }
    }
    
    @IBAction func searchButton(sender: UIBarButtonItem) {
        // SearchController Setting
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = true
        searchController.searchBar.searchBarStyle = UISearchBarStyle.Prominent
        searchController.searchBar.sizeToFit()
        presentViewController(searchController, animated: true, completion: nil)
    }
    
    // MARK: - TableView Delegate & DataSource
    
    // Row Count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }
    
    // Generate Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomCell
        cell.data = displayArray[indexPath.row]
        return cell
    }
    
    // Select Cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        print("Cell Tap - ",indexPath.row)
        
        displayArray[indexPath.row].isShowDetail = !displayArray[indexPath.row].isShowDetail
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
}