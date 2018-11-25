//
//  StoriesModule.swift
//  ModuleExamples
//
//  Created by Francisco Javier Trujillo Mata on 25/11/2018.
//  Copyright © 2018 Francisco Javier Trujillo Mata. All rights reserved.
//

import FTMTableSectionModules

class StoriesModule: TableSectionModule {
    override func registerNibsForCells() -> [AnyClass] {
        return super.registerNibsForCells() + [
            StoriesTitleCell.classForCoder()
        ]
    }
    
    override func createRows() {
        super.createRows()
        
        rows.append(String(describing: StoriesTitleCell.self) as AnyObject)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell
        
        cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StoriesTitleCell.self), for: indexPath)
        removeSeparatorInsetForCell(cell, forIndexPath: indexPath)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 30;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
