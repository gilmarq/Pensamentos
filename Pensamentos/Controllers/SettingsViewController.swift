//
//  SettingsViewController.swift
//  Pensamentos
//
//  Created by Gilmar Queiroz on 20/07/20.
//  Copyright © 2020 Gilmar Queiroz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var swAutorefresh: UISwitch!
    @IBOutlet weak var lsTimeInterval: UISlider!
    @IBOutlet weak var scColorScheme: UISegmentedControl!
    @IBOutlet weak var lbTimeInterval: UILabel!
    
    
    let config = Configuration.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "Refresh"), object: nil, queue: nil ) {
            (notification) in
            self.formatView()
        }

        formatView()
    }
    
    func  formatView() {
        
        swAutorefresh.setOn(config.autoRefresh, animated: false)
        lsTimeInterval.setValue(Float(config.timeInterval), animated: false)
        scColorScheme.selectedSegmentIndex = config.colorScheme
        
        changeTimeIntervalLabel(with: config.timeInterval)
        
    }
    func changeTimeIntervalLabel(with value: Double){
        lbTimeInterval.text = "Mudar após \(Int(value)) segundos"
    }

    @IBAction func changeAutorefresh(_ sender: UISwitch) {
        config.autoRefresh = sender.isOn
    }
    
    @IBAction func changeTimeInterval(_ sender: UISlider) {
        
        let value = Double(round(sender.value))
        
         changeTimeIntervalLabel(with: value )
         config.timeInterval = value
        
    }
    
    @IBAction func changeColorScheme(_ sender: UISegmentedControl) {
        config.colorScheme = sender.selectedSegmentIndex
        
    }
    
}
