//
//  FoldUnfoldModule.swift
//  ModuleExamples
//
//  Created by Francisco Javier Trujillo Mata on 30/11/2018.
//  Copyright © 2018 Francisco Javier Trujillo Mata. All rights reserved.
//

import FTMTableSectionModules

private enum RowType {
    case unfold
    case fold
    case normal
}

class FoldUnfoldModule: TableSectionModule {
    private var fold  : Bool!
    
    override init(tableView: UITableView) {
        fold = true
        super.init(tableView: tableView)
    }
    
    override func registerClassForHeadersFooters() -> [AnyClass] {
        return super.registerClassForHeadersFooters() + [
            UITableViewHeaderFooterView.classForCoder(),
        ]
    }
    
    override func registerClassForCells() -> [AnyClass] {
        return super.registerClassForCells() + [
            UITableViewCell.classForCoder(),
        ]
    }
    
    override func createRows() {
        super.createRows()
        
        if fold == true {
            rows.append(RowType.unfold as AnyObject)
        } else {
            rows.append(RowType.fold as AnyObject)
            rows.append(RowType.normal as AnyObject)
            rows.append(RowType.normal as AnyObject)
            rows.append(RowType.normal as AnyObject)
            rows.append(RowType.normal as AnyObject)
        }
        
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let identifier = String(describing: UITableViewHeaderFooterView.self)
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier:identifier)
        header?.textLabel?.text = "Fold/Unfold module"
        
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let rowType : RowType = rows[indexPath.row] as! RowType
        let identifier = String(describing: UITableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        switch rowType {
        case .unfold:
            cell.textLabel?.text = "Click to unfold"
        case .fold:
            cell.textLabel?.text = "Click to fold"
        default:
            cell.textLabel?.text = "Click to do nothing"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        let rowType : RowType = rows[indexPath.row] as! RowType
        
        switch rowType {
        case .unfold, .fold:
            fold = !fold!
        default: break
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        refreshSection()
    }
}
