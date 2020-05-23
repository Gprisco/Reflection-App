//
//  MoodViewController.swift
//  Reflection App
//
//  Created by Lorenzo on 15/05/2020.
//  Copyright © 2020 Giovanni Prisco. All rights reserved.
//

import UIKit
import ScalingCarousel

class MoodViewController: UIViewController {
    
    var reflectionDelegate: ReflectionDelegate!
    
    @IBOutlet var backgroundImage: UIImageView!
    var backgroundImageName: String!
    
    var moods = ["Felice", "Triste", "Arrabbiato", "Voglioso di Cazzo", "Felice", "Triste", "Arrabbiato", "Voglioso di Cazzo"]
    
    @IBOutlet weak var scalingCarousel: ScalingCarouselView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scalingCarousel.dataSource = self
        scalingCarousel.delegate = self
        
        scalingCarousel.backgroundColor = .none
        
        self.backgroundImage.image = UIImage(named: self.backgroundImageName)
        
        let width = scalingCarousel.bounds.width
        scalingCarousel.inset = 103
        print(width / 4 )
        
    }
}

extension MoodViewController: UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moods.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "moodCell", for: indexPath)
        
        if let scalingCell = cell as? MoodCell {
//            scalingCell.moodLabel.text = moods[indexPath.item]
        }
        
        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        reflectionDelegate.onMoodChoice(mood: moods[indexPath.item])
        reflectionDelegate.nextStep()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scalingCarousel.didScroll()
    }
}