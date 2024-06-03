//
//  AddEditViewController.swift
//  network-basic
//
//  Created by junehee on 6/3/24.
//

import UIKit

// 휴먼 에러 방지, 컴파일 시점에 오류 처리 가능
// rawValue 설정 가능
enum ViewType: String {
    case add = "추가하기"
    case edit = "편집하기"
}

class AddEditViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    
    // 1.데이터를 바로 전달받기
//    var titleValue: String = ""
//    var placeholder: String = ""
    
    // 2.Bool, Int 사용하기
//    var type = 0
    // 0-추가, 1-편집... 규칙에 의해! if/else
    // but 타입에 2, 3, 4, 5가 들어와도 else문에 걸리기 때문에 문법적 오류는 없음.
    
    // 3.Enum 사용하기
    var type: ViewType = .add

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBarButtonItem()
        
//        if type == 0 {
//            navigationItem.title = "추가하기"
//            textField.placeholder = "등록할 이름을 입력해 주세요!"
//        } else {
//            navigationItem.title = "편집하기"
//            textField.placeholder = "수정할 이름을 입력해 주세요!"
//        }
        
        switch type {
        case .add:
//            navigationItem.title = "추가하기"
            textField.placeholder = "등록할 이름을 입력해 주세요!"
            textField.textAlignment = .center
        case .edit:
//            navigationItem.title = "편집하기"
            textField.placeholder = "수정할 이름을 입력해 주세요!"
        }
        
        navigationItem.title = type.rawValue
        
//        navigationItem.title = titleValue
//        textField.placeholder = placeholder
        
        
    }
    
    func configureBarButtonItem() {
        let item = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(saveButttonClicked))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func saveButttonClicked() {
        if type == .add {
            dismiss(animated: true)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }

}
