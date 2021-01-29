//
//  GalaxyViewController.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class GalaxyViewController: UIViewController {
    var galaxy: Galaxy?
    
    private let galaxyCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)
        view.addSubview(galaxyCollectionView)
        
        galaxy!.delegate = self
        galaxyCollectionView.dataSource = self
        galaxyCollectionView.delegate = self
        galaxyCollectionView.register(GalaxyCollectionViewCell.self, forCellWithReuseIdentifier: GalaxyCollectionViewCell.reuseID)
        
    }
    
    private func setupLayouts() {
        galaxyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        galaxyCollectionView.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)

        NSLayoutConstraint.activate([
            galaxyCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galaxyCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galaxyCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            galaxyCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension GalaxyViewController: GalaxyDelegate {
    func systemDidAppear() {
        galaxyCollectionView.reloadData()
    }
}

extension GalaxyViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (galaxy?.starPlanetSystems.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalaxyCollectionViewCell.reuseID, for: indexPath) as! GalaxyCollectionViewCell
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "StarPlanetarySystemViewController") as! StarPlanetarySystemViewController
        vc.system = galaxy?.starPlanetSystems[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
}




