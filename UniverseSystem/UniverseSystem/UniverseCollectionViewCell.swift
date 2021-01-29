//
//  UniverseCollectionViewCell.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class UniverseCollectionViewCell: UICollectionViewCell {
    static let reuseID = "UniverseCollectionViewCell"
    
    var galaxyImageView = UIImageView()

    var galaxyType: UILabel = {
        let type = UILabel()
        type.translatesAutoresizingMaskIntoConstraints = false
        return type
    }()
    
    var galaxyAge: UILabel = {
        let age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        return age
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        galaxyImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .black
        addSubview(galaxyImageView)
        addSubview(galaxyType)
        addSubview(galaxyAge)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        galaxyType.font = UIFont.systemFont(ofSize: 20.0)
        galaxyType.textColor = .white
        galaxyAge.font = UIFont.systemFont(ofSize: 20.0)
        galaxyAge.textColor = .white
        
        NSLayoutConstraint.activate([
            galaxyImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            galaxyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            galaxyType.centerYAnchor.constraint(equalTo: centerYAnchor),
            galaxyType.leadingAnchor.constraint(equalTo: galaxyImageView.trailingAnchor, constant: 10),
            
            galaxyAge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            galaxyAge.topAnchor.constraint(equalTo: topAnchor),
            galaxyAge.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
