//
//  ViewController.swift
//  FirstNewApp
//
//  Created by asher.enfj on 2022/11/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    var number: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        
    }
    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더의 밸류값을 가지고 메인레이블의 텍스트를 셋팅
        let seconds = Int(slider.value * 60) // 0.0 ~ 1.0
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        //1초씩 지나갈때마다 무언가를 실행
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            [weak self] _ in

            self?.number -= 1
            self?.mainLabel.text = "\(self!.number) 초"
            self?.slider.value = Float(self!.number) / Float(60)
            
            if self!.number <= 0 {
                self?.number = 0
                self?.mainLabel.text = "초를 선택하세요"
                self?.timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5
        number = 0
        timer?.invalidate()
        //timer = nil
    }
}

