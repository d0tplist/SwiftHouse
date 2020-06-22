//
//  File.swift
//  
//
//  Created by alex on 6/22/20.
//

import Foundation

public class HttpClient {

    public static func get(url: String) -> String? {

        print(url)

        let url = URL(string: url)!

        let request = URLRequest(url: url)

        let task = URLSession.shared.synchronousDataTask(urlrequest: request as URLRequest)

        if let data = task.data {
            return String(decoding: data, as: UTF8.self)
        }

        return nil
    }

}
