//
//  ViewController.swift
//  MySettings
//
//  Created by cis290 on 10/29/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnClear(sender: AnyObject) {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "fullname")
        defaults.setObject(nil, forKey: "address")
        defaults.setObject(nil, forKey: "year")
        
        defaults.synchronize()
        
        fullname.text = ""
        address.text = ""
        yearPicker.selectRow(0,inComponent: 0, animated: true)
        fullname.becomeFirstResponder()
        
    }
    
    
    @IBOutlet weak var fullname: UITextField!
    
    @IBOutlet weak var address: UITextField!

    @IBOutlet weak var yearPicker: UIPickerView!
    
    
    var selectedyear:Int!
    let pickerYear = Array(1940...2020)
    
    @IBAction func btnLoad(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        if let fullameNotNull = defaults.objectForKey("fullname") as? String {
            self.fullname.text = defaults.objectForKey("fullname") as? String
        }
        
        if let addressIsNotNill = defaults.objectForKey("address") as? String {
            self.address.text = defaults.objectForKey("address") as? String
        }
        if let yearIsNotNill = defaults.objectForKey("year") as? Int {
            var yearSelected = defaults.objectForKey("year") as! Int
            let SelectedYear:Int = (pickerYear).indexOf(yearSelected)!
            
            
            
            
            yearPicker.selectRow(yearSelected,inComponent: 0, animated: true)
        }
    }
    
    
    @IBAction func btnSave(sender: UIButton) {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.fullname.text, forKey: "fullname")
        defaults.setObject(self.address.text, forKey: "address")
        defaults.setObject(selectedyear, forKey: "year")
        
        
        defaults.synchronize()
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerYear.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> Int? {
        selectedyear=pickerYear[row]
     
        
        return pickerYear[row]
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches , withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    

}

