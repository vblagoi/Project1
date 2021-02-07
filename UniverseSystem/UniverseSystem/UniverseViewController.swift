//
//  UniverseViewController.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class UniverseViewController: UIViewController {
    
    var universe = Universe(radiusForBlackHole: 50, weightForBlackHole: 50)
    
    private let universeCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)
        view.addSubview(universeCollectionView)
        
        universe.delegate = self
        universeCollectionView.dataSource = self
        universeCollectionView.delegate = self
        universeCollectionView.register(UniverseCollectionViewCell.self, forCellWithReuseIdentifier: UniverseCollectionViewCell.reuseID)
        
    }
    
    private func setupLayouts() {
        universeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        universeCollectionView.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)

        NSLayoutConstraint.activate([
            universeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            universeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            universeCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            universeCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension UniverseViewController: UniverseDelegate {
    func galaxyDidAppear() {
        universeCollectionView.reloadData()
    }
}

extension UniverseViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return universe.galaxys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UniverseCollectionViewCell.reuseID, for: indexPath) as! UniverseCollectionViewCell
        
        cell.galaxyType.text = universe.galaxys[indexPath.row].stringType()
        cell.galaxyImageView.image = UIImage(named: universe.galaxys[indexPath.row].stringType())
        cell.galaxyAge.text = String(universe.galaxys[indexPath.row].age) + " sec"
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        /*
         Mentor's comment:
         I like that you kept everything simple and straightforward, this helps a lot
         to understand and maintain your code 👍. However I'd rather moved the code below to a coordinator
         objct. Google about the coordinator pattern for iOS navigation. Applying this pattern helps
         avoiding the Massive View Controller problem.
         */
        let vc = storyboard?.instantiateViewController(identifier: "GalaxyViewController") as! GalaxyViewController
        vc.galaxy = universe.galaxys[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
}



