//
//  PlanetCollectionViewCell.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    static let reuseID = "PlanetCollectionViewCell"
    
    var satelliteImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "Satellite")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var satelliteName: UILabel = {
        let name = UILabel()
        name.text = "Satellite"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        satelliteImageView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundColor = .black
        addSubview(satelliteImageView)
        addSubview(satelliteName)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        satelliteName.font = UIFont.systemFont(ofSize: 20.0)
        satelliteName.textColor = .white
        
        NSLayoutConstraint.activate([
            satelliteImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            satelliteImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            satelliteName.centerYAnchor.constraint(equalTo: centerYAnchor),
            satelliteName.leadingAnchor.constraint(equalTo: satelliteImageView.trailingAnchor, constant: 40)
        ])
    }
}
