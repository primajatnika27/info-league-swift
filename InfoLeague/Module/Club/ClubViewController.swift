//
//  ClubViewController.swift
//  InfoLeague
//
//  Created by Prima Jatnika on 22/11/23.
//

import UIKit
import RxSwift

class ClubViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    var leagueModel: LeaguesModel? = nil
    var data = [ClubModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let usecase = Injection.init().provideClub()
        let presenter = ClubPresenter(usecase: usecase)
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        if let result = leagueModel {
            self.title = result.name
            presenter.getClubByIdLeague(from: result.id)
                .observe(on: MainScheduler.instance)
                .subscribe { resultClub in
                    self.data = resultClub
                } onError: { error in
                    self.setupAlert(desc: error.localizedDescription)
                } onCompleted: {
                    self.collectionView.reloadData()
                } .disposed(by: disposeBag)
        }
    }
    
    func setupAlert(desc: String) {
        let alert = UIAlertController(title: "Failed", message: desc, preferredStyle: .alert)
        let action =  UIAlertAction(title: "batal", style: .cancel) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension ClubViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clubCollectionCell", for: indexPath) as? ClubCollectionViewCell {
            let club: ClubModel?
            club = data[indexPath.row]
            cell.setup(with: club ?? ClubModel(id: "1", name: "A", image: ""))
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}

extension ClubViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 230)
    }
}
