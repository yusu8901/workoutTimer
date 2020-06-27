//
//  ViewController.swift
//  timer
//
//  Created by yusuke shinmura on 2020/06/20.
//  Copyright © 2020 yusuke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countlabel: UILabel!
    @IBOutlet var intervallabel: UILabel!
    @IBOutlet var button: UIButton!
    
    var count: Float = 0.0
    var defaultcount: Float = 0.0
    var interval: Float = 0.0
    var defaultinterval: Float = 0.0
    
    var timer1: Timer = Timer()
    var timer2: Timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //最初ラベルを非表示にする
        //        label.isHidden = true
    }
    
    @IBAction func startAndStop() {
        
        //ラベルを表示
//        countlabel.isHidden = false
        
        if !timer1.isValid {
            //タイマーが動作していなかったら動かす
            timer1 = Timer.scheduledTimer(timeInterval: 0.1,
                                          target: self,
                                          selector: #selector(self.down1),
                                          userInfo: nil,
                                          repeats: true)
            
            button.setTitle("STOP", for: .normal)
            
        } else if timer1.isValid {
            //もしタイマーが動いていたら停止する
            timer1.invalidate()
            button.setTitle("START", for: .normal)
            
        }
        
        
        
    }
    
    
    @objc func down1() {
        //0になったらもう一回スタート
        if count < 0.1 {
            //countを初期化
            count = defaultcount
            //countを停止
//            timer1.invalidate()
//            //intervalを動かす
//            timer2 = Timer.scheduledTimer(timeInterval: 0.1,
//                                          target: self,
//                                          selector: #selector(self.down2),
//                                          userInfo: nil,
//                                          repeats: true)
            
            
        }
        //countを0.1減らす
        count = count - 0.1
        //ラベルに小数点以下１桁まで表示
        countlabel.text = String(format: "%.1f", count)
        
    }
    @objc func down2() {
        
        if interval < 0.1 {
            //intervalを初期化
            interval = defaultinterval
            //intervalを停止
            timer2.invalidate()
            //countを動かす
//            timer1 = Timer.scheduledTimer(timeInterval: 0.1,
//                                          target: self,
//                                          selector: #selector(self.down1),
//                                          userInfo: nil,
//                                          repeats: true)
        }
        
        //countを0.1減らす
        count = count - 0.1
        //ラベルに小数点以下１桁まで表示
        intervallabel.text = String(format: "%.1f", interval)
    }
    
    @IBAction func reset() {
        
        if timer1.isValid {
            timer1.invalidate()
        } else if !timer1.isValid {
            count = defaultcount
            countlabel.text = String(format:"%.1f", count)
        }
        
    }
    
    
    @IBAction func countplus10() {
        defaultcount = defaultcount + 10.0
        count = count + 10.0
        countlabel.text = String(format: "%.1f", count)
    }
    
    @IBAction func countminus10() {
        defaultcount = defaultcount - 10.0
        count = count - 10.0
        countlabel.text = String(format: "%.1f", count)
    }
    
    @IBAction func intervalplus10() {
        interval = interval + 10
        defaultinterval = defaultinterval + 10
        intervallabel.text = String(format: "%.1f", interval)
    }
    
    @IBAction func intervalminus10() {
        interval = interval - 10
        defaultinterval = defaultinterval - 10
        intervallabel.text = String(format: "%.1f", interval)
    }
    
    //    //数値の範囲（1...10という記法）を配列にする
    //    var dataArray: [Int] = ([Int])(1...200)
    //
    //    //PickerViewのコンポーネントの数を決めるメソッド
    //    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    //PickerViewのコンポーネント内の行数を決めるメソッド
    //    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return dataArray.count
    //    }
    
    
    
    
    
}
