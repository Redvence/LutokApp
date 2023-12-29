//
//  FeedViewController.swift
//  lutok2
//

import Foundation
import UIKit

final class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, HeaderViewDelegate {
    
    // MARK: - Views
    
    lazy private var header: FeedHeaderView = {
        let header = FeedHeaderView()
        
        return header
    }()
    
    lazy private var tableView: UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.register(FeedPostTableViewCell.self, forCellReuseIdentifier: feedPostTableViewCellReuseId)
        
        return table
    }()
    
    var model: [PostViewModel] = testData {
            didSet {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    
    var network: Networking = Networking()
    
    override func viewDidAppear(_ animated: Bool) {
           network.getPosts { model in
               var m: [PostViewModel] = []
               for _m in model {
                   m.append(PostViewModel(title: _m.title, subtitle: _m.text))
               }
               self.model = m
           }
       }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        header.delegate = self
        
        tableView.reloadData()
    }
    
    // MARK: - Delegation
    
    func didTapToProfile() {
        let viewController = ProfileViewController()
        self.present(viewController, animated: true)
    }
    
    // MARK: - TableView
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: feedPostTableViewCellReuseId, for: indexPath) as! FeedPostTableViewCell
        let m = model[indexPath.row]
        cell.configure(m)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    // MARK: - Layout
    /// Тут мы задаем все отступы и все констренты для сабвьюх
    
    private func layout() {
        view.backgroundColor = Colors.gray.uiColor
        view.addSubview(header)
        header.pinLeft(to: view)
        header.pinRight(to: view)
        header.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        
        view.addSubview(tableView)
        tableView.pinLeft(to: view, 0.0)
        tableView.pinRight(to: view, 0.0)
        tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pinTop(to: header.bottomAnchor)
    }
}

var testData = [
    PostViewModel(title: "класс", subtitle: "прикол"),
    PostViewModel(title: "класс", subtitle: "прикол"),
    PostViewModel(title: "класс", subtitle: "прикол"),
]
