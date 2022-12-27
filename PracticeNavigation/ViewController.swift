//
//  ViewController.swift
//  PracticeNavigation
//
//  Created by Taehwan Kim on 2022/12/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var navToFirstVCBtn: UIButton!
    
    @IBOutlet weak var navToSecondVCBtn: UIButton!
    
    var stepNumber: Int = 1 {
        didSet {
            self.title = "스텝넘버 \(stepNumber)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navToFirstVCBtn.addTarget(self, action: #selector(navToFirstVC(_:)), for: .touchUpInside)
        navToSecondVCBtn.addTarget(self, action: #selector(navToSecondVC(_:)), for: .touchUpInside)
    }
    
    @objc fileprivate func navToFirstVC(_ sender: UIButton) {
        print(#fileID, #function, #line)
        // performSegue로 어떤 세그웨이 경로를 선택할지 알 수 있음
        self.performSegue(withIdentifier: "navToFirst", sender: self)
    }
    
    @objc fileprivate func navToSecondVC(_ sender: UIButton) {
        print(#fileID, #function, #line)
        self.performSegue(withIdentifier: "navToSecond", sender: self)
    }
    
    // 버튼을 스토리보드 상에 생성하고 연결하여 명령을 내림
    @IBAction func onPushBtnClicked(_ sender: UIButton) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.stepNumber = stepNumber + 1
        // 아래 부분은 코드로 구성할 떄 친숙한 그녀석...
        
        self.navigationController?.pushViewController(viewController, animated: true
        
        )
    }
    
}

