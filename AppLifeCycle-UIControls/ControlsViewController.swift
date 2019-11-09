//
//  ControlsViewController.swift
//  AppLifeCycle-UIControls
//
//  Created by Alex Paul on 11/8/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ControlsViewController: UIViewController {
  
  // MARK:- outlets and properties
  
  @IBOutlet weak var switchLabel: UILabel!
  @IBOutlet weak var switchControl: UISwitch!
  
  @IBOutlet weak var stepperLabel: UILabel!
  @IBOutlet weak var stepperControl: UIStepper!
    
  @IBOutlet weak var segmentedControl: UISegmentedControl!
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var sliderControl: UISlider!
  @IBOutlet weak var sliderLabel: UILabel!
  
  var switchValue: Bool = true { // e.g switchValue = true
    // property observer - observers changes on a property, willSet, didSet
    didSet {
      // update switch label
      switchLabel.text = "This switch is \(switchControl.isOn ? "on" : "off")"
    }
  }
  
  var cohort: Double = 6.0 {
    didSet {
      stepperLabel.text = "Looking at \(stepperControl.value) Cohort"
    }
  }
  
  var currentSegmentIndex: Int = 0 {
    didSet {
      switch segmentedControl.selectedSegmentIndex {
      case 0:
        imageView.image = #imageLiteral(resourceName: "cat")
      case 1:
        imageView.image = #imageLiteral(resourceName: "dog")
      default:
        imageView.image = #imageLiteral(resourceName: "pursuit")
      }
    }
  }
  
  var currentYear: Float = 2012 {
    didSet {
      sliderLabel.text = String(format: "%0.f", sliderControl.value)
    }
  }
  
  // MARK:- View Controller Life Cycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureStepper()
    configureSlider()
  }
  
  func configureStepper() {
    stepperControl.minimumValue = 1.0
    stepperControl.maximumValue = 7.0
    stepperControl.stepValue = 1.0
    
    // default start value
    stepperControl.value = 6.0
  }
  
  func configureSlider() {
    sliderControl.minimumValue = 1978
    sliderControl.maximumValue = 2019
    sliderControl.value = 2012
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    print("cvc - viewWillAppear")
  }
  
  // MARK:- actions and methods
  
  @IBAction func switchToggled(_ sender: UISwitch) {
    switchValue = sender.isOn // of type Bool, true or false
  }
  
  
  @IBAction func stepperChanged(_ sender: UIStepper) {
    cohort = sender.value // of type Double
  }
  
  @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
    currentSegmentIndex = sender.selectedSegmentIndex // valid values 0, 1
  }
  
  @IBAction func sliderChanged(_ sender: UISlider) {
    currentYear = sender.value
  }
}
