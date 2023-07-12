//
//  APIManager.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 06/02/20.
//  Copyright © 2020 Irfan Ajmeri. All rights reserved.
//

import WebKit
import Alamofire
import SwiftyJSON
//
// MARK:- authHeaders configuration
//
var webViewForUserAgent: WKWebView?
var userAgent: String = "iPhone"
var devicePlatform: String = "iOS"
var authHeaders: HTTPHeaders = [
    "Authorization": "Basic",
    "Accept-Language" : "en",
    "Content-Type": "application/json; charset=utf-8",
    "DevicePlatform": devicePlatform,
    "User-Agent": userAgent
]

var authHeadersMultipart: HTTPHeaders = [
    "Authorization": "Bearer",
    "Accept-Language" : "en",
    "Content-Type": "multipart/form-data",
    "DevicePlatform": devicePlatform,
    "User-Agent": userAgent
]

class APIManager: NSObject {
    
    static let sharedInstance = APIManager()
    
    //
    // MARK:- GET
    //
    func requestGET(_ strURL: String, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeaders:\n\(authHeaders)")
        
        AF.request(strURL, headers: authHeaders).response { (responseObj) -> Void in
            switch responseObj.result {
            case .success(let value):
                if let val = value{
                    print("\nResponse:\n\(JSON(val))")
                    success(JSON(val))
                }
                else{
                    
                }
            case .failure(let error):
                print("\nError:\n\(error.localizedDescription)")
                failure(error)
            }
            
            
//            if responseObj.result.isSuccess, let resJson = responseObj.value {
//                print("\nResponse:\n\(JSON(resJson))")
//                success(JSON(resJson))
//            }
//
//            if responseObj.result.isFailure, let error: Error = responseObj.error {
//                print("\nError:\n\(error.localizedDescription)")
//                failure(error)
//            }
        }
    }
    
    //
    // MARK:- POST
    //
    func requestPOST(_ strURL: String, params: Parameters, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeaders:\n\(authHeaders)")
        print("\nRequest:\n\(params.prettyPrint())")
        
        AF.request(strURL, method: .post, parameters: params, encoding: JSONEncoding.default, headers: authHeaders).responseJSON { (responseObj) -> Void in
            
            
            switch responseObj.result {
            case .success(let value):
                print("\nResponse:\n\(JSON(value))")
                success(JSON(value))
            case .failure(let error):
                print("\nError:\n\(error.localizedDescription)")
                failure(error)
            }
        }
    }
    
    func requestPOSTwithArray(_ strURL: String, params: [Parameters], success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeaders:\n\(authHeaders)")
        print("\nRequest:\n\(params)")
        
        AF.request(strURL, method: .post, parameters: params.asParameters(), encoding: ArrayEncoding(), headers: authHeaders).responseJSON { (responseObj) -> Void in
            
            switch responseObj.result {
            case .success(let value):
                print("\nResponse:\n\(JSON(value))")
                success(JSON(value))
            case .failure(let error):
                print("\nError:\n\(error.localizedDescription)")
                failure(error)
            }
        }
    }
    
