//
//  SnapViewController.swift
//  network-basic
//
//  Created by junehee on 6/4/24.
//

import UIKit
import SnapKit

class SnapViewController: UIViewController {
    
    let photoImageView = UIImageView()
    let titleTextField = {
        let view = UITextField()
        view.placeholder = "제목을 입력해 주세요"
        view.textAlignment = .center
        view.borderStyle = .none
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    let dateTextField = UILabel()
    let contentTextView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        // layout은 무조건 addSubview가 들어간 이후!!!!!!!!!!!!
        configureHierarchy()
        configureLayout()
        configureUI()
    }
    
    func configureHierarchy() {
        let viewObjects: [UIView] = [photoImageView, titleTextField, dateTextField, contentTextView]
        
        for subview in viewObjects {
            view.addSubview(subview)
        }
    }
    
    func configureLayout() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(300)
        }
        
        titleTextField.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        
        dateTextField.snp.makeConstraints { make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.height.equalTo(50)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(dateTextField.snp.bottom).offset(20)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        photoImageView.backgroundColor = .lightGray
        photoImageView.contentMode = .scaleAspectFill
        
        dateTextField.backgroundColor = .blue
        
        contentTextView.backgroundColor = .green
    }

}
