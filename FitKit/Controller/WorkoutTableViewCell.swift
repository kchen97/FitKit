//
//  TableViewCell.swift
//  FitKit
//
//  Created by Korman Chen on 3/8/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class WorkoutTableViewCell: UITableViewCell {
    
    let name: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.red
        label.font = UIFont(name: label.font.fontName, size: 50)
        
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup() {
        contentView.addSubview(name)
        
        name.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        name.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16).isActive = true
        name.widthAnchor.constraint(equalToConstant: 100).isActive = true
        name.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
