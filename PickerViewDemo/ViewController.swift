//
//  ViewController.swift
//  PickerViewDemo
//
//  Created by APPLE on 12/07/17.
//  Copyright © 2017 rsku. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    
    @IBOutlet weak var lbl_mood: UILabel!
    
    @IBOutlet weak var view_container: UIView!
    
    let moodArray = ["Happy","Sad","Maudlin","Ecstatic","Overjoyed","Optimistic","Bewildered","Cynical","Giddy","Indifferent","Relaxed"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view_container.alpha = 0
        lbl_mood.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_mood(_ sender: Any) {
        view_container.alpha = 1
    }
        
}

extension ViewController: UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return moodArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lbl_mood.alpha = 1
        lbl_mood.text = moodArray[row]
        view_container.alpha = 0
        
        var newbackground : UIColor
        switch row {
        case 0,3,4,5,8:
            newbackground = UIColor.yellow
        case 1,2:
            newbackground = UIColor.darkGray
        case 6,7,9:
            newbackground = UIColor.lightGray
        default:
            newbackground = UIColor(red: 200/255, green: 255/255, blue: 200/255, alpha: 1.0)
        }
        self.view.backgroundColor = newbackground
    }
}

