//
//  Constants.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 06/02/20.
//  Copyright © 2020 Irfan Ajmeri. All rights reserved.
//

import UIKit
//=========================================================================//
//
// MARK:- Common
//
let liveURL = "http://riyasatali-001-site1.htempurl.com/api/" // Live

let uatURL = "http://riyasatali-001-site1.htempurl.com/api/" // UAT

let developmentURL = "http://riyasatali-001-site1.htempurl.com/api/" // Development
 
let baseURL = developmentURL // remaining

// MARK:- Login API

let registerPost = "\(baseURL)UserDetails"

let bikeRegisterUrl = "\(baseURL)Bikes"

let GroupsURL = "\(baseURL)Groups"

let messageURL = "\(baseURL)Message"

let getProfileUrl = "\(baseURL)Profile/"

let PostProfileUrl = "\(baseURL)Profile/"


//
// MARK:- Global Var
//
let appTitle = "iSafe HCCBPL"
let defaults = UserDefaults.standard
let dateFormat = "dd.MMM.yyyy"
let twentyFourHourTimeFormat = "HH:mm"
let dateFormatForFileUpload = "yyyyMMddHHmmss"
let defaultFromDateStr = "01.Feb.2022" // remaining
let defaultToDateStr = "28.Feb.2022" // remaining
var isRefreshListWithAPICall: Bool = false


// MARK:- Activity Indicator aka Loader Show/Hide
let viewControllerUtils = ViewControllerUtils()
let viewControllerUtilsForSaveData = ViewControllerUtilsForSaveData()

// MARK:- minimumCharacterForChredential
let minimumCharacterForChredential: Int = 2

//
// MARK:- UIDesign Constants
//
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height
let statusBarHeight = UIApplication.shared.statusBarFrame.height
var yCoordinate: CGFloat = statusBarHeight + 44.0
var addMoreBTWidth: CGFloat = 122.0

//
// MARK:- Common enums
//
enum ModuleIdAll: Int {

    case IRIS = 5
    case BBS = 2
    case UC = 6
    case MOC = 37
}

// MARK:- UserType
enum UserType: String {
    
    case superadmin = "superadmin"
    case admin = "admin"
    case security = "security"
}

// MARK:- IRISEntryStatus
enum IRISEntryStatus: String {
    
    case complete = "complete"
    case inprogress = "inprogress"
}

// MARK:- BBSEntryStatus
enum BBSEntryStatus: String {

    case complete = "complete"
    case inprocess = "inprocess"
}

// MARK:- UCEntryStatus
enum UCEntryStatus: String {
    
    case complete = "complete"
    case inprocess = "inprocess"
}

// MARK:- Mode
enum Mode: String {
    
    case new = "new"
    case edit = "edit"
}

// MARK:- RecordStatus
enum RecordStatus: String {
    
    case insert = "insert"
    case update = "update"
}

// MARK:- ActionStatus
enum ActionStatus: Int {
    
    case No = 1 // Close
    case Yes = 8 // Open
}

// MARK:- ApprovalStatusIds
enum ApprovalStatusIds: Int {
    
    case Accepted = 100
    case Rejected = 101
    case Query = 102
}

// MARK:- ApprovalStatus
enum ApprovalStatus: String {
    
    case Accepted = "Y"
    case Rejected = "N"
    case Query = "Q"
}

// MARK:- OtherApprovalIds
enum OtherApprovalIds: Int {
    
    case NA = 100
    case Y = 101
    case N = 102
}

// MARK:- OtherApproval
enum OtherApproval: String {
    
    case NA = ""
    case Y = "Y"
    case N = "N"
}

// MARK:- WPMSFRPStatus
enum WPMSFRPStatus: String {
    
    case NA = "NA"
    case Yes = "Yes"
    case No = "No"
}

// MARK:- TaskVerification
enum TaskVerification: Int {

    case satisfied = 1
    case notSatisfied = 0
}

// MARK:- ReportIncidentType
enum ReportIncidentType: Int {
    
    case Nearmiss = 3
    case NonInjury = 2 // Property Damage, Environmental, Road, Fire, Dangerous Occurrence
    case Injury = 1
}

// MARK:- IncidentClassificationId
enum IncidentClassificationId: Int {
    
    case Nearmiss = 0
    case Fire = 6
    case Road = 4
    case Environment = 2
    case common = 1 // Injury, PropertyDamage
    case DangerousOccurrence = 5
}

// MARK:- RiderEmpTypeIds
enum RiderEmpTypeIds: Int {
    
    case NA = 0
    case Employee = 1
    case Other = 2
}

// MARK:- GenderType
enum GenderType: String {
    
    case Male = "Male"
    case Female = "Female"
}

