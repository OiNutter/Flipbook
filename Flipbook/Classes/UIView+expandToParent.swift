//
//  UIView+expandToParent.swift
//  FBSnapshotTestCase
//
//  Created by Will McKenzie on 24/08/2018.
//

import UIKit

extension UIView {
    func expandToParent(_ parent:UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: parent.widthAnchor, multiplier: 1).isActive = true
        self.heightAnchor.constraint(equalTo: parent.heightAnchor, multiplier: 1).isActive = true
    }
}
