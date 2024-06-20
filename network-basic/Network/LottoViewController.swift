//
//  LottoViewController.swift
//  network-basic
//
//  Created by junehee on 6/4/24.
//

import UIKit

/**
todo 1 : Response 값(string)을 어떻게 화면에 띄우지? (Decoding)
todo 2 : 코드가 실행되는 순서 이해하기 (비동기)
 */

struct Lotto: Decodable {
    let drwNoDate: String
    let totSellamnt: Int
}

class LottoViewController: UIViewController {
    
    
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20231206"
    let coinURL = "https://api.upbit.com/v1/market/all"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        print("1111111111")
        
        NetworkManager.shared.getLotto(query: "1105") { res in
            print(res)
        }
        
        print("2222222222")
    }
}
