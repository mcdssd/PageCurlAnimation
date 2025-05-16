//
//  AnimationView.swift
//  PageCurlAnimation
//
//  Created by Marina Costa dos Santos on 15/05/25.
//
import UIKit

class AnimationView: UIView {
    
    let pageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .white
       
        addSubview(pageContainerView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
                   pageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
                   pageContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
                   pageContainerView.widthAnchor.constraint(equalToConstant: 450),
                   pageContainerView.heightAnchor.constraint(equalToConstant: 550)
               ])
    }
}

#Preview {
    AnimationView()
}
