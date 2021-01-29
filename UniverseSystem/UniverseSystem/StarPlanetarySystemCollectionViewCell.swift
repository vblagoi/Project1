//
//  StarPlanetarySystemCollectionViewCell.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class StarPlanetarySystemCollectionViewCell: UICollectionViewCell {
        static let reuseID = "StarPlanetarySystemCollectionViewCell"
        
        var planetImageView = UIImageView()

        var planetType: UILabel = {
            let type = UILabel()
            type.translatesAutoresizingMaskIntoConstraints = false
            return type
        }()
        
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            planetImageView.translatesAutoresizingMaskIntoConstraints = false
            
            backgroundColor = .black
            addSubview(planetImageView)
            addSubview(planetType)
            
            setupLayout()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        private func setupLayout() {
            planetType.font = UIFont.systemFont(ofSize: 20.0)
            planetType.textColor = .white
            
            NSLayoutConstraint.activate([
                planetImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
                planetImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                
                planetType.centerYAnchor.constraint(equalTo: centerYAnchor),
                planetType.leadingAnchor.constraint(equalTo: planetImageView.trailingAnchor, constant: 20)
            ])
        }
}
