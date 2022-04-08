//
//  PlayerDetailsViewController.swift
//  Demo
//
//  Created by Richa Mangukiya on 08/04/22.
//

import UIKit
import SDWebImage
import AVKit

class PlayerDetailsViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var playImageView: UIImageView!
    @IBOutlet weak var playName: UILabel!
    @IBOutlet weak var playRights: UILabel!
    @IBOutlet weak var playPrice: UILabel!
    @IBOutlet weak var playTitle: UILabel!
    @IBOutlet weak var playArtistName: UILabel!
    @IBOutlet weak var playpauseImage: UIImageView!
    
    //MARK: - Variables
    var play: Entry?
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        setUpdata()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        player?.pause()
    }
}

//MARK: - Extension For Methods
extension PlayerDetailsViewController {
    
    //MARK: - SetUp View
    func setUp() {
        playImageView.layer.cornerRadius = 7
        playpauseImage.image = UIImage(named: "play")
    }
    
    //MARK: - Showing Data
    func setUpdata() {
        playImageView.sd_setImage(with: URL(string: play?.imimage?.first?.label ?? ""), placeholderImage: UIImage(named: "placeholder"))
        playName.text = play?.imname?.label
        playTitle.text = play?.title?.label
        playPrice.text = play?.imprice?.label
        playRights.text = play?.rights?.label
        playArtistName.text = play?.imartist?.label
        playSound()
    }
    
    //MARK: - Play Music
    func playSound() {
        guard let urlString = play?.link?.last?.attributes?.href else { return }
        guard let url = URL(string: urlString) else { return }
        do {
            let playerItem = AVPlayerItem(url: url)
            self.player = try AVPlayer(playerItem:playerItem)
            player!.volume = 1.0
        } catch let error as NSError {
            self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
    }
}

//MARK: - Extension For Actions
extension PlayerDetailsViewController {
    
    //MARK: - Play Action
    @IBAction func didTapOnPlayButton(_ sender: Any) {
        if playpauseImage.image == UIImage(named: "play") {
            player?.play()
            playpauseImage.image = UIImage(named: "pause")
        } else {
            player?.pause()
            playpauseImage.image = UIImage(named: "play")
        }
        
    }
    
    //MARK: - Back Action
    @IBAction func didTapOnBackButton(_ sender: Any) {
        player?.pause()
        self.navigationController?.popViewController(animated: true)
    }
}
