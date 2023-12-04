//
//  MatchListViewController.swift
//  SportzInteractiveAssignement
//
//  Created by Mac on 03/12/23.
//

import UIKit

class MatchListViewController: UIViewController {
    
    @IBOutlet weak var lblCountry1: UILabel!
    @IBOutlet weak var lblCountry2: UILabel!
    @IBOutlet weak var lblCountryTime1: UILabel!
    @IBOutlet weak var lblCountryVenue1: UILabel!
    
    @IBOutlet weak var lblCountry3: UILabel!
    @IBOutlet weak var lblCountry4: UILabel!
    @IBOutlet weak var lblCountryTime2: UILabel!
    @IBOutlet weak var lblCountryVenue2: UILabel!
    
    var playerList = [Match]()
    var teamHome1: String?
    var teamAway1: String?
    var teamHome2: String?
    var teamAway2: String?
    var playerData1: Match?
    var playerData2: Match?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        let queueObj = OperationQueue()
        queueObj.addOperation {
            self.getFirstMatchData()
        }
        queueObj.addOperation {
            self.getSecondMatchData()
        }
        queueObj.waitUntilAllOperationsAreFinished()
    }
    
    func getFirstMatchData(){
        APIHelper.shared.getApiData(requestUrl: URL(string: URLConstant.match1)!, resultType: Match.self) { matchData in
            self.playerData1 = matchData
            DispatchQueue.main.async {
                self.showFirstMatchData()
            }
        }
    }
    
    func getSecondMatchData(){
        APIHelper.shared.getApiData(requestUrl: URL(string: URLConstant.match2)!, resultType: Match.self) { matchData in
            self.playerData2 = matchData
            self.showSecondMatchData()
        }
    }
    
    func showFirstMatchData(){
            self.lblCountryVenue1.text = playerData1?.matchdetail?.venue?.name
            self.lblCountryTime1.text = "\(playerData1?.matchdetail?.match?.date ?? "") " + "\(playerData1?.matchdetail?.match?.time ?? "")"
            self.teamHome1 = playerData1?.matchdetail?.teamHome
            self.teamAway1 = playerData1?.matchdetail?.teamAway
            self.lblCountry1.text = playerData1?.teams?[self.teamHome1 ?? ""]?.nameFull
            self.lblCountry2.text = playerData1?.teams?[self.teamAway1 ?? ""]?.nameFull
    }
    
    func showSecondMatchData(){
        DispatchQueue.main.async { [self] in
            lblCountryVenue2.text = playerData2?.matchdetail?.venue?.name
            lblCountryTime2.text = "\(playerData2?.matchdetail?.match?.date ?? "") " + "\(playerData2?.matchdetail?.match?.time ?? "")"
            teamHome2 = playerData2?.matchdetail?.teamHome
            teamAway2 = playerData2?.matchdetail?.teamAway
            lblCountry3.text = playerData2?.teams?[self.teamHome2 ?? ""]?.nameFull
            lblCountry4.text = playerData2?.teams?[self.teamAway2 ?? ""]?.nameFull
        }
    }
    
    @IBAction func matchOneButtonDetail(_ sender: Any) {
        if let data = playerData1{
            nextVc(playerData: data)
        }
    }
    
    @IBAction func matchTwoButtonDetail(_ sender: Any) {
        if let data = playerData2{
            nextVc(playerData: data)
        }
    }
    
    func nextVc( playerData: Match)  {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MatchDetatilsViewController") as! MatchDetatilsViewController
        vc.playerData = playerData
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