// MARK:- EMChecklistType
enum EMChecklistType: String {

    case CV = "CV"
    case DM = "DM"
    case FL = "FL"
    case GM = "GM"
    case HV = "HV"
    case HC = "HC"
    case PT = "PT"
    case SC = "SC"
    case VE = "VE"
    case WM = "WM"
}

//
// MARK:- Common Messages
//
enum CommonMessages: String {
    
    case comingSoonMsg = "Coming Soon"
    case swwMsg = "Something went wrong, Please retry later"
    case requestMsg = "Request setup went wrong, Please retry later"
    case responseMsg = "Response setup went wrong, Please retry later"
    case noRecordsFoundStr = "No Records Found\nPlease select other dates"
    case noInternetStr = "Please make sure your device is connected to the Internet and try again"
    case loading = "Loading..."
    case noRecordsStr = "No Records Found"
}

//===============================//
//
// MARK:- Audit & Inspection
//
let aiListArr: [String] = [
    
    "Submit Ride Along Checklist",
    "View Ride Along Checklist"
]

let aiListImgArr: [String] = [
    
    "ic_report_common",
    "ic_view_list"
]

//===============================//
//
// MARK:- IRIS
//
let irisListArr: [String] = [

    "IRIS Dashboard",
    "Nearmiss Reporting",
    "Accident Reporting",
    "View / List of Incident",
    "Task Maintenance"
]

let irisListImgArr: [String] = [

    "ic_dashboard",
    "ic_report_common",
    "ic_report_common",
    "ic_view_list",
    "ic_task_maintenance"
]

// Accident Reporting
let accidentReportingListArr: [String] = [
    
    "Human Injury",
    "SIFp Near Miss Report"
]

//===============================//
//
// MARK:- BBS Observation
//
let bbsoListArr: [String] = [

    "BBS Observation Dashboard",
    "Report BBS Observation",
    "View / List of BBS Observation",
    "Task Maintenance"
]

let bbsoListImgArr: [String] = [

    "ic_dashboard",
    "ic_report_common",
    "ic_view_list",
    "ic_task_maintenance"
]

//===============================//
//
// MARK:- Contractor and Visitor Management
//
let cvmListArr: [String] = [
    
    "Dashboard",
    "Contractor Management",
    "Visitor Induction and Access Card",
    "Material and People Access Control"
]

let cvmListImgArr: [String] = [
    
    "ic_dashboard",
    "ic_cvm_cm",
    "ic_cvm_vm",
    "ic_cvm_em"
]

let cmListArr: [String] = [
    "Supervisor Selection and Renewal",
    "Selection and Renewal of Contractor Agency",
    "Contractor Access Card",
    "Contractor Access Card List"
]

let cmListImgArr: [String] = [
    "ic_view_list",
    "ic_view_list",
    "ic_view_list",
    "ic_view_list"
]

let vmListArr: [String] = [
    "Visitor Access Card",
    "Visitor Access Card Details List",
    "Driver Access Card",
    "Driver Access Card Details List",
    "Cleaner Access Card",
    "Cleaner Access Card Details List",
    "Employee Access Card",
    "Employee Access Card Details List"
]

let vmListImgArr: [String] = [
    "ic_view_list",
    "ic_view_list",
    "ic_view_list",
    "ic_view_list",
    "ic_view_list",
    "ic_view_list",
    "ic_view_list",
    "ic_view_list"
]

let emListArr: [String] = [
    "Equipment Checklist Details List"
]

let emListImgArr: [String] = [
    "ic_view_list"
]

//===============================//
//
// MARK:- Electronic Work Permit
//
let wpListArr: [String] = [
    
    "Work Permit Dashboard",
    "Manage Work Permits"
]

let wpListImgArr: [String] = [
    
    "ic_dashboard",
    "ic_view_list"
]

//===============================//
//
// MARK:- MOC
//
let mocListArr: [String] = [

    "MOC Dashboard",
    "View / List of MOC",
    "Task Maintenance"
]

let mocListImgArr: [String] = [

    "ic_dashboard",
    "ic_view_list",
    "ic_task_maintenance"
]

//===============================//
//
// MARK:- MIS Report
//
let misrListArr: [String] = [

    "MIS Report Dashboard",
    "Safety MIS"
]

let misrListImgArr: [String] = [

    "ic_view_list",
    "ic_report_common"
]

//===============================//
//
// MARK:- Unsafe Condition
//

let ucListArr: [String] = [
    
    "Unsafe Condition Dashboard",
    "Report Unsafe Condition",
    "View / List of Unsafe Condition",
    "Task Maintenance"
]

let ucListImgArr: [String] = [
    
    "ic_dashboard",
    "ic_report_common",
    "ic_view_list",
    "ic_task_maintenance"
]






