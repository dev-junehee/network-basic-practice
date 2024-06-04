//
//  FrameViewController.swift
//  network-basic
//
//  Created by junehee on 6/4/24.
//

import UIKit

class FrameViewController: UIViewController {

    /**
     Frame Based Layout
     1. 뷰 객체 프로퍼티 선언 (클래스 인스턴스)
     2. 뷰에 하위 뷰 추가하기 (루트 뷰에 내가 만든 뷰를 추가)
     3. 위치 잡기 (뷰 객체가 가지고 있는 크기와 위치 설정)
     */
    
    // 1번
    let emailTextField = UITextField()
    let signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // 2번
        view.addSubview(emailTextField)
        view.addSubview(signButton)
        
        // 3번
        emailTextField.frame = CGRect(x: 100, y: 100, width: 300, height: 50)
        emailTextField.backgroundColor = .blue
        
        let width: Int = Int(UIScreen.main.bounds.width)
        signButton.frame = CGRect(x: 100, y: 300, width: width - 200, height: 50)
        signButton.backgroundColor = .orange
    }
    
}
