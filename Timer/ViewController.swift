//
//  ViewController.swift
//  Timer
//
//  Created by Akua Afrane-Okese on 2020/09/12.
//  Copyright © 2020 Akua Afrane-Okese. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    lazy var viewModel = TimerViewModel(countdownTimer: Timer(), totalTime: 22, delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.startTimer()
        timerLabel.text = viewModel.getCurrentTime
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        viewModel.endTimer()
    }
}

extension ViewController: TimerViewModelDelegate {
    func updateTimer() {
        timerLabel.text = viewModel.getCurrentTime
    }
}
