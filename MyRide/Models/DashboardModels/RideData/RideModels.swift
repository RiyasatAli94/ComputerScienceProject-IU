/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct RideModels : Codable {
	let rideID : Int?
	let rideStartDate : String?
	let rideTotalKM : Int?
	let rideCost : Int?
	let rideEndDate : String?
	let rideEndTime : String?
	let rideMeetingTime : String?
	let flagOffTime : String?
	let isRideCompleted : Bool?
	let rideName : String?
	let rideStartPoint : String?
	let rideEndPoint : String?
	let rideStartPointLatitute : String?
	let rideStartPointLongtitute : String?
	let rideEndPointLatitute : String?
	let rideEndPointLongtitute : String?
	let food : [Food]?
	let riderList : [RiderList]?

	enum CodingKeys: String, CodingKey {

		case rideID = "RideID"
		case rideStartDate = "RideStartDate"
		case rideTotalKM = "RideTotalKM"
		case rideCost = "RideCost"
		case rideEndDate = "RideEndDate"
		case rideEndTime = "RideEndTime"
		case rideMeetingTime = "RideMeetingTime"
		case flagOffTime = "FlagOffTime"
		case isRideCompleted = "isRideCompleted"
		case rideName = "RideName"
		case rideStartPoint = "RideStartPoint"
		case rideEndPoint = "RideEndPoint"
		case rideStartPointLatitute = "RideStartPointLatitute"
		case rideStartPointLongtitute = "RideStartPointLongtitute"
		case rideEndPointLatitute = "RideEndPointLatitute"
		case rideEndPointLongtitute = "RideEndPointLongtitute"
		case food = "Food"
		case riderList = "RiderList"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		rideID = try values.decodeIfPresent(Int.self, forKey: .rideID)
		rideStartDate = try values.decodeIfPresent(String.self, forKey: .rideStartDate)
		rideTotalKM = try values.decodeIfPresent(Int.self, forKey: .rideTotalKM)
		rideCost = try values.decodeIfPresent(Int.self, forKey: .rideCost)
		rideEndDate = try values.decodeIfPresent(String.self, forKey: .rideEndDate)
		rideEndTime = try values.decodeIfPresent(String.self, forKey: .rideEndTime)
		rideMeetingTime = try values.decodeIfPresent(String.self, forKey: .rideMeetingTime)
		flagOffTime = try values.decodeIfPresent(String.self, forKey: .flagOffTime)
		isRideCompleted = try values.decodeIfPresent(Bool.self, forKey: .isRideCompleted)
		rideName = try values.decodeIfPresent(String.self, forKey: .rideName)
		rideStartPoint = try values.decodeIfPresent(String.self, forKey: .rideStartPoint)
		rideEndPoint = try values.decodeIfPresent(String.self, forKey: .rideEndPoint)
		rideStartPointLatitute = try values.decodeIfPresent(String.self, forKey: .rideStartPointLatitute)
		rideStartPointLongtitute = try values.decodeIfPresent(String.self, forKey: .rideStartPointLongtitute)
		rideEndPointLatitute = try values.decodeIfPresent(String.self, forKey: .rideEndPointLatitute)
		rideEndPointLongtitute = try values.decodeIfPresent(String.self, forKey: .rideEndPointLongtitute)
		food = try values.decodeIfPresent([Food].self, forKey: .food)
		riderList = try values.decodeIfPresent([RiderList].self, forKey: .riderList)
	}

}
