//
//  MessageCellView.swift
//  iSocialNet
//
//  Created by Miyo on 25/12/21.
//

import UIKit

class MessageCellView: UITableViewCell {
    
    static let NAME = "MessageCellView"
    
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPreview: UILabel!
    @IBOutlet weak var lblBubbleCount: UILabel!
    @IBOutlet weak var lblTimeAgo: UILabel!
    
    var data: MessageForCell? {
        didSet {
            guard let data = data else {
                return
            }
            setData(data: data)
        }
    }
    
    private func setData(data: MessageForCell) {
        imgProfile.sd_setImage(with: data.imageURL, completed: nil)
        lblName.text = data.userName
        if #available(iOS 13.0, *) {
            lblName.textColor = data.newMessages > 0 ? UIColor.init(named: "AccentColor") : UIColor.label
        } else {
            lblName.textColor = data.newMessages > 0 ? UIColor.init(named: "AccentColor") : UIColor.black
        }
        lblPreview.text = data.preview
        lblBubbleCount.isHidden = data.newMessages == 0
        lblBubbleCount.text = data.newMessages.description
        lblTimeAgo.text = data.timeAgo
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
