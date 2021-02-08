//
//  StarPlanetarySystemViewController.swift
//  UniverseSystem
//
//  Created by Вова Благой on 28.01.2021.
//

import UIKit

class StarPlanetarySystemViewController: UIViewController {
    
    var system: StarPlanetarySystem? {
        didSet {
            starImageView.image = UIImage(named: (system?.star.stringType())!)
            starType.text = "Type Of Star: " + (system?.star.stringType())!
            starEvolveLevel.text = "Evolve level: " + (system?.star.stringEvolve())!
        }
    }
    var starImageView = UIImageView()
    var starType = UILabel()
    var starEvolveLevel = UILabel()
    
    var starView = UIView()
    
    private let systemCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayouts()
    }
    
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)
        view.addSubview(systemCollectionView)
        view.addSubview(starView)
        
        starView.addSubview(starImageView)
        starView.addSubview(starType)
        starView.addSubview(starEvolveLevel)
        
        system!.delegate = self
        systemCollectionView.dataSource = self
        systemCollectionView.delegate = self
        systemCollectionView.register(StarPlanetarySystemCollectionViewCell.self, forCellWithReuseIdentifier: StarPlanetarySystemCollectionViewCell.reuseID)
        
    }
    
    private func setupLayouts() {
        starView.frame = CGRect(x: 0, y: 65, width: view.frame.width, height: 150)

        starType.translatesAutoresizingMaskIntoConstraints = false
        starEvolveLevel.translatesAutoresizingMaskIntoConstraints = false
        
        /*
         Mentor's comment:
         It's better to create a dedicated class for a view you want to configure in a way you do below.
         Otherwise your view controller becomes very massive (the famous Massive View Controller issue).
         */
        starType.textColor = .white
        starType.font = UIFont.systemFont(ofSize: 20.0)
        starEvolveLevel.textColor = .white
        starEvolveLevel.font = UIFont.systemFont(ofSize: 13.0)
        
        starImageView.frame = CGRect(x: 25, y: 25, width: 100, height: 100)
        starView.backgroundColor = .black
        
        NSLayoutConstraint.activate([
            starType.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 15),
            starType.topAnchor.constraint(equalTo: starView.topAnchor, constant: 40),
            
            starEvolveLevel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 15),
            starEvolveLevel.topAnchor.constraint(equalTo: starType.bottomAnchor, constant: 10)
        ])
        
        systemCollectionView.translatesAutoresizingMaskIntoConstraints = false
        systemCollectionView.backgroundColor = #colorLiteral(red: 0.9254694581, green: 0.9256245494, blue: 0.9254490733, alpha: 1)

        NSLayoutConstraint.activate([
            systemCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            systemCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            systemCollectionView.topAnchor.constraint(equalTo: starView.bottomAnchor, constant: 15),
            systemCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension StarPlanetarySystemViewController: StarPlanetarySystemDelegate {
    func planetDidAppear() {
        systemCollectionView.reloadData()
    }
}

extension StarPlanetarySystemViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (system?.planets.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StarPlanetarySystemCollectionViewCell.reuseID, for: indexPath) as! StarPlanetarySystemCollectionViewCell
        
        cell.planetType.text = system?.planets[indexPath.row].stringType()
        cell.planetImageView.image = UIImage(named: (system?.planets[indexPath.row].stringType())!)
        cell.layer.cornerRadius = 10
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "PlanetViewController") as! PlanetViewController
        vc.planet = system?.planets[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
}


