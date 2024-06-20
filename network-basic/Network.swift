//
//  Network.swift
//  network-basic
//
//  Created by junehee on 6/20/24.
//

import Foundation
import Alamofire

/**
 Manager, Service
 callRequest, get ~ , fetch ~, request ~
 */

// 해당 함수가 얼만큼의 비중을 가지고 있는지에 따라 static 여부를 생각해볼 수 있다.
// 만약 어떤 함수가 앱을 사용하는 동안 1번 실행되고 사용하지 않는 거라면 static 처리가 필요할까?

class NetworkManager {
    
    static let shared = NetworkManager()   // 사용할 때: NetworkManager.shared.getLotto()
    
    private init() { }  // 초기화 막기 - 인스턴스 생성 방지
 
    func getLotto(query: String,
                  completionHandler: @escaping (String) -> Void) {
        let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(query)"
        
        
        AF.request(lottoURL).responseDecodable(of: Lotto.self) { res in
            switch res.result {
            case .success(let value):
                print(value.drwNoDate)  // 탈출 클로져
                completionHandler(value.drwNoDate)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
