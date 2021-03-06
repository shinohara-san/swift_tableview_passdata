//
//  ViewController.swift
//  TableViewPassData
//
//  Created by Yuki Shinohara on 2020/09/06.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import UIKit

struct Category {
    var title: String
    var items: [String]
}

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var data = [
        Category(title: "関東", items: ["東京", "神奈川", "千葉"]),
        Category(title: "近畿", items: ["大阪", "奈良", "京都"]),
        Category(title: "九州", items: ["福岡", "佐賀", "長崎", "熊本", "鹿児島", "宮崎", "沖縄"])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let items = data[indexPath.row].items
        let vc = ListViewController(items: items)
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

