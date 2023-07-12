/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct RiderList : Codable {
	let riderName : String?
	let riderMobileNumbr : String?
	let riderBikeName : String?
	let riderID : String?
	let riderCompletedKM : Int?
	let riderImg : String?
	let isRiderJoin : Bool?
	let riderStatus : String?
	let riderRank : Int?
	let riderEmergencyContact : String?
	let riderOtherEmergencyContact : String?

	enum CodingKeys: String, CodingKey {

		case riderName = "RiderName"
		case riderMobileNumbr = "RiderMobileNumbr"
		case riderBikeName = "RiderBikeName"
		case riderID = "RiderID"
		case riderCompletedKM = "RiderCompletedKM"
		case riderImg = "RiderImg"
		case isRiderJoin = "isRiderJoin"
		case riderStatus = "RiderStatus"
		case riderRank = "RiderRank"
		case riderEmergencyContact = "RiderEmergencyContact"
		case riderOtherEmergencyContact = "RiderOtherEmergencyContact"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		riderName = try values.decodeIfPresent(String.self, forKey: .riderName)
		riderMobileNumbr = try values.decodeIfPresent(String.self, forKey: .riderMobileNumbr)
		riderBikeName = try values.decodeIfPresent(String.self, forKey: .riderBikeName)
		riderID = try values.decodeIfPresent(String.self, forKey: .riderID)
		riderCompletedKM = try values.decodeIfPresent(Int.self, forKey: .riderCompletedKM)
		riderImg = try values.decodeIfPresent(String.self, forKey: .riderImg)
		isRiderJoin = try values.decodeIfPresent(Bool.self, forKey: .isRiderJoin)
		riderStatus = try values.decodeIfPresent(String.self, forKey: .riderStatus)
		riderRank = try values.decodeIfPresent(Int.self, forKey: .riderRank)
		riderEmergencyContact = try values.decodeIfPresent(String.self, forKey: .riderEmergencyContact)
		riderOtherEmergencyContact = try values.decodeIfPresent(String.self, forKey: .riderOtherEmergencyContact)
	}

}