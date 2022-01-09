//
//  NotificationPostCellView.swift
//  iSocialNet
//
//  Created by Miyo on 26/12/21.
//

import UIKit

class NotificationPostCellView: UITableViewCell {

    static let NAME = "NotificationPostCellView"
    
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblComment: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    var data: NotificationPostForCell? {
        didSet {
            guard let data = data else {
                return
            }
            setData(data: data)
        }
    }
    
    private func setData(data: NotificationPostForCell) {
        imgUser.sd_setImage(with: data.userImage, completed: nil)
        lblName.text = data.userName
        lblDetail.text = data.detail
        lblComment.text = data.comment
        lblTime.text = data.time
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
