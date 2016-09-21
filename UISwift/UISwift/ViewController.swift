//
//  ViewController.swift
//  UISwift
//
//  Created by huangshuimei on 15/4/6.
//  Copyright (c) 2015年 huangshuimei. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate ,UIActionSheetDelegate ,UIPickerViewDelegate ,UIPickerViewDataSource ,UIAlertViewDelegate{
    var imageView : UIImageView!
    var actSheet : UIActionSheet!
    var pickerView : UIPickerView!
    
    func UIRect(param:UIView)->CGFloat{
        var mySize:CGFloat!
        mySize = param.frame.size.height + param.frame.origin.y + UIRectY()

        return mySize
    }
    //定义控件之间的上下间隔
    func UIRectY()->CGFloat{
        return 20.0
    }
    //定义控件x点的长度
    func UIRectX()->CGFloat{
        return 10.0
    }
    //获取屏幕rect
    func screenBounds()->CGRect{
        return UIScreen.mainScreen().bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "BaseUI"
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target:self , action: Selector("carmaFunc:"))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        /**
            UIlabel
        **/
        let label = UILabel(frame: CGRectMake(UIRectX(), UIRectY()+40, screenBounds().width/2,30.0))
        label.text="i am a label"
        label.backgroundColor = UIColor.orangeColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.systemFontOfSize(20)
        label.textColor = UIColor.blackColor()
        label.shadowColor = UIColor.grayColor()
        label.shadowOffset = CGSizeMake(-20, 30)
        //省略方式
        label.lineBreakMode = NSLineBreakMode.ByTruncatingTail
        
        //自动调整
//        label.adjustsFontSizeToFitWidth = true;
        label.numberOfLines = 3;//3行
        self.view.addSubview(label);
        /**
            UIbutton
        **/
        var button:UIButton!
        button = UIButton.init()
//        let button :UIButton = UIButton.buttonWithType(UIButtonType.ContactAdd)as! UIButton;
//        var button = UIButton(frame: CGRectMake(20, label.frame.size.height+20, label.frame.width, label.frame.size.height))
        button.frame = CGRectMake(UIRectX(), UIRect(label), label.frame.width, 30.0);
        button.setTitle("button", forState: UIControlState.Normal)
        button.setTitle("触摸状态", forState: UIControlState.Highlighted)
        button.setTitle("select", forState: UIControlState.Selected)
        button.setTitleColor(UIColor.yellowColor(), forState: UIControlState.Highlighted);
        button.setTitle("禁用状态", forState: UIControlState.Disabled)
//        button.setImage(UIImage(named:"0.jpg"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named:"buttonImage.jpg"),forState:.Normal)
        button .addTarget(self, action:Selector("tapped:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        /**
            UItTextField
        **/
        
        let textField = UITextField(frame: CGRectMake(10, UIRect(button), screenBounds().size.width/2, 30))
        textField.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(textField)
        textField.placeholder = "please in your name"
        textField.returnKeyType = UIReturnKeyType.Go
        //代理
        textField.delegate = self;
        
        
        /**
            UISwitch
        **/
        let mySwitch = UISwitch(frame: CGRectMake(10, UIRect(textField), 200, 20))
        self.view.addSubview(mySwitch)
        
        
        /**
            UISegmentedControl
        **/
        let obj = UIImage(named: "buttonImage.jpg")
        let items = ["选项1", "选项2", "选项3"]
        let seg = UISegmentedControl(items: items)
        seg.frame = CGRectMake(10, UIRect(mySwitch), screenBounds().width/3, 30)
        seg.selectedSegmentIndex = 2
        seg.setTitle("重新设置", forSegmentAtIndex: 1)
        seg.setBackgroundImage(obj, forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
        self.view.addSubview(seg)
        
        
        /**
            UIImageView
        **/
        
        let img = UIImage(named:"1.jpg")    //初始化图片
        imageView = UIImageView(image: img);   //初始化图片View
        imageView.frame.origin = CGPoint(x:10,y:UIRect(seg));   //指定图片显示的位置
        imageView.frame = CGRect(x:0,y:UIRect(seg),width:120,height:120);   //指定图片的位置以及显示的大小
        self.view.addSubview(imageView);
        
        /**
            UISlider
        **/
        let img1 = UIImage(named:"Back.png")    //初始化图片
        let slider = UISlider(frame: CGRectMake(10, UIRect(imageView), screenBounds().width/2, 20))
        self.view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 20
        slider.maximumTrackTintColor = UIColor.redColor()
        slider.minimumTrackTintColor = UIColor.greenColor()
        slider.setThumbImage(img1, forState: UIControlState.Normal)
//        slider.maximumValueImage = UIImage(named: "1.png")
//        slider.minimumValueImage = UIImage(named: "2.png")
        
        /**
            UIActionSheet
        **/
        actSheet = UIActionSheet()
        actSheet.addButtonWithTitle("Cancel")
        actSheet.addButtonWithTitle("action1")
        actSheet.addButtonWithTitle("action2")
        actSheet.cancelButtonIndex = 0
        actSheet.tag = 100
        actSheet.delegate = self
      
        
        /**
            UIPickerView
        **/
        pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
        pickerView.selectRow(0, inComponent: 2, animated: true)
        pickerView.frame = CGRectMake(10, UIRect(slider), screenBounds().width-20, 80)
        self.view.addSubview(pickerView)
        
        let pickButton = UIButton(frame: CGRectMake(10, UIRect(pickerView), screenBounds().width/2, 30))
        pickButton.setTitle("choose", forState: UIControlState.Normal)
        pickButton.addTarget(self, action: "pickChoose", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(pickButton)
        pickButton.backgroundColor = UIColor.redColor()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func carmaFunc(sender:NSObject){
        print("//TODO:调用摄像头")
    }
    //MARK:- buttonMothed
    func tapped(button:UIButton){
        print("you did me\n")
        print(button.titleForState(.Normal))
        actSheet.showInView(self.view)
    }
    func pickChoose(){
        let alertView = UIAlertView()
        alertView.title = "you choose relsute:"
        let myStr = "\(pickerView.selectedRowInComponent(0))"+"-"+"\(pickerView.selectedRowInComponent(1))"+"-"+"\(pickerView.selectedRowInComponent(2))"
        alertView.message = myStr
        alertView.addButtonWithTitle("OK")
        alertView.addButtonWithTitle("Cancel")
        alertView.addButtonWithTitle("Hi")
        alertView.delegate = self
        alertView .show()
    }
    
    //MARK:- UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)
        return true
    }
    
    //MARK:- UIActionSheetDelegate
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int){
        if actionSheet.tag == 100{
            let str : String = "\(buttonIndex)"//整型转字符串
            print("you tap: "+str)
        }
    }
    
    //MARK:- UIPickerViewDataSource
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }
    //MARK:- UIPickerViewDelegate
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("you choose row:"+"\(row) "+"compoent:"+"\(component)")
    }
    //显示文字
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
//        if component == 0 {
//        return String(row)+"-"+String(component)
//        }else if component == 1 {
//        return "NO2"
//        }else{
//        return "NO3"
//        }
//    }
    //显示UIView
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {

        let imageView2 = UIImageView()
        var image:UIImage!
        var strImage : String!
        strImage = String(component)+".jpg"
        image = UIImage(named: strImage)
        imageView2.image = image
         return imageView2
    }
    
    //MARK:- UIAlertViewDelegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        print(buttonIndex)
    }

}

