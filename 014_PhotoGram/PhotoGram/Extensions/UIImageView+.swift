//
//  UIImageView+.swift
//  PhotoGram
//
//  Created by do hee kim on 2023/09/04.
//

import UIKit

extension UIImageView {
    
    func load(from url: String) {
        DispatchQueue.global().async {
            guard let url = URL(string: url) else {
                print("사진 url 변경에 실패했습니다.")
                return
            }
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            } catch {
                print("Data type으로 만드는 것을 실패했습니다.")
            }
        }
    }
    
}
