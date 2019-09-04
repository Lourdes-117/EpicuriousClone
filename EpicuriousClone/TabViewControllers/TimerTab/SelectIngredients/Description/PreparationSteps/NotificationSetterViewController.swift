//
//  NotificationSetterViewController.swift
//  EpicuriousClone
//
//  Created by Tringapps on 04/09/19.
//  Copyright © 2019 Tringapps. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationSetterViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeCookingTime: UILabel!
    @IBOutlet var buttons: [UIButton]!

    var recipeImageToSet:UIImage!
    var minutesToCook:Int!
    var secondsToCook:Int!
    var recipeNameToSet:String!
    var recipeProcedureArray:[(String,String)]!
    let segueIdentifier:String = "showProcedureSegueIdentifier"

    let notificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Notification Timer View Loaded")
        initializeScreen()
        applyDesigns()
        initializeNotification()
    }

    fileprivate func initializeScreen() {
        let minutesString:String = String(format: "%02d", minutesToCook)
        let secondsString:String = String(format: "%02d", secondsToCook)
        recipeCookingTime.text = "\(minutesString):\(secondsString)"
        recipeImage.image = recipeImageToSet
        recipeName.text = recipeNameToSet
    }

    fileprivate func applyDesigns() {
        buttons.forEach { (button) in
            button.layer.cornerRadius = button.frame.height/2
        }
    }

    fileprivate func initializeNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (isGranted, error) in
            if isGranted {
                print("Permission is granted")
            } else {
                print("Permission not granted")
            }
        }
    }

    fileprivate func setNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Done"
        content.body = "Your Recipe Is Ready"
        let totalSecondsToCook = minutesToCook*60 + secondsToCook
        let triggerDate = Date().addingTimeInterval(TimeInterval(totalSecondsToCook))
        let triggerDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: triggerDate)
        let notificationTrigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: false)
        let notificationId = UUID().uuidString
        let notificationRequest = UNNotificationRequest(identifier: notificationId, content: content, trigger: notificationTrigger)
        notificationCenter.add(notificationRequest) { (error) in
            guard let errorUnwrapped = error else{return}
            print("There is an error in Notification Center", errorUnwrapped)
        }
    }

    @IBAction func onClickPlayOrPauseButton(_ sender: Any) {
        setNotification()
    }

    @IBAction func onClickStopButton(_ sender: Any) {
    }

    @IBAction func onClickProcedureButton(_ sender: Any) {
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let preparationStepsViewController = segue.destination as? PreparationStepsViewController {
            preparationStepsViewController.recipeProcedureArray = recipeProcedureArray
            preparationStepsViewController.recipeNameString = recipeNameToSet
        }
    }

    deinit {
        print("Notification Timer View Safe From Memory Leaks")
    }
}
