//
//  CheckListNotesViewController.swift
//  Checklist
//
//  Created by Neeraj Kumar Nittoori on 1/30/22.
//

import UIKit

class CheckListNotesViewController: UIViewController {
    
    @IBOutlet weak var checkListNotes: UITextView!
    weak var delegate: SaveCheckListNotesDelegate?
    
    init(delegate: SaveCheckListNotesDelegate?) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkListNotes.becomeFirstResponder()
        self.isModalInPresentation = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveAndDismissChecklistNotes))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissVC))
    }
    
    @objc private func dismissVC() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveAndDismissChecklistNotes() {
        if checkListNotes.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            dismissVC()
            return
        }
        self.delegate?.saveCheckList(itemNotes: checkListNotes.text)
        dismissVC()
        
    }
}
