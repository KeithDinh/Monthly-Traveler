//
//  ViewController.swift
//  Exercise2_Dinh_Kiet
//
//  Created by admin on 9/3/20.
//  Copyright © 2020 Kiet Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var monthArr:[String:String] = [
         "January": "California, Florida",
         "February": "Arizona, Montana",
         "March": "Washington DC, Tennessee",
         "April": "Louisiana",
         "May": "Utah, New York",
         "June": "Nevada, Illinois",
         "July": "Colorado, Massachusetts",
         "August": "Idaho, Wyoming, Montana",
         "September": "New Mexico, Washington",
         "October": "Maine, Vermont, New Hampshire",
         "November": "Texas, Oregon",
         "December": "Montana, Colorado"
         ]
    
    @IBOutlet weak var monthField: UITextField!
    
    
    @IBOutlet weak var outputText: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func checkMonth(_ sender: Any) {
     
        guard monthField.text!.count > 0
          else {
            let alert = UIAlertController(title: "Missing Month!", message: "Please enter the month", preferredStyle: .alert)
            
            // add button in the alert
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true)
            
            return
        }
        if !monthArr.keys.contains(monthField.text!) {
            let alert = UIAlertController(title: "Invalid Month!", message: "Please enter a valid month", preferredStyle: .alert)
            
            // add button in the alert
            alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: { _ in self.dismiss(animated: true, completion: nil)
            }))
            
            self.present(alert, animated: true)
            
            return
        }
        //Best states to visit in November are Texas, Oregon
        if let cityState:String = monthArr[monthField.text!]
        {
            outputText.text = "Best states to visit in \(monthField.text!) are \(cityState)"
        }

    }
    
    @IBAction func selectMonth(_ sender: Any) {
        
               // initialize the alert
        let actionAlert = UIAlertController(title: nil, message: "Pick a month", preferredStyle: .actionSheet)
        let months: [String] = ["January", "February", "March", "April", "May","June","July","August", "September","October","November","December"]
        for month in months {
            // add multiple actions
            actionAlert.addAction(UIAlertAction(title: month, style: .default, handler: { _ in
                if let cityState:String = self.monthArr[month]
                {
                    self.outputText.text = "Best states to visit in \(month) are \(cityState)"
                }
            }))
        }
       // add dismiss alert
       actionAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
           self.dismiss(animated: true, completion: nil)
       }))
       
       
       self.present(actionAlert, animated: true)

    }
    @IBAction func luckyMonth(_ sender: Any) {
        let randomNum = Int .random(in:0...11)
        let index = monthArr.index(monthArr.startIndex, offsetBy: randomNum)

        if let cityState:String = monthArr.values[index]
        {
            outputText.text = "Best states to visit in \(monthArr.keys[index]) are \(cityState)"
        }

    }
}

