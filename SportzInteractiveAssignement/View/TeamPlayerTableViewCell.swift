//
//  TeamPlayerTableViewCell.swift
//  SportzInteractiveAssignement
//
//  Created by Mac on 03/12/23.
//

import UIKit

class TeamPlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerStyle: UILabel!
    var checking: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showPlayerData(dataPlayers: Player){
        let keeper = dataPlayers.iskeeper ?? false
        let captain = dataPlayers.iscaptain ?? false
        if keeper == true &&  captain == true{
            self.checking = "Captain & Wicket keeper"
        }else if keeper == true && captain == false{
            self.checking = "Wicket keeper"
        }else if captain == true && keeper == false{
            self.checking = "Captain"
        }else{
            self.checking = "-"
        }
        playerName.text = dataPlayers.nameFull
        playerStyle.text = checking
    }
}
