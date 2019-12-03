//
//  ViewController.swift
//  Color Picker
//
//  Created by Armaja LaRue-Hill on 12/2/19.
//  Copyright © 2019 Armaja LaRue-Hill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var dataSource = [Color(name:"Red", uiColor: UIColor.red),
                  Color(name:"Orange", uiColor: UIColor.orange),
                  Color(name:"Yellow", uiColor: UIColor.yellow),
                  Color(name:"Green", uiColor:UIColor.green),
                  Color(name:"Blue", uiColor: UIColor.blue),
                  Color(name:"Purple", uiColor: UIColor.purple),
                   Color(name:"Brown", uiColor: UIColor.brown),

    ]

    
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
        self.view.backgroundColor = dataSource[0].uiColor
        detailLabel.text = dataSource[0].name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)->
    Int{
        return dataSource.count
    }
    
    func pickerView(_pickerView: UIPickerView, didSeelctRow row: Int, inComponent : Int){
        detailLabel.text = dataSource[row].name
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?{
       detailLabel.text = dataSource[row].name
        self.view.backgroundColor = dataSource[row].uiColor
        return dataSource[row].name
        
    }
}
