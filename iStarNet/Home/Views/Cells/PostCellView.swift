//
//  PostCell.swift
//  iSocialNet
//
//  Created by Miyo on 24/12/21.
//

import UIKit
import SDWebImage

class PostCellView: UITableViewCell {
    
    static let NAME = "PostCellView"
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var imgPost: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var imgHeightConstraint: NSLayoutConstraint!
    
    var data: PostForCell? {
        didSet {
            guard let data = data else {
                return
            }
            setData(data: data)
        }
    }
    
    private func setData(data: PostForCell) {
        lblName.text = data.userName
        lblDate.text = data.date
        lblComment.text = data.comments
        lblPrice.text = data.likes
        
        if let img = data.userImage {
            imgProfile.sd_setImage(with: img, completed: nil)
        }
        
        if let img = data.imageUrl {
            imgHeightConstraint.constant = 160
            imgPost.sd_setImage(with: img, completed: nil)
        }else {
            imgHeightConstraint.constant = 0
        }
        
        if data.currentUserLiked {
            //btnLike.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        }else {
            //btnLike.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        imgHeightConstraint.constant = 160
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
