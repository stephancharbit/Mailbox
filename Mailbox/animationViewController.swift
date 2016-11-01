//
//  animationViewController.swift
//  Mailbox
//
//  Created by Stephan Charbit on 10/25/16.
//  Copyright © 2016 Stephan Charbit. All rights reserved.
//

import UIKit



class animationViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var messageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var leftIcon: UIImageView!
    @IBOutlet weak var rightIcon: UIImageView!
    @IBOutlet weak var rescheduleView: UIView!
    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var feedView: UIImageView!
    
    var rightIconStartingX: CGFloat!
    var leftIconStartingX: CGFloat!
    var feedStartingY: CGFloat!
    
    var messageOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 375, height: 1700)
        scrollView.delegate = self
        // Do any additional setup after loading the view.
        rightIconStartingX = rightIcon.center.x
        leftIconStartingX = leftIcon.center.x
        leftIcon.alpha = 0.5
        rightIcon.alpha = 0.5
        listView.alpha = 0
        rescheduleView.alpha = 0
        feedStartingY = feedView.center.y
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resetAll(_ sender: AnyObject) {
        self.messageView.backgroundColor = UIColor.lightGray
        self.messageImageView.center = self.messageOriginalCenter
        self.leftIcon.center.x = self.leftIconStartingX
        self.rightIcon.center.x = self.rightIconStartingX
        self.leftIcon.alpha = 0.5
        self.rightIcon.alpha = 0.5
        UIView.animate(withDuration:0.5, delay:0.0, options:[] ,
                       animations: { () -> Void in
                        self.messageView.alpha = 1
                        self.feedView.center.y = self.feedStartingY
            }, completion: nil)
        feedView.center.y = feedStartingY
    }
    
    func hideMessage(){
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.messageView.alpha = 0
            }, completion: nil)
        UIView.animate(withDuration:0.6, delay: 0.2, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.1, options:[] ,
                       animations: { () -> Void in
                        self.feedView.center.y -= 100
            }, completion: nil)
    }
    
    func resetMessage(){
        leftIcon.image = #imageLiteral(resourceName: "archive_icon")
        rightIcon.image = #imageLiteral(resourceName: "later_icon")
        UIView.animate(withDuration:0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options:[] ,
                       animations: { () -> Void in
                        self.messageView.backgroundColor = UIColor.lightGray
                        self.messageImageView.center = self.messageOriginalCenter
                        self.leftIcon.center.x = self.leftIconStartingX
                        self.rightIcon.center.x = self.rightIconStartingX
                        self.leftIcon.alpha = 0.5
                        self.rightIcon.alpha = 0.5
                        self.messageView.alpha = 1
            }, completion: nil)
    }
    
    func showRescheduleOptions(){
        self.messageView.backgroundColor = UIColor(red:0.98, green:0.75, blue:0.23, alpha:1.0)
        leftIcon.alpha = 0
        rightIcon.alpha = 0
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.messageImageView.center.x = -190
                        self.rescheduleView.alpha = 1
            }, completion: nil)
        
    }
    
    @IBAction func hideReschedule(_ sender: AnyObject) {
        UIView.animate(withDuration:0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options:[] ,
                       animations: { () -> Void in
                        self.rescheduleView.alpha = 0
            }, completion: nil)
        hideMessage()
    }
    
    func showListOptions(){
        self.messageView.backgroundColor = UIColor(red:0.58, green:0.38, blue:0.18, alpha:1.0)
        leftIcon.alpha = 0
        rightIcon.alpha = 0
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.messageImageView.center.x = -190
                        self.listView.alpha = 1
            }, completion: nil)
    }
    
    @IBAction func hideList(_ sender: AnyObject) {
        UIView.animate(withDuration:0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options:[] ,
                       animations: { () -> Void in
                        self.listView.alpha = 0
            }, completion: nil)
        hideMessage()
    }
    
    func archiveMessage(){
        self.messageView.backgroundColor = UIColor(red:0.15, green:0.65, blue:0.36, alpha:1.0)
        leftIcon.alpha = 0
        rightIcon.alpha = 0
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.messageImageView.center.x = 590
                        //self.listView.alpha = 1
            }, completion: nil)
        UIView.animate(withDuration:0.6, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options:[] ,
                       animations: { () -> Void in
                        self.messageView.alpha = 0
                        self.feedView.center.y -= 100
            }, completion: nil)
    }
    
    func deleteMessage(){
        self.messageView.backgroundColor = UIColor(red:0.85, green:0.12, blue:0.09, alpha:1.0)
        leftIcon.alpha = 0
        rightIcon.alpha = 0
        UIView.animate(withDuration:0.3, delay: 0, options:[] ,
                       animations: { () -> Void in
                        self.messageImageView.center.x = 590
                        //self.listView.alpha = 1
            }, completion: nil)
        UIView.animate(withDuration:0.6, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.6, options:[] ,
                       animations: { () -> Void in
                        self.messageView.alpha = 0
                        self.feedView.center.y -= 100
            }, completion: nil)
    }
    
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        messageView.backgroundColor = UIColor.lightGray
        //var velocity = sender.velocity(in: view)
        var rIconXPosition: CGFloat
        var lIconXPosition: CGFloat
        if sender.state == .began
        {
            messageOriginalCenter = messageImageView.center
        } else if sender.state == .changed
        {
            let translation = sender.translation(in: self.messageView)
            //let messageCenter = messageImageView.center.x
            //print("translation is: ", translation)
            self.messageView.backgroundColor = UIColor.lightGray
            messageImageView.center = CGPoint(x: messageOriginalCenter.x + translation.x, y: messageOriginalCenter.y)
            if translation.x < 0 && translation.x >= -60 {
                //EXPOSE LATER ICON
                let opacity = convertValue(inputValue: CGFloat(translation.x), r1Min: 0, r1Max: -60, r2Min: 0, r2Max: 1)
                rightIcon.alpha = opacity
            }
            if translation.x < -60  && translation.x > -260 {
                //LATER ICON
                self.messageView.backgroundColor = UIColor(red:0.98, green:0.75, blue:0.23, alpha:1.0)
                let difference = (translation.x + 60)
                rIconXPosition = rightIconStartingX + difference
                rightIcon.image = #imageLiteral(resourceName: "later_icon")
                rightIcon.center.x = rIconXPosition
                rightIcon.alpha = 1
            }
            if translation.x <= -260 {
                //LIST ICON
                self.messageView.backgroundColor = UIColor(red:0.58, green:0.38, blue:0.18, alpha:1.0)
                let difference = (translation.x + 60)
                rIconXPosition = rightIconStartingX + difference
                rightIcon.center.x = rIconXPosition
                rightIcon.image = #imageLiteral(resourceName: "list_icon")
            }
            if translation.x > 0 && translation.x  < 60 {
                //EXPOSE ARCHIVE ICON
                let opacity = convertValue(inputValue: CGFloat(translation.x), r1Min: 0, r1Max: 60, r2Min: 0, r2Max: 1)
                leftIcon.alpha = opacity
            }
            if translation.x >= 60 && translation.x < 260{
                self.messageView.backgroundColor = UIColor(red:0.15, green:0.65, blue:0.36, alpha:1.0)
                let difference = (translation.x - 60)
                lIconXPosition = leftIconStartingX + difference
                leftIcon.center.x = lIconXPosition
                leftIcon.alpha = 1
                leftIcon.image = #imageLiteral(resourceName: "archive_icon")
            }
            if translation.x >= 260 {
                self.messageView.backgroundColor = UIColor(red:0.85, green:0.12, blue:0.09, alpha:1.0)
                let difference = (translation.x - 60)
                lIconXPosition = leftIconStartingX + difference
                leftIcon.center.x = lIconXPosition
                leftIcon.image = #imageLiteral(resourceName: "delete_icon")
            }
        }
        else if sender.state == .ended {
            let translation = sender.translation(in: self.messageView)
            if translation.x >= 60 && translation.x < 260{
                archiveMessage()
            }
            if translation.x >= 260 {
                deleteMessage()
            }
            if translation.x < -60  && translation.x > -260{
                showRescheduleOptions()
            }
            if translation.x <= -260 {
                showListOptions()
            } else if translation.x > -60 && translation.x < 60 {
                resetMessage()
            }
        }
    }
    
}
