//
//  ViewController.swift
//  CodequestApp
//
//  Created by Korisnik on 15/05/2019.
//  Copyright © 2019 Josip Rezic. All rights reserved.
//

import UIKit

// TODO: Zmienic nazwe
class ViewController: UITableViewController {

    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = AppStrings.ViewController.title
    }
    
    private final func getData() {
        TypicodeApi.getData { success, message, data in
            guard success else {
                // TODO: Alert
                print("Error: \(message)")
                // TODO: Show noData label
                return
            }
            
            self.posts = data
            self.tableView.reloadData()
        }
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppStrings.ViewController.cellID) else {
            return UITableViewCell() }
        
        cell.textLabel?.text = posts[indexPath.row].title
        cell.detailTextLabel!.text = posts[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let postDetailViewController = PostDetailViewController()
        postDetailViewController.post = posts[indexPath.row]
        navigationController?.pushViewController(postDetailViewController, animated: true)
    }
}

