//
//  FirmwareTableViewController.swift
//  iFW
//
//  Created by George Dan on 31/03/2016.
//  Copyright © 2016 George Dan. All rights reserved.
//

import UIKit

class FirmwareTableViewController: UITableViewController {

	var device: Device!
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return device.firmwares!.count
    }

	
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("detail", forIndexPath: indexPath)

        cell.textLabel?.text = (device.firmwares!.allObjects[indexPath.row] as! Firmware).version
		cell.detailTextLabel?.text = (device.firmwares!.allObjects[indexPath.row] as! Firmware).buildID
		
		if (device.firmwares!.allObjects[indexPath.row] as! Firmware).signed!.boolValue {
			cell.accessoryType = .Checkmark
		}

        return cell
    }
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
	
}
