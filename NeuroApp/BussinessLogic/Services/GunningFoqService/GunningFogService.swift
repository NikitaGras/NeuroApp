//
//  GunningFogService.swift
//  NeuroApp
//
//  Created by Nikita Gras on 05.11.2021.
//

import Alamofire

class GanningFogService: GanningFogSeviceProtocol {
    func getGunningFogIndex(for text: String, complitionHandler: @escaping (Double?, Error?) -> Void) {
        let url = "https://ipeirotis-readability-metrics.p.rapidapi.com/getReadabilityMetrics"
        let headers: HTTPHeaders = [
            HTTPHeader(name: "x-rapidapi-host", value: "ipeirotis-readability-metrics.p.rapidapi.com"),
            HTTPHeader(name: "x-rapidapi-key", value: "9e3e4ba00amsh77ecb2a6ef93b17p1bc968jsn122bb0d8500f"),
            HTTPHeader(name: "content-type", value: "application/x-www-form-urlencoded"),
            HTTPHeader(name: "useQueryString", value: "true")]
        let param: [String:Any] = ["text": text]
        
        AF.request(url, method: .post,parameters: param ,headers: headers).validate().responseJSON { response in
            switch response.result {
            case .success(let data):
                guard let json = data as? [String:Any],
                      let gunningFogIndex = json["GUNNING_FOG"] as? Double else {
                          return complitionHandler(nil, SystemError.default)
                      }
                complitionHandler(gunningFogIndex, nil)
            case .failure(let error):
                complitionHandler(nil, error)
            }
        }
    }
}
