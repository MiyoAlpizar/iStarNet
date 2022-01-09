//
//  ProfileHeaderView.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPlace: UILabel!
    @IBOutlet weak var lblPostCount: UILabel!
    
    class func instanceFromNib() -> ProfileHeaderView {
        return UINib(nibName: "ProfileHeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ProfileHeaderView
    }
}
