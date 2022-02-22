//
//  ViewController.swift
//  UI Project Swift
//
//  Created by coditas on 22/02/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource   {
    let step:Float=10
    let dataArray = ["Web Development", "App Development", "UI Design", "UX Design"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UILabel
        let label = UILabel()
        label.frame = CGRect(x: 210, y: 100, width: 200, height: 60)
        label.text = "Coditas"
        
        // UIImageView
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 50, y: 50, width: 150, height: 150)
        imageView.image = UIImage(named: "coditas")
        imageView.contentMode = .scaleAspectFit
        
        // UIButton
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 180, width: 170, height: 30)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        button.setTitle("Tap Me", for: .normal)
        button.setTitle("I am being tapped", for: .highlighted)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitleColor(UIColor.black, for: .highlighted)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        // UISwitch
        let switchDemo=UISwitch(frame:CGRect(x: 50, y: 210, width: 0, height: 0))
                switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
                switchDemo.setOn(true, animated: false)
                
        // UIStepper
        let view = UIView()
                view.backgroundColor = .white
                
                let myUIStepper = UIStepper()
              
                
                // Resume UIStepper value from the beginning
                myUIStepper.wraps = false
                
                // Position UIStepper in the center of the view
                myUIStepper.frame = CGRect(x: 40, y: 490, width: 100, height:30)
                
                // If tap and hold the button, UIStepper value will continuously increment
                myUIStepper.autorepeat = true
                
                // Set UIStepper max value to 10
                myUIStepper.maximumValue = 10
                
                // Add a function handler to be called when UIStepper value changes
                myUIStepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
                
                view.addSubview(myUIStepper)
                self.view = view
        
        //UISlider
        let mySlider = UISlider(frame:CGRect(x: 40, y: 320, width: 300, height: 20))
                mySlider.minimumValue = 0
                mySlider.maximumValue = 100
                mySlider.isContinuous = true
                mySlider.tintColor = UIColor.green
                mySlider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
        
        //UISegmentedControl
        let mySegmentedControl = UISegmentedControl (items: ["One","Two","Three"])
                
                let xPostion:CGFloat = 40
                let yPostion:CGFloat = 350
                let elementWidth:CGFloat = 300
                let elementHeight:CGFloat = 30
        mySegmentedControl.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
                
                // Make second segment selected
                mySegmentedControl.selectedSegmentIndex = 1
                
                //Change text color of UISegmentedControl
                mySegmentedControl.tintColor = UIColor.yellow
                
                //Change UISegmentedControl background colour
                mySegmentedControl.backgroundColor = UIColor.black
                
                // Add function to handle Value Changed events
                mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
                
                self.view.addSubview(mySegmentedControl)
        
        //UIDatePicker
        let datePicker: UIDatePicker = UIDatePicker()
                
                // Posiiton date picket within a view
                datePicker.frame = CGRect(x: 15, y: 400, width: 200, height: 30)
                
                // Set some of UIDatePicker properties
                datePicker.timeZone = NSTimeZone.local
                datePicker.backgroundColor = UIColor.white
                
                // Add an event to call onDidChangeDate function when value is changed.
                datePicker.addTarget(self, action:#selector(ViewController.datePickerValueChanged(_:)), for: .valueChanged)
           
                // Add DataPicker to the view
                self.view.addSubview(datePicker)
        
        //UIPickerView
        let UIPicker: UIPickerView = UIPickerView()
              UIPicker.delegate = self as UIPickerViewDelegate
              UIPicker.dataSource = self as UIPickerViewDataSource
              self.view.addSubview(UIPicker)
              UIPicker.frame = CGRect(x: 30, y: 430, width: 300, height:50)
        
        
        //UIAlertController
        var dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to delete this?", preferredStyle: .alert)
         
         // Create OK button
         let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
             print("Ok button tapped")
          })
         
         //Add OK button
         dialogMessage.addAction(ok)
         // Present Alert
         self.present(dialogMessage, animated: true, completion: nil)
        
        
        // View controller's root view
        self.view.addSubview(label)
        self.view.addSubview(imageView)
        self.view.addSubview(button)
        self.view.addSubview(switchDemo)
        self.view.addSubview(mySlider)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let textField = UITextField(frame: CGRect(x: 50, y:250, width: 280.0, height: 44.0))
        
        textField.delegate = self
        textField.returnKeyType = .done
        textField.backgroundColor = UIColor.lightGray
        self.view.addSubview(textField)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    // IBAction UIButton
    @IBAction func buttonTapped(_ sender: UIButton){
        print("button tapped")
    }
    
    // UISwitch
    @objc func switchStateDidChange(_ sender:UISwitch!)
        {
            if (sender.isOn == true){
                print("UISwitch state is now ON")
            }
            else{
                print("UISwitch state is now Off")
            }
        }
    
    // UIStepper
    @objc func stepperValueChanged(_ sender:UIStepper!)
        {
            print("UIStepper is now \(Int(sender.value))")
        }
    
    //UISlider
    @objc func sliderValueDidChange(_ sender:UISlider!)
        {
            print("Slider value changed")
            
            // Use this code below only if you want UISlider to snap to values step by step
            let roundedStepValue = round(sender.value / step) * step
            sender.value = roundedStepValue
            
            print("Slider step value \(Int(roundedStepValue))")
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
                                     
                                     @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
                                         {
                                             print("Selected Segment Index is : \(sender.selectedSegmentIndex)")
                                         }
    
    //UIDatePicker
    @objc func datePickerValueChanged(_ sender: UIDatePicker){
            
            // Create date formatter
            let dateFormatter: DateFormatter = DateFormatter()
            
            // Set date format
            dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
            
            // Apply date format
            let selectedDate: String = dateFormatter.string(from: sender.date)
            
            print("Selected value \(selectedDate)")
        }
    
    //UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
       }
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
          return dataArray.count
       }
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          let row = dataArray[row]
          return row
       }
    
    

}

