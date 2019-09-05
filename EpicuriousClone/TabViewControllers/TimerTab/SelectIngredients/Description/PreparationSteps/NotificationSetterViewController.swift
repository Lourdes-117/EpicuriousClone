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
    @IBOutlet weak var playButton: UIButton!
    let stickyView:UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(white: 0, alpha: 0.5)
        button.addTarget(self, action: #selector(onClickStickyButton), for: .touchUpInside)
        return button
    }()

    var recipeImageToSet:UIImage!
    var minutesToCook:Int!
    var secondsToCook:Int!
    var recipeNameToSet:String!
    var recipeProcedureArray:[(String,String)]!
    var isNotificationRequested:Bool = true
    let segueIdentifier:String = "showProcedureSegueIdentifier"

    @IBOutlet var backgroundUIView: UIView!
    let notificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Notification Timer View Loaded")
        setNotification()
        initializeScreen()
        initializeNotification()
        initializeButtons()
    }

    fileprivate func createSticky() {
        stickyView.frame = CGRect(x: (UIApplication.shared.keyWindow?.frame.width)!-50, y: (UIApplication.shared.keyWindow?.frame.height)!/2, width: 50, height: 50)
        stickyView.layer.cornerRadius = stickyView.frame.height/2
//        stickyView.window?.windowLevel = UIWindow.Level.alert
//        view.addSubview(stickyView)
        UIApplication.shared.keyWindow!.addSubview(stickyView)
    }

    fileprivate func initializeScreen() {
        let minutesString:String = String(format: "%02d", minutesToCook)
        let secondsString:String = String(format: "%02d", secondsToCook)
        recipeCookingTime.text = "\(minutesString):\(secondsString)"
        recipeImage.image = recipeImageToSet
        recipeName.text = recipeNameToSet
    }

    fileprivate func initializeButtons() {
        buttons.forEach { (button) in
            button.layer.cornerRadius = button.frame.height/2
        }
        if isNotificationRequested {
            playButton.setImage(UIImage(named: Constants.HomeTab.PAUSE_ICON), for: .normal)
        } else {
            playButton.setImage(UIImage(named: Constants.HomeTab.PLAY_FILLED_ICON), for: .normal)
        }
    }

    fileprivate func initializeNotification() {
        notificationCenter.requestAuthorization(options: [.alert, .sound]) { (isGranted, error) in
            if isGranted {
                print("Notification permission is granted")
            } else {
                print("Notification permission not granted")
            }
        }
        notificationCenter.getPendingNotificationRequests { (requestedNotifications) in
            DispatchQueue.main.async { [weak self] in
                if requestedNotifications.count > 0 {
                    self!.isNotificationRequested = true
                    self!.playButton.setImage(UIImage(named: Constants.HomeTab.PAUSE_ICON), for: .normal)
                } else {
                    self!.isNotificationRequested = false
                    self!.playButton.setImage(UIImage(named: Constants.HomeTab.PLAY_FILLED_ICON), for: .normal)
                }
            }

        }
    }

    fileprivate func setNotification() {
        createSticky()
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
        if(isNotificationRequested) {
            UIApplication.shared.keyWindow!.willRemoveSubview(stickyView)
            print("Notification Removed")
            notificationCenter.removeAllPendingNotificationRequests()
            playButton.setImage(UIImage(named: Constants.HomeTab.PLAY_FILLED_ICON), for: .normal)
        } else {
            createSticky()
            print("Notification Requested")
            setNotification()
            playButton.setImage(UIImage(named: Constants.HomeTab.PAUSE_ICON), for: .normal)
        }
        isNotificationRequested = !isNotificationRequested
    }

    @objc public func onClickStickyButton() {
        print("Sticky Button Tapped")
    }

    @IBAction func onClickStopButton(_ sender: Any) {
        createAlertForDeletionConfirmation()
    }

    fileprivate func createAlertForDeletionConfirmation(){
        let title:String = "Stop Timer"
        let message:String = "Are you sure you want to stop the timer?"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = "Cancel"
        let stop = "Stop"
        let cancelButton:UIAlertAction  = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        let deleteButton:UIAlertAction = UIAlertAction(title: stop, style: .default) { (button) in
            print("Notification Removed")
            self.notificationCenter.removeAllPendingNotificationRequests()
            self.isNotificationRequested = false
            self.playButton.setImage(UIImage(named: Constants.HomeTab.PLAY_FILLED_ICON), for: .normal)
        }
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        self.present(alert, animated: true,completion: nil)
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
