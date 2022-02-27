//
//  TimerViewModel.swift
//  Timer
//
//  Created by Akua Afrane-Okese on 2020/09/12.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import Foundation

protocol TimerViewModelDelegate: AnyObject {
    func updateTimer()
}

final class TimerViewModel {
    private var countdownTimer = Timer()
    private var currentTime: String
    private var totalTime: Int
    private weak var delegate: TimerViewModelDelegate?
    
    init(countdownTimer: Timer, totalTime: Int, delegate: TimerViewModelDelegate) {
        self.countdownTimer = countdownTimer
        self.currentTime = ""
        self.totalTime = totalTime
        self.delegate = delegate
    }
    
    var getCurrentTime: String {
        return self.currentTime
    }
    
    func startTimer() {
        countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func endTimer() {
        countdownTimer.invalidate()
    }
    
    func timeFormatted(_ totalSeconds: Int) -> String {
        let seconds: Int = totalSeconds % 60
        if seconds == 1 {
            return String("\(seconds) second")
            
        } else {
            return String("\(seconds) seconds")
        }
    }
    
    @objc func updateTime() {
        delegate?.updateTimer()
        currentTime = timeFormatted(totalTime)
        if totalTime != 0 {
            totalTime -= 1
        } else {
            endTimer()
        }
    }
}
