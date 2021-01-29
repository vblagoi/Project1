//
//  GalaxyCollectionViewCell.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class GalaxyCollectionViewCell: UICollectionViewCell {
    static let reuseID = "GalaxyCollectionViewCell"
    
    var starPlanetSystemImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "StarPlanetarySystem")
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var starPlanetSystemName: UILabel = {
        let name = UILabel()
        name.text = "System"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    var starPlanetSystemAge: UILabel = {
        let age = UILabel()
        age.translatesAutoresizingMaskIntoConstraints = false
        return age
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .black
        addSubview(starPlanetSystemImageView)
        addSubview(starPlanetSystemName)
        addSubview(starPlanetSystemAge)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {        
        starPlanetSystemName.font = UIFont.systemFont(ofSize: 20.0)
        starPlanetSystemName.textColor = .white
        starPlanetSystemAge.font = UIFont.systemFont(ofSize: 20.0)
        starPlanetSystemAge.textColor = .white
        
        NSLayoutConstraint.activate([
            starPlanetSystemImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            starPlanetSystemImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            starPlanetSystemName.centerYAnchor.constraint(equalTo: centerYAnchor),
            starPlanetSystemName.leadingAnchor.constraint(equalTo: starPlanetSystemImageView.trailingAnchor, constant: 50),
            
            starPlanetSystemAge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            starPlanetSystemAge.topAnchor.constraint(equalTo: topAnchor),
            starPlanetSystemAge.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
