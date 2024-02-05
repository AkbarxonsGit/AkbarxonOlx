//
//  Chatswift
//  First project
//
//  Created by Akbarkhon Akramov on 07/01/24.
//

import UIKit

final class ChatCell : UITableViewCell {
    
    let leftlabel = InsetLabel()
    let rightlabel = InsetLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(leftlabel)
        contentView.addSubview(rightlabel)
        
        leftlabel.layer.cornerRadius = 8
        rightlabel.layer.cornerRadius = 8
        leftlabel.clipsToBounds = true
        rightlabel.clipsToBounds = true
        
        leftlabel.numberOfLines = 0
        rightlabel.numberOfLines = 0
        
        leftlabel.font = .systemFont(ofSize: 15)
        rightlabel.font = .systemFont(ofSize: 15)
        
        leftlabel.setConstraint(.left, from: contentView, 10)
//      leftlabel.setConstraint(.right, from: contentView, UIScreen.main.bounds.width / 2)
        leftlabel.setConstraint(.top, from: contentView, 5)
        leftlabel.setConstraint(.bottom, from: contentView, 5)
        leftlabel.textInsets = .init(top: 5, left: 10, bottom: 3, right: 10)
        
//      rightlabel.setConstraint(.left, from: contentView, UIScreen.main.bounds.width / 2)
        rightlabel.setConstraint(.right, from: contentView, 10)
        rightlabel.setConstraint(.top, from: contentView, 5)
        rightlabel.setConstraint(.bottom, from: contentView, 5)
        rightlabel.textInsets = .init(top: 5, left: 10, bottom: 3, right: 10)
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: ChatData) {
        
        let labelWidth = (data.message as NSString).size(
            withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]).width
        let constraintPoint = labelWidth <= (UIScreen.main.bounds.width / 2) ? labelWidth: (UIScreen.main.bounds.width / 2)
        
        
        if data.direction == .left {
            leftlabel.text = data.message
            leftlabel.backgroundColor = .systemBlue
            if data.message.count == 1 {
                leftlabel.setConstraint(.width, from: contentView, UIScreen.main.bounds.width / 3)
            }else {
                leftlabel.setConstraint(.width, from: contentView, constraintPoint + 22)
            }
        } else {
            rightlabel.text = data.message
            rightlabel.backgroundColor = .green
            if data.message.count == 1 {
                rightlabel.setConstraint(.width, from: contentView, UIScreen.main.bounds.width / 3)
            }else {
                rightlabel.setConstraint(.width, from: contentView, constraintPoint + 22)
            }
            
        }
        
        if data.message.count == 1 {
            if data.direction == .left {
                leftlabel.font = .boldSystemFont(ofSize: 80)
                leftlabel.backgroundColor = .clear
                leftlabel.textAlignment = .center
            } else {
                    rightlabel.font = .boldSystemFont(ofSize: 80)
                    rightlabel.backgroundColor = .clear
                    rightlabel.textAlignment = .center
                }
            }
        }
    
    
}


extension UIView {
    enum Anchor {
        case left
        case right
        case height
        case width
        case top
        case bottom
    }
    
    func setConstraint(_ anchor: Anchor, from view: UIView, _ constraint: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch anchor{
        case .left:
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constraint).isActive = true
        case .right:
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constraint).isActive = true
        case .height:
            self.heightAnchor.constraint(equalToConstant: constraint).isActive = true
        case .width:
            self.widthAnchor.constraint(equalToConstant: constraint).isActive = true
        case .top:
            self.topAnchor.constraint(equalTo: view.topAnchor, constant: constraint).isActive = true
        case .bottom:
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constraint).isActive = true
        }
    }
}

class InsetLabel: UILabel {
    // UIEdgeInsets for top, left, bottom, and right padding
    var textInsets = UIEdgeInsets.zero {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }

    override var intrinsicContentSize: CGSize {
        let contentSize = super.intrinsicContentSize
        let width = contentSize.width + textInsets.left + textInsets.right
        let height = contentSize.height + textInsets.top + textInsets.bottom
        return CGSize(width: width, height: height)
    }
}

