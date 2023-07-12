//
//  GroupModel.swift
//  MyRide
//
//  Created by Keval Shah on 21/02/23.
//

import Foundation
import UIKit


enum Throwable<T: Decodable>: Decodable {
    case success(T)
    case failure(Error)
    
    init(from decoder: Decoder) throws {
        do {
            let decoded = try T(from: decoder)
            self = .success(decoded)
        } catch let error {
            self = .failure(error)
        }
    }
}
