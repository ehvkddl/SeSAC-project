//
//  SearchResultController.swift
//  Unsplash
//
//  Created by do hee kim on 2023/09/13.
//

import UIKit
import Kingfisher

class SearchResultViewController: BaseViewController {
    
    var vm = PhotoViewModel()
    lazy var photoCollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: photoCollectionViewLayout())
        view.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        view.delegate = self
        view.dataSource = self
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vm.photo.bind { _ in
            DispatchQueue.main.async {
                self.photoCollectionView.reloadData()
            }
        }
    }
    
    override func configureView() {
        super.configureView()
        
        [photoCollectionView].forEach { view.addSubview($0) }
    }
    
    override func setConstraints() {
        photoCollectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        let photo = vm.cellForItemAt(at: indexPath)
        
        if let url = URL(string: photo.urls.thumb) {
            cell.imageView.kf.setImage(with: url)
        }
        
        return cell
    }
    
    func photoCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 1
        let width = UIScreen.main.bounds.width - (spacing * 2)
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width / 3, height: width / 3)
        layout.sectionInset = UIEdgeInsets.zero
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        
        return layout
    }
    
}
