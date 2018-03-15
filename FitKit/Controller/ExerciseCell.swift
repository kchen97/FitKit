//
//  ExerciseCell.swift
//  FitKit
//
//  Created by Korman Chen on 3/15/18.
//  Copyright © 2018 Korman Chen. All rights reserved.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    lazy var finishButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(handleFinish), for: .touchUpInside)
        button.setTitle("Done", for: .normal)
        button.backgroundColor = UIColor.green
        return button
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
        contentView.addSubview(finishButton)
        
        finishButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        finishButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        finishButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        finishButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    @objc func handleFinish() {
        print("finish pressed")
    }
}
