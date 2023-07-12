/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GroupModels : Codable {
    let groupId : Int?
	let groupImg : String?
	let groupName : String?
	let groupLastTime : String?
	let groupLastMessage : String?
    let isNewMessage: Bool?
    let newMessageCount: String?

	enum CodingKeys: String, CodingKey {

		case groupImg = "GroupImg"
		case groupName = "GroupName"
		case groupLastTime = "GroupLastTime"
		case groupLastMessage = "GroupLastMessage"
        case isNewMessage = "IsNewMessage"
        case newMessageCount = "NewMessageCount"
        case groupId = "GroupId"
        
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		groupImg = try values.decodeIfPresent(String.self, forKey: .groupImg)
		groupName = try values.decodeIfPresent(String.self, forKey: .groupName)
		groupLastTime = try values.decodeIfPresent(String.self, forKey: .groupLastTime)
		groupLastMessage = try values.decodeIfPresent(String.self, forKey: .groupLastMessage)
        isNewMessage = try values.decodeIfPresent(Bool.self, forKey: .isNewMessage)
        newMessageCount = try values.decodeIfPresent(String.self, forKey: .newMessageCount)
        groupId = try values.decodeIfPresent(Int.self, forKey: .groupId)
	}

}

struct rideModel : Codable {
    let rideId : Int?
    let rideName : String?
    let startDate : String?
    let endDate : String?
    let weekName : String?
    let startLocation: String?
    let endLocation: String?
    let meetingTime: String?
    let breifingtTime: String?
    let flagTime: String?
    let cost: String?
    let MealPlan: String?

    enum CodingKeys: String, CodingKey {

        case rideId = "rideId"
        case rideName = "rideName"
        case startDate = "startDate"
        case endDate = "endDate"
        case weekName = "weekName"
        case startLocation = "startLocation"
        case endLocation = "endLocation"
        case meetingTime = "meetingTime"
        case breifingtTime = "breifingtTime"
        case flagTime = "flagTime"
        case cost = "cost"
        case MealPlan = "MealPlan"
        
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rideId = try values.decodeIfPresent(Int.self, forKey: .rideId)
        rideName = try values.decodeIfPresent(String.self, forKey: .rideName)
        startDate = try values.decodeIfPresent(String.self, forKey: .startDate)
        endDate = try values.decodeIfPresent(String.self, forKey: .endDate)
        weekName = try values.decodeIfPresent(String.self, forKey: .weekName)
        startLocation = try values.decodeIfPresent(String.self, forKey: .startLocation)
        endLocation = try values.decodeIfPresent(String.self, forKey: .endLocation)
        meetingTime = try values.decodeIfPresent(String.self, forKey: .meetingTime)
        breifingtTime = try values.decodeIfPresent(String.self, forKey: .breifingtTime)
        flagTime = try values.decodeIfPresent(String.self, forKey: .flagTime)
        cost = try values.decodeIfPresent(String.self, forKey: .cost)
        MealPlan = try values.decodeIfPresent(String.self, forKey: .MealPlan)
    }

}
