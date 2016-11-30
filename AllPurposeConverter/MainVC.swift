//
//  ViewController.swift
//  AllPurposeConverter
//
//  Created by Grandon Lin on 2016-07-19.
//  Copyright © 2016 Grandon Lin. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    var unitLbl: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func unitBtnPressed(sender: UIButton) {
        unitLbl = sender.currentTitle
        performSegue(withIdentifier: "ConverterVC", sender: unitLbl)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ConverterVC {
            if let title = sender as? String {
                destination.unitTitle = title
            }
        }
    }
}

