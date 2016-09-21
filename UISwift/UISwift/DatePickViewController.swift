//
//  DatePickViewController.swift
//  UISwift
//
//  Created by huangshuimei on 15/8/15.
//  Copyright (c) 2015年 huangshuimei. All rights reserved.
//

import UIKit

class DatePickViewController: UIViewController,UIAlertViewDelegate {

    @IBOutlet weak var btnShow: UIButton!
    @IBOutlet weak var dpicker: UIDatePicker!
    var stepper:UIStepper!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStepper()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func showClicked(sender: UIButton) {
        let date = dpicker.date;
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        let dateStr = dateFormatter.stringFromDate(date)
        

        //make imageview
        let myImage = UIImage(named: "2.jpg")
        let imageView = UIImageView(image: myImage)
        imageView.frame = CGRectMake(0, 0, 50, 50)
        
        //make alertView
        let alertView = UIAlertView()
        alertView.title = "now date and time"
        alertView.message = dateStr
        alertView.addButtonWithTitle("OK")
        alertView.addButtonWithTitle("NO")
        alertView.setValue(imageView, forKey: "accessoryView")
        alertView.show()
        alertView.delegate = self
    }
    
    
    // MARK: - UIAlertViewDelegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 0 {
            
        }
        
        print("\(buttonIndex)")
    }
    
    // MARK: - UIStepper
    func initStepper(){
        self.stepper = UIStepper.init(frame: CGRectMake(200, 350, 100, 100))
        self.stepper.center = self.view.center;
        self.stepper.maximumValue = 10
        self.stepper.minimumValue = 1
        stepper.value = 3
        stepper.stepValue = 1
        stepper.continuous = true
        stepper.wraps = true
        stepper.addTarget(self, action: "stepperValueChange", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(stepper)
    }
    
    // MARK: - stepperValueChange
    func stepperValueChange(){
        let value = stepper.value
        let valueStr = "\(value)"
        btnShow.setTitle(valueStr, forState: UIControlState.Normal)
    }
}
