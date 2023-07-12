//
//  VariableStrings.swift
//  iSafeHCCBPL
//
//  Created by Keval Shah on 05/03/22.
//  Copyright © 2022 Irfan Ajmeri. All rights reserved.
//

import Foundation

//MARK: BBS Observation

//MARK: Report BBS Observation

        
//MARK: Category


struct categoryStrings{
    //MARK: Safe Unsafe Redio Buttons
    static let safeUnsafeObservation = "SafeUnsafeOb"
    static let ObservationSave = "ObservationSave"
    
    
    //MARK: Safe Observation
    static let safeObservaation = "SafeObservation"
    static let remark = "Remark"
    
    static let safeCategory = "safeCategory"
    static let safeSubCategory = "safeSubCategory"
    static let safeObservationtxt = "safeObservationtxt"
    static let safeRemarktxt = "Remark"
    
    //MARK: Unsafe Observation
    static let unsafeCategory = "unsafeCategory"
    static let unsafeSubCategory = "unsafeSubCategory"
    static let unsafeObservation = "UnsafeObservation"
    static let  barrier = "Barrier"
    static let subBarrier = "SubBarrier"
    static let futherActionRequired = "FAR"
    static let actionPlan = "AP"
    
}

struct safeObservationStrings{
    static let Id = "Id"
    static let CategoryId = "CategoryId"
    static let CategoryTitle = "CategoryTitle"
    static let SafeObservationDetail = "SafeObservationDetail"
    static let SafeObservationId = "SafeObservationId"
    static let SafetyRemarks = "SafetyRemarks"
    static let SubCategoryIds = "SubCategoryIds"
    static let SubCategoryTitles = "SubCategoryTitles"
}


struct unsafeObservationStrings{
    static let Id = "Id"
    static let ActionStatusId = "ActionStatusId"
    static let ActionStatusTitle = "ActionStatusTitle"
    static let ActionTaken = "ActionTaken"
    static let BarrierId = "BarrierId"
    static let BarrierTitle = "BarrierTitle"
    static let FocusAreaId = "FocusAreaId"
    static let FocusAreaTitle = "FocusAreaTitle"
    static let ResponsibleEmployeeId = "ResponsibleEmployeeId"
    static let ResponsibleEmployeeName = "ResponsibleEmployeeName"
    static let SeverityId = "SeverityId"
    static let SeverityTitle = "SeverityTitle"
    static let SubBarrierId = "SubBarrierId"
    static let SubBarrierTitle = "SubBarrierTitle"
    static let SubCategoryIds = "SubCategoryIds"
    static let SubCategoryTitles = "SubCategoryTitles"
    static let UnsafeObservationDetail = "UnsafeObservationDetail"
    static let UnsafeObservationId = "UnsafeObservationId"
}


struct notificationStrings{
    static let Id = "Id"
    static let title = "title"
    static let body = "body"
    static let isRead = "isRead"
}
