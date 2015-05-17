//
//  ViewController.swift
//  DatePickerTimer
//
//  Created by Max Chen on 2015/5/17.
//  Copyright (c) 2015年 Max Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label: UILabel!
    var button: UIButton!
    var datePicker: UIDatePicker!

    var timer: NSTimer!
    var remainTime: Double!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        label = UILabel()
        label.frame = CGRectMake(self.view.frame.width/2 - 200, 80, 400, 50)
        label.textAlignment = NSTextAlignment.Center
        label.text = "0"

        button = UIButton.buttonWithType(.System) as! UIButton
        button.frame = CGRectMake(self.view.frame.width/2 - 200, 50, 400, 50)
        button.setTitle("START", forState: UIControlState.Normal)
        button.addTarget(self, action: "buttonAction", forControlEvents: UIControlEvents.TouchUpInside)


        datePicker = UIDatePicker(frame: CGRectMake(0, self.view.frame.height - 400, self.view.frame.width, 400))

        datePicker.datePickerMode = UIDatePickerMode.CountDownTimer

        datePicker.countDownDuration = 300

        self.view.addSubview(label)
        self.view.addSubview(button)
        self.view.addSubview(datePicker)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func buttonAction() {
        remainTime = datePicker.countDownDuration
        button.enabled = false
        datePicker.enabled = false
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDown", userInfo: nil, repeats:true);
        timer.fire()
    }


    func countDown() {
        if(remainTime < 0){

            timer.invalidate()
            button.enabled = true
            datePicker.enabled = true
            println("END")
        } else {
            println("\(remainTime)")
            label.text = "\(remainTime)"
            remainTime = remainTime - 1
            datePicker.countDownDuration = remainTime
        }
    }


}

