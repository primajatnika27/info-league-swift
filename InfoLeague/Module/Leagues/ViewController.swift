//
//  ViewController.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 19/11/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    var data = [LeaguesModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let usecase = Injection.init().provideLeagues()
        
        let presenter = LeaguesPresenter(usecase: usecase)
        
        presenter.getLeagues()
            .observe(on: MainScheduler.instance)
            .subscribe { result in
                self.data = result
            } onError: { _ in
                
            } onCompleted: {
                self.collectionView.reloadData()
            }.disposed(by: disposeBag)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "leagueCollectionCell", for: indexPath) as? LeagueCollectionViewCell {
            let league: LeaguesModel?
            league = data[indexPath.row]
            cell.setup(with: league!)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showClubNavigation", sender: data[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showClubNavigation" {
            if let clubViewController = segue.destination as? ClubViewController {
                clubViewController.leagueModel = sender as? LeaguesModel
            }
        }
    }
}
