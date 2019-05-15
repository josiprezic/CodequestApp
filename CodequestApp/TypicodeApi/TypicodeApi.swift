//
//  TypicodeApi.swift
//  CodequestApp
//
//  Created by Korisnik on 15/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import Foundation
import Alamofire

typealias APICompletedWithData = (_ success: Bool, _ message: String, _ data: [Post]) -> Void

struct TypicodeApi {
    
    public static func getData(completed: @escaping APICompletedWithData) {
        DispatchQueue.global(qos: .background).async {
            Alamofire.request(AppStrings.ApiEndpoints.getPostsUrl, method: .get).responseJSON { response in
                
                let result = response.result
                switch result {
                case .failure:
                    completed(false, result.error.debugDescription, [])
                case .success:
                    let posts = parseJsonData(result: result)
                    completed(true, "Success", posts)
                }
            }
        }
        
    }
    
    private static func parseJsonData(result: Result<Any>) -> [Post] {
        guard let objectArray = result.value as? [Dictionary<String, Any>] else {
            print("Parsing eror: No array dictionary")
            return []
        }
        var posts = [Post]()
        for item in objectArray {
            guard let userId = item["userId"] as? Int,
                let id = item["id"] as? Int,
                let title = item["title"] as? String,
                let body = item["body"] as? String else {
                    print("Parsing error, item: \(item)")
                    continue
            }
            let newPost = Post(userId: userId, id: id, title: title, body: body)
            posts.append(newPost)
        }
        print("Posts count: \(posts.count)")
        return posts
    }
}
