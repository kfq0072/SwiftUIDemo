//
//  CoreMotionViewController.swift
//  UISwift
//
//  Created by huangshuimei on 16/9/24.
//  Copyright © 2016年 huangshuimei. All rights reserved.
//

import UIKit
import CoreMotion

class CoreMotionViewController: UIViewController {
    var ballView:UIImageView!
    var speedX:UIAccelerationValue = 0
    var speedY:UIAccelerationValue = 0
    var motionManager = CMMotionManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image:UIImage = UIImage(named: "ball")!
        ballView = UIImageView(image: image)
        ballView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        ballView.center = self.view.center
        self.view.addSubview(ballView)
        
        motionManager.accelerometerUpdateInterval = 1.truncatingRemainder(dividingBy: 60)
        
        if  motionManager.isAccelerometerAvailable {
            let queue = OperationQueue.current
            
            motionManager.startAccelerometerUpdates(to: queue!, withHandler: { (acData:CMAccelerometerData?, error:NSError?) -> Void in
                self.speedX += (acData?.acceleration.x)!
                self.speedY += (acData?.acceleration.y)!
                
                var posX = self.ballView.center.x + CGFloat(self.speedX)
                var posY = self.ballView.center.y + CGFloat(self.speedY)
                
                if posX < 0 {
                    posX = 0;
                    self.speedX *= -0.4;
                }else if posX > self.view.bounds.size.width {
                    posX = self.view.bounds.size.width
                    self.speedX *= -0.4;
                }
                
                if posY < 0 {
                    posY = 0
                    self.speedY = 0;
                    
                }else if posY > self.view.bounds.size.height {
                    posY = self.view.bounds.size.height
                    self.speedY *= -0.4
                }
                
                self.ballView.center = CGPoint(x: posX, y: posY)
                
            } as! CMAccelerometerHandler)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        motionManager .stopAccelerometerUpdates()
    }
    
}
