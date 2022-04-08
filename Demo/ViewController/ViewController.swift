//
//  ViewController.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import UIKit
import SDWebImage
import SwiftyJSON

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var playListTableView: UITableView!
    
    //MARK: - Variables
    var playlist: Feed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
}

//MARK: - Extension For Methods
extension ViewController {
    
    //MARK: - SetUp View
    func setUp() {
        playListTableView.delegate = self
        playListTableView.dataSource = self
        playListTableView.register(UINib(nibName: PlayListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: PlayListTableViewCell.identifier)
        self.navigationController?.navigationBar.isHidden = true
        if let saved = UserDefaults.standard.object(forKey: UserDefaultKeys.playList) as? Data {
            let decoder = JSONDecoder()
            if let loaded = try? decoder.decode(PlayList.self, from: saved) {
                self.playlist = loaded.feed
                DispatchQueue.main.async {
                    self.playListTableView.reloadData()
                }
            }
        } else {
            getPlayListData()
        }
    }
    
    //MARK: - PlayList API
    func getPlayListData() {
        self.showIndicator()
        PlayListViewModel.getPlayList { playlist in
            self.playlist = playlist.feed
            DispatchQueue.main.async {
                self.playListTableView.reloadData()
            }
            self.hideIndicator()
        }
    }
}

//MARK: - Extension For TableView Delegate
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playlist?.entry?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListTableViewCell", for: indexPath) as? PlayListTableViewCell else {
            return UITableViewCell()
        }
        let play = self.playlist?.entry?[indexPath.row]
        cell.titleLabel.text = play?.imname?.label
        cell.subTitleLabel.text = play?.title?.label
        let url = URL(string: play?.imimage?.first?.label ?? "")
        cell.imageview.sd_setImage(with: url, placeholderImage: UIImage(named: "placeholder"))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = PlayerDetailsViewController.instantiate(fromAppStoryboard: .Main)
        vc.play = self.playlist?.entry?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
