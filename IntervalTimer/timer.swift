//
//  timer.swift
//  IntervalTimer
//
//  Created by Nick Grah on 6/9/18.
//  Copyright © 2018 InTimer. All rights reserved.
//

import Foundation

class intervalTimer: NSObject {
    
    var title = String()
    var detail = String()
    var startTime = Date()
    var numAlerts = 100
    
    let second = TimeInterval(1.0)
    let minute = TimeInterval(60.0)
    let hour = TimeInterval(3600.0)
    let day = TimeInterval(86400.0)
    
    var interval = TimeInterval()
    func setInterval (s: Double, m: Double, h: Double, d: Double) {
        self.interval = s*second + m*minute + h*hour + d*day
    }
    
    var nextAlertDates = [Date()]
    func getNextAlertDates() {
        for i in 0...numAlerts {
            let idouble = Double(i)
            let thisInterval = self.interval + idouble*self.interval
            let newTime = Date(timeIntervalSinceNow: thisInterval)
            self.nextAlertDates.append(newTime)
        }
    }
        
        
        
        func alertTriggered(){
            var currentDate = Date()
            for dateItem in self.nextAlertDates{
                if dateItem <= currentDate {
                    
                    //  ---->> Need to call a high level function (from AppDelegate ? ) to send push notification whether the app is open or minimized <<----
                    //pushAlert(self)
                    
                    
                    nextAlertDates.remove(at: nextAlertDates.index(of: dateItem)!)
                }
            }
        }
        
        
    
    
}

func pushAlert(alert: intervalTimer) {
    
}



