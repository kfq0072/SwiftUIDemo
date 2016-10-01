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
    
    func UIRect(_ param:UIView)->CGFloat{
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
        return UIScreen.main.bounds
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "BaseUI"
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.camera, target:self , action: #selector(ViewController.carmaFunc(_:)))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        /**
            UIlabel
        **/
        let label = UILabel(frame: CGRect(x: UIRectX(), y: UIRectY()+40, width: screenBounds().width/2,height: 30.0))
        label.text="i am a label"
        label.backgroundColor = UIColor.orange
        label.textAlignment = NSTextAlignment.center
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.black
        label.shadowColor = UIColor.gray
        label.shadowOffset = CGSize(width: -20, height: 30)
        //省略方式
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
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
        button.frame = CGRect(x: UIRectX(), y: UIRect(label), width: label.frame.width, height: 30.0);
        button.setTitle("button", for: UIControlState())
        button.setTitle("触摸状态", for: UIControlState.highlighted)
        button.setTitle("select", for: UIControlState.selected)
        button.setTitleColor(UIColor.yellow, for: UIControlState.highlighted);
        button.setTitle("禁用状态", for: UIControlState.disabled)
//        button.setImage(UIImage(named:"0.jpg"), forState: UIControlState.Normal)
        button.setBackgroundImage(UIImage(named:"buttonImage.jpg"),for:UIControlState())
        button .addTarget(self, action:#selector(ViewController.tapped(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        /**
            UItTextField
        **/
        
        let textField = UITextField(frame: CGRect(x: 10, y: UIRect(button), width: screenBounds().size.width/2, height: 30))
        textField.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(textField)
        textField.placeholder = "please in your name"
        textField.returnKeyType = UIReturnKeyType.go
        //代理
        textField.delegate = self;
        
        
        /**
            UISwitch
        **/
        let mySwitch = UISwitch(frame: CGRect(x: 10, y: UIRect(textField), width: 200, height: 20))
        self.view.addSubview(mySwitch)
        
        
        /**
            UISegmentedControl
        **/
        let obj = UIImage(named: "buttonImage.jpg")
        let items = ["选项1", "选项2", "选项3"]
        let seg = UISegmentedControl(items: items)
        seg.frame = CGRect(x: 10, y: UIRect(mySwitch), width: screenBounds().width/3, height: 30)
        seg.selectedSegmentIndex = 2
        seg.setTitle("重新设置", forSegmentAt: 1)
        seg.setBackgroundImage(obj, for: UIControlState(), barMetrics: UIBarMetrics.default)
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
        let slider = UISlider(frame: CGRect(x: 10, y: UIRect(imageView), width: screenBounds().width/2, height: 20))
        self.view.addSubview(slider)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 20
        slider.maximumTrackTintColor = UIColor.red
        slider.minimumTrackTintColor = UIColor.green
        slider.setThumbImage(img1, for: UIControlState())
//        slider.maximumValueImage = UIImage(named: "1.png")
//        slider.minimumValueImage = UIImage(named: "2.png")
        
        /**
            UIActionSheet
        **/
        actSheet = UIActionSheet()
        actSheet.addButton(withTitle: "Cancel")
        actSheet.addButton(withTitle: "action1")
        actSheet.addButton(withTitle: "action2")
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
        pickerView.frame = CGRect(x: 10, y: UIRect(slider), width: screenBounds().width-20, height: 80)
        self.view.addSubview(pickerView)
        
        let pickButton = UIButton(frame: CGRect(x: 10, y: UIRect(pickerView), width: screenBounds().width/2, height: 30))
        pickButton.setTitle("choose", for: UIControlState())
        pickButton.addTarget(self, action: #selector(ViewController.pickChoose), for: UIControlEvents.touchUpInside)
        self.view.addSubview(pickButton)
        pickButton.backgroundColor = UIColor.red
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func carmaFunc(_ sender:NSObject){
        print("//TODO:调用摄像头")
    }
    //MARK:- buttonMothed
    func tapped(_ button:UIButton){
        print("you did me\n")
        print(button.title(for: UIControlState()))
        actSheet.show(in: self.view)
    }
    func pickChoose(){
        let alertView = UIAlertView()
        alertView.title = "you choose relsute:"
        let myStr = "\(pickerView.selectedRow(inComponent: 0))"+"-"+"\(pickerView.selectedRow(inComponent: 1))"+"-"+"\(pickerView.selectedRow(inComponent: 2))"
        alertView.message = myStr
        alertView.addButton(withTitle: "OK")
        alertView.addButton(withTitle: "Cancel")
        alertView.addButton(withTitle: "Hi")
        alertView.delegate = self
        alertView .show()
    }
    
    //MARK:- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textField.text)
        return true
    }
    
    //MARK:- UIActionSheetDelegate
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int){
        if actionSheet.tag == 100{
            let str : String = "\(buttonIndex)"//整型转字符串
            print("you tap: "+str)
        }
    }
    
    //MARK:- UIPickerViewDataSource
    // returns the number of 'columns' to display.
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 8
    }
    //MARK:- UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50.0
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
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
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        let imageView2 = UIImageView()
        var image:UIImage!
        var strImage : String!
        strImage = String(component)+".jpg"
        image = UIImage(named: strImage)
        imageView2.image = image
         return imageView2
    }
    
    //MARK:- UIAlertViewDelegate
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        print(buttonIndex)
    }

}

