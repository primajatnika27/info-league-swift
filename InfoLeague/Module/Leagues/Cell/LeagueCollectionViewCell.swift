//
//  LeagueCollectionViewCell.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 20/11/23.
//

import UIKit

class LeagueCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    
    func setup(with data: LeaguesModel) {
        labelText.text = data.name
        
        let url = URL(string: data.logo)
        
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
