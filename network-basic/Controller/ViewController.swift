//
//  ViewController.swift
//  network-basic
//
//  Created by junehee on 6/3/24.
//

import UIKit

struct User {
    // 저장 프로퍼티
    let name: String
    let age: Int
    let bgColor: UIColor
    
    // 연산 프로퍼티
    var userAge: String {
        return "\(age)세"
    }
    
    // 초기화 구문 수정 - age를 랜덤으로 고정!
    init(name: String, bgColor: UIColor) {
        self.name = name
        self.age = .random(in: 1...100)
        self.bgColor = .random()
    }
}

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var userList: [User] = [
        User(name: "JuneHee", bgColor: .systemPink),
        User(name: "Deah", bgColor: .blue),
        User(name: "Julie", bgColor: .green),
        User(name: "Juny", bgColor: .purple),
        User(name: "Jenny", bgColor: .yellow)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureBarButtonItem()
    }
    
    func configureBarButtonItem() {
        let rightItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(plusButtonClicked))
        let leftItem = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(starButtonClicked))
        
        navigationItem.rightBarButtonItem = rightItem
        navigationItem.leftBarButtonItem = leftItem
    }

    func configureTableView() {
        // self: 클래스의 인스턴스
        // delegate: 프로토콜
        // 둘의 타입이 다른데 = 등호가 가능한 이유는?
        tableView.delegate = self
        tableView.dataSource = self
        
        let xib = UINib(nibName: BasicTableViewCell.identifier, bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: BasicTableViewCell.identifier)
        
        tableView.rowHeight = 80
        tableView.separatorColor = .red
    }
    
    @objc func plusButtonClicked() {
        let vc = storyboard?.instantiateViewController(withIdentifier: AddEditViewController.identifier) as! AddEditViewController
        vc.type = .add
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
    @objc func starButtonClicked() {
//        let vc = FrameViewController()
//        let vc = ConstraintsViewController()
//        let vc = SnapViewController()
//        let vc = Snap2ViewController()
        let vc = LottoViewController()
        
//        present(vc, animated: true)
        navigationController?.pushViewController(vc, animated: true)
    }
}

// Delegation, DataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 여기에서 부르는 테이블 뷰는 아웃렛일까 매개변수일까?
        let cell = tableView.dequeueReusableCell(withIdentifier: BasicTableViewCell.identifier, for: indexPath) as! BasicTableViewCell
        
        let data = userList[indexPath.row]
        
        cell.textLabel?.text = data.name
        cell.detailTextLabel?.text = data.userAge
        cell.backgroundColor = data.bgColor
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)

//        let vc = storyboard?.instantiateViewController(withIdentifier: UserViewController.identifier) as! UserViewController    // as! UserViewController가 없다면 바로 뒤에 vc.userData 접근 안됨
//        vc.userData = userList[indexPath.row]
//        present(vc, animated: true)
        
        let vc = storyboard?.instantiateViewController(withIdentifier: AddEditViewController.identifier) as! AddEditViewController
        vc.type = .edit
        navigationController?.pushViewController(vc, animated: true)
    }
}
