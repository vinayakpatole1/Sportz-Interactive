//
//  PlayerViewController.swift
//  SportzInteractiveAssignement
//
//  Created by Mac on 03/12/23.
//

import UIKit

class PlayerDetailsPopUp: UIViewController {
    
    var PlayersData: Player?
    @IBOutlet weak var btnClose: UIButton!
    //Batting Style
    @IBOutlet weak var lblBattingStyle: UILabel!
    @IBOutlet weak var lblBattingAverage: UILabel!
    @IBOutlet weak var lblBattingStrikerate: UILabel!
    @IBOutlet weak var lblBattingRuns: UILabel!
    //Bowling Style
    @IBOutlet weak var lblBowlingStyle: UILabel!
    @IBOutlet weak var lblBowlingAverage: UILabel!
    @IBOutlet weak var lblBowlingEconomyrate: UILabel!
    @IBOutlet weak var lblBowlingWickets: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayData()
    }
    
    func displayData()  {
        self.lblBattingStyle.text = "\(PlayersData?.batting?.style?.rawValue ?? "")"
        self.lblBattingAverage.text = "\(PlayersData?.batting?.average ?? "")"
        self.lblBattingStrikerate.text = "\(PlayersData?.batting?.strikerate ?? "")"
        self.lblBattingRuns.text = "\(PlayersData?.batting?.runs ?? "")"
        
        self.lblBowlingStyle.text = "\(String(describing: PlayersData?.bowling?.style ?? ""))"
        self.lblBowlingAverage.text = "\(String(describing: PlayersData?.bowling?.average ?? ""))"
        self.lblBowlingEconomyrate.text = "\(String(describing: PlayersData?.bowling?.economyrate ?? ""))"
        self.lblBowlingWickets.text = "\(String(describing: PlayersData?.bowling?.wickets ?? ""))"
    }
    
    @IBAction func btnCLoseClicked(_ sender: Any){
        self.dismiss(animated: true)
    }
}

