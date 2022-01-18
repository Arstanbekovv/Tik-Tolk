//
//  ScrollFile.swift
//  Tik-Tolk
//
//  Created by Aziz on 14/1/22.
//

import Foundation
import UIKit
import SnapKit

// это кастомная ячейка которая наследуется от UICollectionViewCell
class TestCellWork: UICollectionViewCell {
        
        lazy var photo: UIImageView = {
            let view = UIImageView()
            return view
        }()

    override func layoutSubviews() {
        addSubview(photo)
        photo.snp.makeConstraints { make in
            make.edges.equalToSuperview()
           
        }
    }

}
