//
//  PlanetViewController.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class PlanetViewController: UIViewController {
    
    var planet: Planet?
    
    private let planetCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)
        view.addSubview(planetCollectionView)

        planetCollectionView.dataSource = self
        planetCollectionView.delegate = self
        planetCollectionView.register(PlanetCollectionViewCell.self, forCellWithReuseIdentifier: PlanetCollectionViewCell.reuseID)
    }
    
    private func setupLayouts() {
        planetCollectionView.translatesAutoresizingMaskIntoConstraints = false
        planetCollectionView.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)

        NSLayoutConstraint.activate([
            planetCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            planetCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            planetCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            planetCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PlanetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (planet?.satellites.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlanetCollectionViewCell.reuseID, for: indexPath) as! PlanetCollectionViewCell
        /*
         Mentor's comment:
         Typically you shouldn't touch view's layout in this method, this dramatically reduces performance of scroll
         by breaking the whole idea of reusing cells' views. And setting a corner radius definitely doesn't belong here.
         */
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
}
