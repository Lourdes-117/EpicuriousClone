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
    
    @IBOutlet weak var optionalCancelButtonView: UIView!
    var recipeImageToSet:UIImage!
    var minutesToCook:Int!
    var secondsToCook:Int!
    var recipeNameToSet:String!
    var recipeProcedureArray:[(String,String)]!
    var isNotificationRequested:Bool = true
    let segueIdentifier:String = "showProcedureSegueIdentifier"
    let recipeNameUserDefault:String = "RecipeNameToSetUserDefault"
    weak var timer: Timer?
    var timerDispatchSourceTimer : DispatchSourceTimer?

    @IBOutlet var backgroundUIView: UIView!
    let notificationCenter = UNUserNotificationCenter.current()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Notification Timer View Loaded")
        if(minutesToCook == nil) {
            isNotificationRequested = true
            notificationCenter.getPendingNotificationRequests { (notificationarray) in
                let notification = notificationarray[0]
                let trigger = notification.trigger as! UNCalendarNotificationTrigger
                let triggerRequestedDate = trigger.nextTriggerDate()
                let triggerDateComponents = Calendar.current.dateComponents([.second, .minute, .hour], from: triggerRequestedDate!)
                let todayDateComponents = Calendar.current.dateComponents([.second, .minute, .hour], from: Date())
                self.secondsToCook = abs(triggerDateComponents.second! - todayDateComponents.second!)
                self.minutesToCook = abs(triggerDateComponents.minute! - todayDateComponents.minute!)
                self.recipeNameToSet = UserDefaults.standard.string(forKey: self.recipeNameUserDefault)

                print("Trigger ", triggerDateComponents)
                print("Today ", todayDateComponents)

                DispatchQueue.main.async { [weak self] in
                    self!.initializeTime()
                    self!.initializeNotification()
                    self!.initializeButtons()
                    self!.initializeFloatingButton()
                    self!.initiateLoop()
                    self!.initializeOptionalView()
                }
            }
        } else {
            setNotification()
            initializeScreen()
            initializeNotification()
            initializeButtons()
            initializeFloatingButton()
            initiateLoop()
        }
    }

    fileprivate func initializeOptionalView() {
        guard  let _ = self.navigationController else {
            optionalCancelButtonView.isHidden = false
            optionalCancelButtonView.layer.cornerRadius = 5
            return
        }
    }

    @IBAction func onClickOptionalCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if(self.isNotificationRequested) {
            FloatingButtonController.getInstance().view.isHidden = false
        }
    }

    fileprivate func initiateLoop() {
        timerDispatchSourceTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
        timerDispatchSourceTimer?.schedule(deadline: .now(), repeating: .seconds(1))
        timerDispatchSourceTimer?.setEventHandler{
            if(self.secondsToCook > 0 && self.minutesToCook > 0) {
                self.secondsToCook = self.secondsToCook - 1
            } else if(self.secondsToCook == 0 && self.minutesToCook > 0) {
                self.minutesToCook = self.minutesToCook - 1
                self.secondsToCook = 60
            }
            DispatchQueue.main.async { [weak self] in
                self!.initializeScreen()
                if(self!.minutesToCook == 0 && self!.secondsToCook == 0) {
                    self!.dismiss(animated: true, completion: nil)
                }
            }
        }
        timerDispatchSourceTimer?.resume()
    }

    fileprivate func initializeFloatingButton() {
        let floatingButton = FloatingButtonController.getInstance()
        floatingButton.showFloatingButton()
        floatingButton.view.isHidden = true
    }

    fileprivate func initializeTime() {
        let minutesString:String = String(format: "%02d", minutesToCook)
        let secondsString:String = String(format: "%02d", secondsToCook)
        recipeCookingTime.text = "\(minutesString):\(secondsString)"
    }

    fileprivate func initializeScreen() {
        initializeTime()
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
        initiateLoop()
        UserDefaults.standard.set(recipeNameToSet, forKey: recipeNameUserDefault)
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
            notificationCenter.removeAllPendingNotificationRequests()
            stopTimer()
            playButton.setImage(UIImage(named: Constants.HomeTab.PLAY_FILLED_ICON), for: .normal)
        } else {
            print("Notification Requested")
            setNotification()
            initiateLoop()
            let floatingButton = FloatingButtonController.getInstance()
            floatingButton.showFloatingButton()
            playButton.setImage(UIImage(named: Constants.HomeTab.PAUSE_ICON), for: .normal)
        }
        isNotificationRequested = !isNotificationRequested
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
            let floatingButton = FloatingButtonController.getInstance()
            floatingButton.hideFloatingButton()
            self.stopTimer()
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

    fileprivate func stopTimer() {
        timer?.invalidate()
        timerDispatchSourceTimer?.cancel()
    }

    deinit {
        stopTimer()
        print("Notification Timer View Safe From Memory Leaks")
    }
}
