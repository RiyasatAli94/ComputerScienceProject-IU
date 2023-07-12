/* 
Copyright (c) 2023 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct BikeModel : Codable {
	let brandName : String?
	let bikeModel : String?
	let bikeName : String?
	let registrationNo : String?
	let country : String?
	let km : String?
	let ryear : String?
	let color : String?
	let cc : String?
	let mobileNo : String?
	let bikeId : Int?

	enum CodingKeys: String, CodingKey {

		case brandName = "brandName"
		case bikeModel = "bikeModel"
		case bikeName = "bikeName"
		case registrationNo = "registrationNo"
		case country = "country"
		case km = "km"
		case ryear = "ryear"
		case color = "color"
		case cc = "cc"
		case mobileNo = "mobileNo"
		case bikeId = "bikeId"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		brandName = try values.decodeIfPresent(String.self, forKey: .brandName)
		bikeModel = try values.decodeIfPresent(String.self, forKey: .bikeModel)
		bikeName = try values.decodeIfPresent(String.self, forKey: .bikeName)
		registrationNo = try values.decodeIfPresent(String.self, forKey: .registrationNo)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		km = try values.decodeIfPresent(String.self, forKey: .km)
		ryear = try values.decodeIfPresent(String.self, forKey: .ryear)
		color = try values.decodeIfPresent(String.self, forKey: .color)
		cc = try values.decodeIfPresent(String.self, forKey: .cc)
		mobileNo = try values.decodeIfPresent(String.self, forKey: .mobileNo)
		bikeId = try values.decodeIfPresent(Int.self, forKey: .bikeId)
	}

}
