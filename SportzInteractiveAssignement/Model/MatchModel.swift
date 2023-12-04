//
//  MatchModel.swift
//  SportzInteractiveAssignement
//
//  Created by Mac on 03/12/23.
//

import Foundation

// MARK: - Match
struct Match: Decodable {
    let matchdetail: Matchdetail?
    let nuggets: [String]?
    let innings: [Inning]?
    let teams: [String: Team]?
    let notes: [String: [String]]?

    enum CodingKeys: String, CodingKey {
        case matchdetail = "Matchdetail"
        case nuggets = "Nuggets"
        case innings = "Innings"
        case teams = "Teams"
        case notes = "Notes"
    }
}

// MARK: - Inning
struct Inning: Decodable {
    let number, battingteam, total, wickets: String?
    let overs, runrate, byes, legbyes: String?
    let wides, noballs, penalty, allottedOvers: String?
    let batsmen: [InningBatsman]?
    let partnershipCurrent: PartnershipCurrent?
    let bowlers: [Bowler]?
    let fallofWickets: [FallofWicket]?
    let powerPlay: PowerPlay?
    let target: String?

    enum CodingKeys: String, CodingKey {
        case number = "Number"
        case battingteam = "Battingteam"
        case total = "Total"
        case wickets = "Wickets"
        case overs = "Overs"
        case runrate = "Runrate"
        case byes = "Byes"
        case legbyes = "Legbyes"
        case wides = "Wides"
        case noballs = "Noballs"
        case penalty = "Penalty"
        case allottedOvers = "AllottedOvers"
        case batsmen = "Batsmen"
        case partnershipCurrent = "Partnership_Current"
        case bowlers = "Bowlers"
        case fallofWickets = "FallofWickets"
        case powerPlay = "PowerPlay"
        case target = "Target"
    }
}

// MARK: - InningBatsman
struct InningBatsman: Decodable {
    let batsman, runs, balls, fours: String?
    let sixes, dots, strikerate, dismissal: String?
    let howout, bowler, fielder: String?
    let isonstrike: Bool?

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
        case fours = "Fours"
        case sixes = "Sixes"
        case dots = "Dots"
        case strikerate = "Strikerate"
        case dismissal = "Dismissal"
        case howout = "Howout"
        case bowler = "Bowler"
        case fielder = "Fielder"
        case isonstrike = "Isonstrike"
    }
}

// MARK: - Bowler
struct Bowler: Decodable {
    let bowler, overs, maidens, runs: String?
    let wickets, economyrate, noballs, wides: String?
    let dots: String?
    let isbowlingtandem, isbowlingnow: Bool?
    let thisOver: [ThisOver]?

    enum CodingKeys: String, CodingKey {
        case bowler = "Bowler"
        case overs = "Overs"
        case maidens = "Maidens"
        case runs = "Runs"
        case wickets = "Wickets"
        case economyrate = "Economyrate"
        case noballs = "Noballs"
        case wides = "Wides"
        case dots = "Dots"
        case isbowlingtandem = "Isbowlingtandem"
        case isbowlingnow = "Isbowlingnow"
        case thisOver = "ThisOver"
    }
}

// MARK: - ThisOver
struct ThisOver: Decodable {
    let t, b: String?

    enum CodingKeys: String, CodingKey {
        case t = "T"
        case b = "B"
    }
}

// MARK: - FallofWicket
struct FallofWicket: Decodable {
    let batsman, score, overs: String?

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case score = "Score"
        case overs = "Overs"
    }
}

// MARK: - PartnershipCurrent
struct PartnershipCurrent: Decodable {
    let runs, balls: String?
    let batsmen: [PartnershipCurrentBatsman]?

    enum CodingKeys: String, CodingKey {
        case runs = "Runs"
        case balls = "Balls"
        case batsmen = "Batsmen"
    }
}

// MARK: - PartnershipCurrentBatsman
struct PartnershipCurrentBatsman: Decodable {
    let batsman, runs, balls: String?

    enum CodingKeys: String, CodingKey {
        case batsman = "Batsman"
        case runs = "Runs"
        case balls = "Balls"
    }
}

// MARK: - PowerPlay
struct PowerPlay: Decodable {
    let pp1, pp2: String?

    enum CodingKeys: String, CodingKey {
        case pp1 = "PP1"
        case pp2 = "PP2"
    }
}

// MARK: - Matchdetail
struct Matchdetail: Decodable {
    let teamHome, teamAway: String?
    let match: MatchClass?
    let series: Series?
    let venue: Venue?
    let officials: Officials?
    let weather, tosswonby, status, statusID: String?
    let playerMatch, result, winningteam, winmargin: String?
    let equation: String?

    enum CodingKeys: String, CodingKey {
        case teamHome = "Team_Home"
        case teamAway = "Team_Away"
        case match = "Match"
        case series = "Series"
        case venue = "Venue"
        case officials = "Officials"
        case weather = "Weather"
        case tosswonby = "Tosswonby"
        case status = "Status"
        case statusID = "Status_Id"
        case playerMatch = "Player_Match"
        case result = "Result"
        case winningteam = "Winningteam"
        case winmargin = "Winmargin"
        case equation = "Equation"
    }
}

// MARK: - MatchClass
struct MatchClass: Decodable {
    let livecoverage, id, code, league: String?
    let number, type, date, time: String?
    let offset, daynight: String?

    enum CodingKeys: String, CodingKey {
        case livecoverage = "Livecoverage"
        case id = "Id"
        case code = "Code"
        case league = "League"
        case number = "Number"
        case type = "Type"
        case date = "Date"
        case time = "Time"
        case offset = "Offset"
        case daynight = "Daynight"
    }
}

// MARK: - Officials
struct Officials: Decodable {
    let umpires, referee: String?

    enum CodingKeys: String, CodingKey {
        case umpires = "Umpires"
        case referee = "Referee"
    }
}

// MARK: - Series
struct Series: Decodable {
    let id, name, status, tour: String?
    let tourName: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
        case status = "Status"
        case tour = "Tour"
        case tourName = "Tour_Name"
    }
}

// MARK: - Venue
struct Venue: Decodable {
    let id, name: String?

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case name = "Name"
    }
}

// MARK: - Team
struct Team: Decodable {
    let nameFull, nameShort: String?
    let players: [String: Player]?

    enum CodingKeys: String, CodingKey {
        case nameFull = "Name_Full"
        case nameShort = "Name_Short"
        case players = "Players"
    }
}

// MARK: - Player
struct Player: Decodable {
    let position, nameFull: String?
    let batting: Batting?
    let bowling: Bowling?
    let iscaptain, iskeeper: Bool?

    enum CodingKeys: String, CodingKey {
        case position = "Position"
        case nameFull = "Name_Full"
        case batting = "Batting"
        case bowling = "Bowling"
        case iscaptain = "Iscaptain"
        case iskeeper = "Iskeeper"
    }
}

// MARK: - Batting
struct Batting: Decodable {
    let style: Style?
    let average, strikerate, runs: String?

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case strikerate = "Strikerate"
        case runs = "Runs"
    }
}

enum Style: String, Decodable {
    case lhb = "LHB"
    case rhb = "RHB"
}

// MARK: - Bowling
struct Bowling: Decodable {
    let style, average, economyrate, wickets: String?

    enum CodingKeys: String, CodingKey {
        case style = "Style"
        case average = "Average"
        case economyrate = "Economyrate"
        case wickets = "Wickets"
    }
}
