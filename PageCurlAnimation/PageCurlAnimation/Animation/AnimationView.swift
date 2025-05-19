//
//  AnimationView.swift
//  PageCurlAnimation
//
//  Created by Marina Costa dos Santos on 15/05/25.
//
import UIKit

class AnimationView: UIView {
    
    let pageContainerView = UIView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Notebook"
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
       
        addSubview(titleLabel)
        addSubview(pageContainerView)
        
        pageContainerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            
                   pageContainerView.centerXAnchor.constraint(equalTo: centerXAnchor),
                   pageContainerView.centerYAnchor.constraint(equalTo: centerYAnchor),
                   pageContainerView.widthAnchor.constraint(equalToConstant: 500),
                   pageContainerView.heightAnchor.constraint(equalToConstant: 600)
               ])
    }
}

#Preview {
    AnimationView()
}
