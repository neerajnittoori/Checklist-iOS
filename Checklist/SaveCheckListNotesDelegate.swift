//
//  SaveCheckListNotesDelegate.swift
//  Checklist
//
//  Created by Neeraj Kumar Nittoori on 1/30/22.
//

import Foundation

protocol SaveCheckListNotesDelegate: AnyObject {
    func saveCheckList(itemNotes: String)
}
