//
//  ViewController.swift
//  SearchUI_Kana
//
//  Created by KentarOu on 2016/08/23.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // Data Array
    var dataArray = ["あいう","いうえ","あうえ","あえお","えかき"]
    var displayArray: [String] = [] {
        willSet {
            self.displayArray = []
        }
    }
    
    func resetData() {
        displayArray = dataArray
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetData()
        
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 20
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - UISearchBar Delegate
    
    func searchBar(searchBar: UISearchBar, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(100 * Double(NSEC_PER_MSEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.searchBySearchBarText()
        }
        return true
    }
    
    func searchBySearchBarText() {
        // カタカナ → ひらがな
        let searchText = searchBar.text!.hiraganacaseString
        print(searchText)
        
        if searchText.isEmpty {
            resetData()
        } else {
            displayArray = dataArray.filter({ (value) -> Bool in
                value.containsString(searchText)
            })
        }
        tableView.reloadData()
    }
    
    // MARK: - TableView Delegate & DataSource
    
    // Row Count
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }
    
    // Generate Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = displayArray[indexPath.row]
        return cell
    }
}

// https://github.com/shogo4405/KanaSwift/blob/master/KanaSwift/String%2BExtension.swift
extension String {
    public var hiraganacaseString: String {
        let text:CFMutableStringRef = NSMutableString(string: self) as CFMutableStringRef
        CFStringTransform(text, nil, kCFStringTransformHiraganaKatakana, true)
        return text as String
    }
}