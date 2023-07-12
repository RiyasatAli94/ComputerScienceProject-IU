/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct ProfileGet : Codable {
	let profileId : Int?
	let userId : Int?
	let profileurl : String?
	let name : String?
	let email : String?
	let mobileNumber : String?
	let dob : String?
	let gender : String?
	let country : String?
	let myrideid : Int?
	let isEdit : Int?

	enum CodingKeys: String, CodingKey {

		case profileId = "profileId"
		case userId = "userId"
		case profileurl = "profileurl"
		case name = "name"
		case email = "email"
		case mobileNumber = "mobileNumber"
		case dob = "dob"
		case gender = "gender"
		case country = "country"
		case myrideid = "myrideid"
		case isEdit = "isEdit"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		profileId = try values.decodeIfPresent(Int.self, forKey: .profileId)
		userId = try values.decodeIfPresent(Int.self, forKey: .userId)
		profileurl = try values.decodeIfPresent(String.self, forKey: .profileurl)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		mobileNumber = try values.decodeIfPresent(String.self, forKey: .mobileNumber)
		dob = try values.decodeIfPresent(String.self, forKey: .dob)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		myrideid = try values.decodeIfPresent(Int.self, forKey: .myrideid)
		isEdit = try values.decodeIfPresent(Int.self, forKey: .isEdit)
	}

}
