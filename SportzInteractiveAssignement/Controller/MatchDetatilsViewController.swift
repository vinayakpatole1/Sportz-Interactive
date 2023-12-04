//
//  MatchDetatilsViewController.swift
//  SportzInteractiveAssignement
//
//  Created by Mac on 03/12/23.
//

import UIKit

class MatchDetatilsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnFilter: UIButton!
    @IBOutlet weak var fliterView: UIView!
    var showFilterMenu = false
    var playerData: Match?
    var teamPlayer: [String: Player]?
    var teamPlayerIds: [String]?
    var playeID = [String]()
    var PlayersData = [Player]()
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fliterView.isHidden = true
        self.tableView.register(UINib.init(nibName: "TeamPlayerTableViewCell", bundle: nil), forCellReuseIdentifier: "TeamPlayerTableViewCell")
        self.custamization()
    }
    
    func custamization()  {
        navigationController?.setNavigationBarHidden(false, animated: true)
        self.tableView.rowHeight = 100
        self.navigationController?.navigationBar.tintColor = UIColor.white
        tableView.layer.cornerRadius = 25
        tableView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.view.bringSubviewToFront(btnFilter)
        self.setUpData(type: 1)
    }
    
    @IBAction func filterButtonTapped(_ sender: Any) {
        let tag = btnFilter.tag
        showAndHideFilterMenu(category: tag)
    }
    
    func showAndHideFilterMenu(category : Int) {
        if showFilterMenu == false {
            self.fliterView.alpha = 0.0
            self.fliterView.isHidden = false
            self.showFilterMenu = true
            UIView.animate(withDuration: 0.4,animations: { [weak self] in
                self?.fliterView.alpha = 1.0
            })
        } else {
            UIView.animate(withDuration: 0.4,animations: { [weak self] in
                self?.fliterView.alpha = 0.0
            }) { [weak self] _ in
                self?.fliterView.isHidden = true
                self?.showFilterMenu = false
            }
        }
    }
    
    @IBAction func filterAllPlayerButtonTapped(_ sender: Any) {
        setUpData(type: 1)
        showAndHideFilterMenu(category: 1)
    }
    
    @IBAction func filterTeamAPlayerTapped(_ sender: Any) {
        setUpData(type: 2)
        showAndHideFilterMenu(category: 2)
    }
    
    @IBAction func filterTeamBTapped(_ sender: Any) {
        setUpData(type: 3)
        showAndHideFilterMenu(category: 3)
    }
    
    func setUpData(type: Int){
        self.playeID.removeAll()
        self.PlayersData.removeAll()
       
        switch type {
        case 1:
            //display all
            addFilterSpecificData(isHomeTeam: true, isAwayTeam: true)
            break
        case 2:
            //display home
            addFilterSpecificData(isHomeTeam: true, isAwayTeam: false)
            break
        case 3:
            //display away
            addFilterSpecificData(isHomeTeam: false, isAwayTeam: true)
            break
        default:
            break
        }
        self.tableView.reloadData()
    }
    
    func addFilterSpecificData(isHomeTeam:Bool, isAwayTeam:Bool){
        
        let homeTeamId = playerData?.matchdetail?.teamHome
        let awayTeamId = playerData?.matchdetail?.teamAway
        
        if isHomeTeam && isAwayTeam{
            for (key, value) in playerData?.teams?[homeTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
            for (key, value) in playerData?.teams?[awayTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
        }else if isAwayTeam{
            for (key, value) in playerData?.teams?[awayTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
        }else if isHomeTeam{
            for (key, value) in playerData?.teams?[homeTeamId ?? ""]?.players ?? [:]{
                print("(\(key),\(value))")
                self.playeID.append(key)
                self.PlayersData.append(value)
            }
        }
    }
}

extension MatchDetatilsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playeID.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamPlayerTableViewCell", for: indexPath) as? TeamPlayerTableViewCell
        cell?.showPlayerData(dataPlayers: self.PlayersData[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlayerDetailsPopUp") as? PlayerDetailsPopUp {
            vc.modalPresentationStyle = .overCurrentContext
            vc.modalTransitionStyle = .crossDissolve
            vc.PlayersData = self.PlayersData[indexPath.row]
            present(vc, animated: true, completion: nil)
        }
    }
    
}
