//
//  FeedPostTableViewCell.swift
//  lutok2
//

import Foundation
import UIKit

let feedPostTableViewCellReuseId = "FeedPostTableViewCell"

struct PostViewModel {
    let title: String
    let subtitle: String
}

final class FeedPostTableViewCell: UITableViewCell {

    // MARK: - Views

    lazy private var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black.uiColor
        label.font = UIFont.systemFont(ofSize: 32)
        return label
    }()

    lazy private var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black.uiColor
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    lazy private var myBackgroundView: UIView = {
        let label = UIView()
        label.backgroundColor = Colors.white.uiColor
        return label
    }()

    private var didLayout: Bool = false

    func configure(_ model: PostViewModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle

        if !didLayout {
            layout()
        }
    }

    func layout() {
        layoutBackgroundView()
        layouTitleView()
        layoutSubtitleView()

        setNeedsLayout()

        didLayout = true
    }

    private func layoutBackgroundView() {
        let target = contentView

        target.addSubview(myBackgroundView)

        myBackgroundView.pinLeft(to: target, 16.0)
        myBackgroundView.pinRight(to: target, 16.0)
        myBackgroundView.pinTop(to: target, 16.0)
        myBackgroundView.pinBottom(to: target, 16.0)

    }

    private func layouTitleView() {
        let target = myBackgroundView

        target.addSubview(titleLabel)

        titleLabel.pinLeft(to: target, 8.0)
        titleLabel.pinRight(to: target, 8.0)
        titleLabel.pinTop(to: target, 4.0)

    }

    private func layoutSubtitleView() {
        let target = myBackgroundView

        target.addSubview(subtitleLabel)

        subtitleLabel.pinLeft(to: target, 8.0)
        subtitleLabel.pinRight(to: target, 8.0)
        subtitleLabel.pinTop(to: titleLabel.bottomAnchor, 4.0)
        subtitleLabel.pinBottom(to: target, 12.0)

    }

}
