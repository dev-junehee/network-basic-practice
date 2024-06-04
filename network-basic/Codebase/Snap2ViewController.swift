//
//  Snap2ViewController.swift
//  network-basic
//
//  Created by junehee on 6/4/24.
//

import UIKit
import SnapKit


/**
 safeAreaLayoutGuide
 addSubview 순서에 따라 계층이 달라짐 (UIView에서만 가능)
 illegal
 */

class Snap2ViewController: UIViewController {
    
    let redView = UIView()
    let blueView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        configureHierarchy()
        configureLayout()
        configureUI()
    }

    func configureHierarchy() {
//        view.addSubview(blueView)
        view.addSubview(redView)
        redView.addSubview(blueView)
    }
    
    func configureLayout() {
        redView.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
            make.size.equalTo(300)
        }
        
        blueView.snp.makeConstraints { make in
//            make.edges.equalTo(view.safeAreaLayoutGuide)
            make.edges.equalToSuperview().offset(50)
        }
    }
    
    func configureUI() {
        redView.backgroundColor = .red
        blueView.backgroundColor = .blue
    }
}
