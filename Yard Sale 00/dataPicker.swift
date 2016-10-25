//
//  CustomizeClass.swift
//  Yard Sale 00
//
//  Created by Nick J Cameron on 2016-09-25.
//  Copyright © 2016 Nick J Cameron. All rights reserved.
//

import UIKit
import CoreData

class CustomizeClass: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
 
    var startOrEndDate = 1;
    
    @IBOutlet weak var Scroll0: UIPickerView!
    
  
    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    @IBOutlet weak var DatePicker0: UIDatePicker!
   
    
    var array = ["Today Only", "Today/Tomorrow"];
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let dateStartColor = UIColor(red: 165/255, green: 255/255, blue: 194/255, alpha: 1)
        let dateEndColor = UIColor(red: 255/255, green: 235/255, blue: 229/255, alpha: 1)

        
        DatePicker.backgroundColor = dateStartColor
        DatePicker.setValue(UIColor.black, forKeyPath: "textColor")
        DatePicker.setValue(0.8, forKeyPath: "alpha")
        
        DatePicker0.backgroundColor = dateEndColor
        DatePicker0.setValue(UIColor.black, forKeyPath: "textColor")
        DatePicker0.setValue(0.8, forKeyPath: "alpha")
        
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, H:mm a"
        //dateFormatter.dateStyle = DateFormatter.Style.medium
//        self.StartDate.text = dateFormatter.string(from: DatePicker.date)

        
        
        
        self.Scroll0.dataSource = self;
        self.Scroll0.delegate = self;
        
    
        
    }

   
    

    
    
    
    

    
    @IBAction func datePickerAction(_ sender: AnyObject) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, H:mm a"
        //dateFormatter.dateStyle = DateFormatter.Style.medium
        let strDate = dateFormatter.string(from: DatePicker.date)

//        if(startOrEndDate == 1){
//        self.StartDate.text = strDate
//        }else{
//            self.EndDate.text = strDate
//
//        }
        
    }
    
    
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return array[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1;
    }
}
