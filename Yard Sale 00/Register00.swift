//
//  Register00.swift
//  Yard Sale 00
//
//  Created by Nick J Cameron on 2016-10-20.
//  Copyright © 2016 Nick J Cameron. All rights reserved.
//

import UIKit

class Register00: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var lblBusiessName: UILabel!
    @IBOutlet weak var lblError: UILabel!

    @IBOutlet weak var txtData: UITextField!
    @IBOutlet weak var btnArrowForward: UIButton!
    @IBOutlet weak var btnArrowBack: UIButton!
    
    var middleLabel = CGPoint();
    let screenSize: CGRect = UIScreen.main.bounds
    var inOrOut = 0;
    var lblText = "Busiess Name";
    var BusinessName = String();
    var BusinessLocation = String();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtData.delegate = self;
        lblError.isHidden = true;
        lblBusiessName.text = "Business Name"
        btnArrowBack.isEnabled = false;
        

        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func slideLabel(labelOne: UILabel){
        labelOne.text = "Business Name is nick";
        labelOne.textColor = UIColor.black

        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: .curveEaseIn, animations: {
            
    
            self.middleLabel = labelOne.center;
            NSLog("this is location" + String(describing: self.middleLabel));
            labelOne.center = CGPoint(x: self.screenSize.maxX + labelOne.frame.maxX, y:self.middleLabel.y )
      
            }, completion:{ finished in self.animationTwo(labelTwo: labelOne)})
        
    };
    
    func animationTwo(labelTwo: UILabel){
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: .curveEaseIn, animations: {
            
            if(self.inOrOut == 0){
       labelTwo.text = "Business Location";
            labelTwo.textColor = UIColor.darkGray
            }
             labelTwo.center = self.middleLabel;
    
            }, completion:nil)
        
    }
  
    @IBAction func BackArrow(_ sender: AnyObject) {
       
        self.inOrOut = 1;
        slideLabel(labelOne: lblBusiessName);


    }
  
    @IBAction func ForwardArrow(_ sender: AnyObject) {
        self.inOrOut = 0;
        if(txtData.text != ""){
        slideLabel(labelOne: lblBusiessName);
            lblError.isHidden = true;
            btnArrowBack.alpha = 1;
            btnArrowBack.isEnabled = true;


        }else{
            lblError.isHidden = false;
        
        }

     
       // txtData.resignFirstResponder()



       
    }
    func checkToSlideInOrOut(checker:Int)-> Int{
        if(checker == 0){
            return 1
        }else{
            return 0;
        }
}//end of function
    
    open func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass the selected object to the new view controller.
    }
    

}
