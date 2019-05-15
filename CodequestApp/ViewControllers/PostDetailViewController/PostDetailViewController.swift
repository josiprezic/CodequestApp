//
//  PostDetailViewController.swift
//  CodequestApp
//
//  Created by Korisnik on 15/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit
import SnapKit

class PostDetailViewController: UIViewController {

    var post: Post?
    
    lazy var lblUserId: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    lazy var lblId: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    lazy var lblBody: UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }

    private final func setupUI() {
        edgesForExtendedLayout = []
        view.backgroundColor = .white
        addSubviews()
        showData()
    }
    
    private final func addSubviews() {
        
        view.addSubview(lblUserId)
        lblUserId.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(lblId)
        lblId.snp.makeConstraints { make in
            make.top.equalTo(lblUserId.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(lblTitle)
        lblTitle.snp.makeConstraints { make in
            make.top.equalTo(lblId.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
        }
        
        view.addSubview(lblBody)
        lblBody.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
        }
    }
    
    private final func showData() {
        lblUserId.text = "\(post?.userId ?? -1)"
        lblId.text = "\(post?.id ?? -1)"
        lblTitle.text = post?.title ?? ""
        lblBody.text = post?.body ?? ""
    }
}
