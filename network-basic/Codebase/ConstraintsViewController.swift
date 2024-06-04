//
//  ConstraintsViewController.swift
//  network-basic
//
//  Created by junehee on 6/4/24.
//

import UIKit

class ConstraintsViewController: UIViewController {
    
    /**
     Constrains
     1. 뷰 객체 프로퍼티 선언 (클래스 인스턴스)
     2. 뷰에 하위 뷰 추가하기 (루트 뷰에 내가 만든 뷰를 추가)
     3. 위치 잡기
        3-1. AutoResizing - autoResizingMask... but 잘 안씀
        3-2. AutoLayout
            - NSLayoutConstraints
            - isActive / add Constraints
            - ㅜㄴ
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
        
        // 3번-AutoLayout
        emailTextField.translatesAutoresizingMaskIntoConstraints = false // AutoResizing 안쓸래!
        emailTextField.backgroundColor = .green
        
        // item 누구를 잡을지, attribue 어디를, relatedBy 어떻게?, toItem 누구와, attribute: 누구의 어디를
        // 새로 생성한 제약 조건은 기본이 false이기 때문에 적용을 위해 isActie true 설정해주어야 함
        let top = NSLayoutConstraint(item: emailTextField, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
//        top.isActive = true
        
        let leading = NSLayoutConstraint(item: emailTextField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 50)
//        leading.isActive = true
        
        let trailing  = NSLayoutConstraint(item: emailTextField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: -50)
//        trailing.isActive = true
        
        let height = NSLayoutConstraint(item: emailTextField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 50)
//        height.isActive = true
        
        view.addConstraints([top, leading, trailing, height])
        
        
        signButton.translatesAutoresizingMaskIntoConstraints = false
        signButton.backgroundColor = .systemPink
        
        NSLayoutConstraint.activate([
            signButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signButton.widthAnchor.constraint(equalToConstant: 300), //절대적인 수치로 너비 잡기
            signButton.heightAnchor.constraint(equalToConstant: 50),
            signButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}
