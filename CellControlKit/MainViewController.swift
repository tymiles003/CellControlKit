//
//  MainViewController.swift
//  Forms
//
//  Created by Wendell Antildes M Sampaio on 12/02/2017.
//  Copyright © 2017 Wendell Antildes M Sampaio. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    @IBOutlet var purchaseDatePicker: DatePickerTableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let datePicker = UIDatePicker()
        datePicker.maximumDate = Date()
        datePicker.datePickerMode = .date
        self.purchaseDatePicker.datePicker = datePicker
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
