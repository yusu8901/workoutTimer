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
        @IBOutlet var worklabel: UILabel!
        @IBOutlet var timelabel: UILabel!
        @IBOutlet var kyukeilabel: UILabel!
        @IBOutlet var countbuttonplus10: UIButton!
        @IBOutlet var countbuttonminus10: UIButton!
        @IBOutlet var intervalbuttonplus10: UIButton!
        @IBOutlet var intervalbuttonminus10: UIButton!
        @IBOutlet var start: UIButton!
        
        
        
        var count: Float = 0.0
        var defaultcount: Float = 0.0
        var interval: Float = 0.0
        var defaultinterval: Float = 0.0
        
        
        var timer1: Timer = Timer()
        var timer2: Timer = Timer()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            worklabel.text = " "
            timelabel.isHidden = false
            kyukeilabel.isHidden = false
            
            
            countbuttonplus10.layer.masksToBounds = false
            countbuttonplus10.layer.shadowColor = UIColor.black.cgColor
            countbuttonplus10.layer.shadowOffset = CGSize(width: 3, height: 3)
            countbuttonplus10.layer.shadowOpacity = 0.3
            countbuttonminus10.layer.shadowRadius = 5
            
            countbuttonminus10.layer.masksToBounds = false
            countbuttonminus10.layer.shadowColor = UIColor.black.cgColor
            countbuttonminus10.layer.shadowOffset = CGSize(width: 3, height: 3)
            countbuttonminus10.layer.shadowOpacity = 0.3
            countbuttonminus10.layer.shadowRadius = 5
            
            intervalbuttonplus10.layer.masksToBounds = false
            intervalbuttonplus10.layer.shadowColor = UIColor.black.cgColor
            intervalbuttonplus10.layer.shadowOffset = CGSize(width: 3, height: 3)
            intervalbuttonplus10.layer.shadowOpacity = 0.3
            intervalbuttonplus10.layer.shadowRadius = 5
            
            intervalbuttonminus10.layer.masksToBounds = false
            intervalbuttonminus10.layer.shadowColor = UIColor.black.cgColor
            intervalbuttonminus10.layer.shadowOffset = CGSize(width: 3, height: 3)
            intervalbuttonminus10.layer.shadowOpacity = 0.3
            intervalbuttonminus10.layer.shadowRadius = 5
            //最初ラベルを非表示にする
            //        label.isHidden = true
        }
        
        
        
        @IBAction func startAndStop() {
            //ラベルを表示
            //        countlabel.isHidden = false
            
            if !timer1.isValid && !timer2.isValid && interval == defaultinterval && defaultcount != 0 && defaultinterval != 0  {
                
                //タイマーが両方動作していなくてインターバルが初期値の時に動かす
                timer1 = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(self.down1),
                                              userInfo: nil,
                                              repeats: true)
                
                start.setTitle("STOP", for: .normal)
                countlabel.isHidden = false
                countlabel.frame = CGRect(x: 20, y: 140, width: 374, height: 167)
                intervallabel.isHidden = true
                worklabel.text = "Work Out!"
                timelabel.isHidden = true
                kyukeilabel.isHidden = true
                buttonHidden()
                
                
            } else if !timer1.isValid && !timer2.isValid && count == defaultcount && defaultcount != 0 && defaultinterval != 0  {
                
                //タイマーが両方動作していなくてカウントが初期値の時に動かす
                timer2 = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(self.down2),
                                              userInfo: nil,
                                              repeats: true)
                
                start.setTitle("STOP", for: .normal)
                
                worklabel.text = "Interval"
                
                
                
                
            } else if timer1.isValid {
                //もしタイマー1が動いていたら停止する
                timer1.invalidate()
                start.setTitle("START", for: .normal)
                
                
            } else if timer2.isValid {
                //もしタイマー２が動いていたら停止する
                timer2.invalidate()
                start.setTitle("START", for: .normal)
            }
            
            
        }
        
        
        
        
        @objc func down1() {
            
            //countを0.1減らす
            count = count - 0.1
            //ラベルに小数点以下１桁まで表示
            countlabel.text = String(format: "%.1f", count)
            if count < 0.1 {
                timer2 = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(self.down2),
                                              userInfo: nil,
                                              repeats: true)
                timer1.invalidate()
                count = defaultcount
                worklabel.text = "Interval"
                intervallabel.isHidden = false
                intervallabel.frame = CGRect(x: 20, y: 140, width: 374, height: 167)
                countlabel.isHidden = true
            }
            
        }
        @objc func down2() {
            
            
            //countを0.1減らす
            interval = interval - 0.1
            //ラベルに小数点以下１桁まで表示
            intervallabel.text = String(format: "%.1f", interval)
            
            if interval < 0.1 {
                timer1 = Timer.scheduledTimer(timeInterval: 0.1,
                                              target: self,
                                              selector: #selector(self.down1),
                                              userInfo: nil,
                                              repeats: true)
                timer2.invalidate()
                interval = defaultinterval
                worklabel.text = "Work Out!"
                intervallabel.isHidden = true
                countlabel.isHidden = false
                countlabel.frame = CGRect(x: 20, y: 140, width: 374, height: 167)
            }
        }
        
        @IBAction func reset() {
            
            timer1.invalidate()
            timer2.invalidate()
            
            worklabel.text = " "
            timelabel.isHidden = false
            kyukeilabel.isHidden = false
            buttonOpen()
            
            if count == defaultcount && interval == defaultinterval {
                defaultcount = 0.0
                defaultinterval = 0.0
            }
            
            count = defaultcount
            interval = defaultinterval
            intervallabel.text = String(format: "%.1f", interval)
            countlabel.text = String(format: "%.1f", count)
            countlabel.isHidden = false
            intervallabel.isHidden = false
            countlabel.frame = CGRect(x: 11, y: 150, width: 185, height: 128)
            intervallabel.frame = CGRect(x: 209, y: 149, width: 185, height: 128)
            
        }
        
        
        @IBAction func countplus10() {
            defaultcount = defaultcount + 10.0
            count = count + 10.0
            countlabel.text = String(format: "%.1f", count)
            
        }
        
        @IBAction func countminus10() {
            if defaultcount >= 10 {
                defaultcount = defaultcount - 10.0
                count = count - 10.0
                countlabel.text = String(format: "%.1f", count)
            }
        }
        
        @IBAction func intervalplus10() {
            interval = interval + 10
            defaultinterval = defaultinterval + 10
            intervallabel.text = String(format: "%.1f", interval)
        }
        
        @IBAction func intervalminus10() {
            if defaultinterval >= 10 {
                interval = interval - 10
                defaultinterval = defaultinterval - 10
                intervallabel.text = String(format: "%.1f", interval)
            }
        }
        
        
        func buttonHidden() {
            countbuttonplus10.isHidden = true
            countbuttonminus10.isHidden = true
            intervalbuttonplus10.isHidden = true
            intervalbuttonminus10.isHidden = true
        }
        
        func buttonOpen() {
            countbuttonplus10.isHidden = false
            countbuttonminus10.isHidden = false
            intervalbuttonplus10.isHidden = false
            intervalbuttonminus10.isHidden = false
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
