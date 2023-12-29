//
//  FeedHeaderView.swift
//  lutok2
//

import Foundation
import UIKit

final class FeedHeaderView: UIView {

    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Header")
        imageView.contentMode = .center

        return imageView
    }()

//    private lazy var button: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("Приветули", for: .normal)
//
//        btn.addTarget(self, action: #selector(didTap), for: .touchUpInside)
//
//        return btn
//    }()

    weak var delegate: HeaderViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: .zero)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTap() {
        delegate?.didTapToProfile()
    }

    private func layout() {
        self.backgroundColor = Colors.gray.uiColor
        self.addSubview(image)
    
        image.pinTop(to: self, 0.0)
        image.pinRight(to: self, 0.0, .grOE)
        image.pinLeft(to: self, 0.0, .grOE)
        image.pinCenterX(to: self)

//        self.addSubview(button)
//
//        button.pinLeft(to: self, 0.0, .grOE)
//        button.pinRight(to: self, 0.0, .grOE)
//        button.pinTop(to: image.bottomAnchor, 16.0)
//        button.pinBottom(to: self, 20.0)
//        button.pinCenterX(to: self)
    }
}
