//
//  ClubCollectionViewCell.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 22/11/23.
//

import UIKit

class ClubCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func setup(with data: ClubModel) {
        labelText.text = data.name
        
        let url = URL(string: data.image)
        
        Task {
            do {
                let data = try await ImageLoader.init().loadItems(from: url!)
                self.imageView.image = UIImage(data: data)
            } catch(let error) {
                print("Error: \(error.localizedDescription)")
            }
        }

    }
}
