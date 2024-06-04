//
//  LottoViewController.swift
//  network-basic
//
//  Created by junehee on 6/4/24.
//

import UIKit
import Alamofire

/**
todo 1 : Response 값(string)을 어떻게 화면에 띄우지? (Decoding)
todo 2 : 코드가 실행되는 순서 이해하기 (비동기)
 */

struct Lotto: Decodable {
    let drwNoDate: String
    let totSellamnt: Int
}

class LottoViewController: UIViewController {
    
    let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=1122"
    let movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=20231206"
    let coinURL = "https://api.upbit.com/v1/market/all"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        print("1111111111")
        AF.request(lottoURL).responseDecodable(of: Lotto.self) { res in
            switch res.result {
            case .success(let value):
                print(value.drwNoDate)
            case .failure(let error):
                print(error)
            }
        }
        
//        AF.request(lottoURL).responseString { res in
//            switch res.result {
//            case .success(let value):
//                print(value)
//            case .failure(let error):
//                print(error)
//            }
//        }
        
        print("2222222222")
    }
}
