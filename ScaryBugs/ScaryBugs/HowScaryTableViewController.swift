//
//  HowScaryTableViewController.swift
//  ScaryBugs
//
//  Created by Aleksandr Pronin on 3/19/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class HowScaryTableViewController: UITableViewController {
    
    //MARK: - Vars
    var bug: ScaryBug?
    
    //MARK: - UITableViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if let scaryFactor = ScaryFactor(rawValue: indexPath.row) {
            bug?.howScary = scaryFactor
        }
        refresh()
    }
    
    //MARK: - Private
    func refresh() {
        for index in 0 ... ScaryFactor.TotalBugs.rawValue {
            let indexPath = NSIndexPath(forRow: index, inSection: 0)
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = bug?.howScary.rawValue == index ? .Checkmark : .None
            
        }
    }
    
}