    func requestPOSTwithMultipart(_ strURL: String, _ jsonData: Data, _ imgData: Data?, _ fileName: String, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeadersMultipart:\n\(authHeadersMultipart)")
        print("\nRequest:\n\(String(decoding: jsonData, as: UTF8.self))")
        
        AF.upload(multipartFormData: { (multipartFormData) in
            let fileName = fileName + ".jpg"
            //
            if let unwrappedImgData = imgData {
                print("\(fileName) also appended")
                multipartFormData.append(unwrappedImgData, withName: "image", fileName: fileName, mimeType: "image/jpg")
            }
            multipartFormData.append(jsonData, withName: "data")

        }, to: strURL, usingThreshold: UInt64.init(), method: HTTPMethod.post, headers: authHeadersMultipart)
        .validate(statusCode: 200..<300)
        .response { (responseObj) in

            //
            if let err = responseObj.error {
                print(err.localizedDescription)
                failure(err)
                return
            }
            
            //
            switch responseObj.result {

            case .failure(let error):
                print("\nFailed:\n\(error.localizedDescription)")
                failure(error)
                return

            case .success( _):
                
                if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                    print("Got the info")
                    print(responseObj)
                    
                    print(responseObj.result)
                    do {
                        // make sure this JSON is in the format we expect
                        if let json = try JSONSerialization.jsonObject(with: resJson, options: []) as? [String: Any] {
                            // try to read out a string array
                            
                             let namess = json["Result"] as? [Any]
                            print(namess)
                            
                        }
                    } catch let error as NSError {
                        print("Failed to load: \(error.localizedDescription)")
                    }
                    
                    print("\nResponse:\n\(JSON(resJson))")
                    success(JSON(resJson))
                    return
                }
                
                if case .failure(let error) = responseObj.result {
                    print("\nError:\n\(error.localizedDescription)")
                    failure(error)
                    return
                }
            }

        }.uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
    }
    
    func requestPOSTwithMultipartArr(_ strURL: String, _ jsonData: Data, _ imgDataArr: [Data], _ fileNameArr: [String], success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeadersMultipart:\n\(authHeadersMultipart)")
        print("\nRequest:\n\(String(decoding: jsonData, as: UTF8.self))")
        
        do {
            let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String : Any]
        } catch {
            print("errorMsg")
        }
        
        AF.upload(multipartFormData: { (multipartFormData) in

            //
            for (i, singleImg) in imgDataArr.enumerated() {
                print("FileName[\(i)]: \(fileNameArr[i])")
                multipartFormData.append(singleImg, withName: "FileName[\(i)]", fileName: fileNameArr[i], mimeType: "image/jpeg")
            }
            multipartFormData.append(jsonData, withName: "data")
            print(multipartFormData)

        }, to: strURL, usingThreshold: UInt64.init(), method: HTTPMethod.post, headers: authHeadersMultipart)
        
        
        .validate(statusCode: 200..<300)
        .response { (responseObj) in
        
            //
            if let err = responseObj.error {
                print(err.localizedDescription)
                failure(err)
                return
            }
            
            //
            switch responseObj.result {

            case .failure(let error):
                print("\nFailed:\n\(error.localizedDescription)")
                failure(error)
                return

            case .success( _):
                
                
                if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                    print("\nResponse:\n\(JSON(resJson))")
                    success(JSON(resJson))
                    return
                }
                
                if case .failure(let error) = responseObj.result {
                    print("\nError:\n\(error.localizedDescription)")
                    failure(error)
                    return
                }
            }

        }.uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
    }
    
    func requestPOSTwithMultipartArrWithPara(_ strURL: String, _ jsonData: Parameters, _ imgDataArr: [Data], _ fileNameArr: [String], success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeadersMultipart:\n\(authHeadersMultipart)")
        //print("\nRequest:\n\(String(decoding: jsonData, as: UTF8.self))")
        
      
        
        AF.upload(multipartFormData: { (multipartFormData) in

            //
            for (i, singleImg) in imgDataArr.enumerated() {
                print("FileName[\(i)]: \(fileNameArr[i])")
                multipartFormData.append(singleImg, withName: "FileName[\(i)]", fileName: fileNameArr[i], mimeType: "image/jpeg")
            }
            //multipartFormData.append(jsonData, withName: "data")
//            for (key, value) in jsonData {
//                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//            }
            
            for (key, value) in jsonData {
                        if let temp = value as? String {
                            multipartFormData.append(temp.data(using: .utf8)!, withName: key )
                        }
                        if let temp = value as? Int {
                            multipartFormData.append("\(temp)".data(using: .utf8)!, withName: key )
                        }
                        if let temp = value as? NSArray {
                            temp.forEach({ element in
                                let keyObj = key + "[]"
                                if let string = element as? String {
                                    multipartFormData.append(string.data(using: .utf8)!, withName: keyObj)
                                } else
                                    if let num = element as? Int {
                                        let value = "\(num)"
                                    multipartFormData.append(value.data(using: .utf8)!, withName: keyObj)
                                }
                            })
                        }
                    }
           
            print(multipartFormData)

        }, to: strURL, usingThreshold: UInt64.init(), method: .post, headers: authHeadersMultipart)
        .validate(statusCode: 200..<300)
        .response { (responseObj) in
        
            //
            if let err = responseObj.error {
                print(err.localizedDescription)
                failure(err)
                return
            }
            
            //
            switch responseObj.result {

            case .failure(let error):
                print("\nFailed:\n\(error.localizedDescription)")
                failure(error)
                return

            case .success( _):
                
                if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                    print("\nResponse:\n\(JSON(resJson))")
                    success(JSON(resJson))
                    return
                }
                
                if case .failure(let error) = responseObj.result {
                    print("\nError:\n\(error.localizedDescription)")
                    failure(error)
                    return
                }
            }

        }.uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
    }
    
    //
    // MARK:- PUT
    //
    func requestPUT(_ strURL: String, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        //Utils.printFun(txt: strURL)
        print("\nauthHeaders:\n\(authHeaders)")
        
        AF.request(strURL, method: .put, headers: authHeaders).responseJSON { (responseObj) -> Void in
            
            if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                print("\nResponse:\n\(JSON(resJson))")
                success(JSON(resJson))
                return
            }
            
            if case .failure(let error) = responseObj.result {
                print("\nError:\n\(error.localizedDescription)")
                failure(error)
                return
            }
        }
    }
    
    func requestPUTwithMethod(_ strURL: String, params: Parameters, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeaders:\n\(authHeaders)")
        print("\nRequest:\n\(params.prettyPrint())")
        
        AF.request(strURL, method: .put, parameters: params, encoding: JSONEncoding.default, headers: authHeaders).responseJSON { (responseObj) -> Void in
            
            if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                print("\nResponse:\n\(JSON(resJson))")
                success(JSON(resJson))
                return
            }
            
            if case .failure(let error) = responseObj.result {
                print("\nError:\n\(error.localizedDescription)")
                failure(error)
                return
            }
        }
    }
    
    func requestPUTwithMultipart(_ strURL: String, _ jsonData: Data, _ imgData: Data?, _ fileName: String, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeadersMultipart:\n\(authHeadersMultipart)")
        print("\nRequest:\n\(String(decoding: jsonData, as: UTF8.self))")
        
        AF.upload(multipartFormData: { (multipartFormData) in

            //
            if let unwrappedImgData = imgData {
                print("\(fileName) also appended")
                multipartFormData.append(unwrappedImgData, withName: "image", fileName: fileName, mimeType: "image/jpg")
            }
            multipartFormData.append(jsonData, withName: "data")

        }, to: strURL, usingThreshold: UInt64.init(), method: HTTPMethod.put, headers: authHeadersMultipart)
        .validate(statusCode: 200..<300)
        .response { (responseObj) in

            //
            if let err = responseObj.error {
                print(err.localizedDescription)
                failure(err)
                return
            }
            
            //
            switch responseObj.result {

            case .failure(let error):
                print("\nFailed:\n\(error.localizedDescription)")
                failure(error)
                return

            case .success( _):
                
                if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                    print("\nResponse:\n\(JSON(resJson))")
                    success(JSON(resJson))
                    return
                }
                
                if case .failure(let error) = responseObj.result {
                    print("\nError:\n\(error.localizedDescription)")
                    failure(error)
                    return
                }
            }

        }.uploadProgress { progress in
            print("Upload Progress: \(progress.fractionCompleted)")
        }
    }
    
    //
    // MARK:- DELETE
    //
    func requestDELETE(_ strURL: String, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        //
        print("\nURL:\n\(strURL)")
        print("\nauthHeaders:\n\(authHeaders)")
        
        AF.request(strURL, method: .delete, headers: authHeaders).responseJSON { (responseObj) -> Void in
            
            if case .success(let value) = responseObj.result, let resJson = responseObj.data {
                print("\nResponse:\n\(JSON(resJson))")
                success(JSON(resJson))
                return
            }
            
            if case .failure(let error) = responseObj.result {
                print("\nError:\n\(error.localizedDescription)")
                failure(error)
                return
            }
        }
    }
    
    func requestGETBrandList(_ strURL: String, success: @escaping (JSON) -> Void, failure: @escaping (Error) -> Void) {
        
        let headers = [
            "X-RapidAPI-Key": "47b2ffb646msh8d6be82707891d3p1dfd56jsn7af31ed1f971",
            "X-RapidAPI-Host": "motorcycle-specs-database.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: strURL)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print("\nError:\n\(error?.localizedDescription)")
                failure(error!)
            } else {
                if let listData = data{
                    print("\nResponse:\n\(JSON(listData))")
                    success(JSON(listData))
                }
            }
        })

        dataTask.resume()
    }
    
    func loadimage(url : String)-> UIImage{
        var img = UIImage()
        AF.request(url).response { response in
            if let data = response.data{
                if let ig = UIImage(data: data) {
                    img = ig
                }
            }
        }
        print(img)
        return img
    }
}

//
private let arrayParametersKey = "arrayParametersKey"

/// Extenstion that allows an array be sent as a request parameters
extension Array {
    /// Convert the receiver array to a `Parameters` object.
    func asParameters() -> Parameters {
        return [arrayParametersKey: self]
    }
}


/// Convert the parameters into a json array, and it is added as the request body.
/// The array must be sent as parameters using its `asParameters` method.
public struct ArrayEncoding: ParameterEncoding {
    
    /// The options for writing the parameters as JSON data.
    public let options: JSONSerialization.WritingOptions
    
    
    /// Creates a new instance of the encoding using the given options
    ///
    /// - parameter options: The options used to encode the json. Default is `[]`
    ///
    /// - returns: The new instance
    public init(options: JSONSerialization.WritingOptions = []) {
        self.options = options
    }
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var urlRequest = try urlRequest.asURLRequest()
        
        guard let parameters = parameters,
            let array = parameters[arrayParametersKey] else {
                return urlRequest
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: array, options: options)
            
            if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            }
            
            urlRequest.httpBody = data
            
        } catch {
            throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
        }
        
        return urlRequest
    }
}
