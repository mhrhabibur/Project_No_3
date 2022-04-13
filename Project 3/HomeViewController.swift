//
//  ViewController.swift
//  Project 3
//
//  Created by Habibur Rahman on 4/13/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var statusLive: UILabel!
    @IBOutlet var details: UILabel!
    @IBOutlet var teamALogo: UIImageView!
    @IBOutlet var teamBLogo: UIImageView!
    @IBOutlet var teamAName: UILabel!
    @IBOutlet var teamBName: UILabel!
    @IBOutlet var teamAScore: UILabel!
    @IBOutlet var teamBScore: UILabel!
    @IBOutlet var matchStatus: UILabel!
    
    var cricketScore: Score!
    let scoreManager = ScoreManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       title = "Entity Sports"
       
        scoreManager.fetchScore { [self] score, error in
            if error != nil {
                return
            }
            
            if let revisedScore = score {
                self.cricketScore = revisedScore
                DispatchQueue.main.async {
                    
                    self.updateScore()
                }
                
                
            }
            
        }
        
    }
    
    func updateScore() {
        self.statusLive.text = self.cricketScore.response.items[0].competition.status.uppercased()
        
        self.details.text = "\( self.cricketScore.response.items[0].subtitle),  \( self.cricketScore.response.items[0].venue.location), \( self.cricketScore.response.items[0].competition.title)"
        
        
        self.teamAScore.text = "520/8 & 220/3d"
        self.teamBScore.text = "425/10 & 129/8"
        self.matchStatus.text = "Match Drawn"
        
        self.teamAName.text = self.cricketScore.response.items[0].teamA.name
        self.teamBName.text = self.cricketScore.response.items[0].teamB.name

        let urlOfTeamA = URL(string: "\(self.cricketScore.response.items[0].teamA.logo)")
        let data = try? Data(contentsOf: urlOfTeamA!)
        self.teamALogo.image = UIImage(data: data!)
        
        let url = URL(string: "\(self.cricketScore.response.items[0].teamB.logo)")
        let data2 = try? Data(contentsOf: url!)
        self.teamBLogo.image = UIImage(data: data2!)
    }


}

