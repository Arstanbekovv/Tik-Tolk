//
//  ViewController.swift
//  Tik-Tolk
//
//  Created by Aziz on 14/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { //UICollectionViewDataSource .  UICollectionViewDelegate UICollectionViewDelegateFlowLayout
    
    private var ticTok: [File] = []
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.register(TestCellWork.self, forCellWithReuseIdentifier: "TestCellWork")
        return view
    }()
    
    override func viewDidLoad() {
        setupSubviews()
    }
    private func setupSubviews() {
        view.addSubview(collectionView)
        
        ticTok.append(File(image: "01"))
        ticTok.append(File(image: "02"))
        ticTok.append(File(image: "03"))
        ticTok.append(File(image: "04"))
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(
            width: view.frame.width,
            height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ticTok.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TestCellWork", for: indexPath) as! TestCellWork
        let model = ticTok[index]
        cell.photo.image = UIImage(named: model.photo)
        
        return cell
    }
}
