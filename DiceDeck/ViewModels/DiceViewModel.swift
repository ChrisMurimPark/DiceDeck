import Foundation

class DiceViewModel {
    private var cards: [Int] = []
    private let players: [String]
    private var totalCount = 0
    private var currentCard = 0
    private var currentPlayer = 0
    private var rolled = false

    var rollLabelText = "Tap to roll"
    var countLabelText = "Roll count: 0"
    var turnText = ""

    init(players: [String]) {
        if (players.count < 2) {
            fatalError("At least two players must play.")
        }
        self.players = players
        turnText = "\(players[currentPlayer])'s turn"
        refreshCards()
    }

    func tap(callback: ()->Void) {
        if (currentCard == cards.count) {
            refreshCards()
        }

        updateRollOutcome()
        updateRollCount()
        updatePlayer()
        rolled = !rolled

        callback()
    }

    func updateRollOutcome() {
        if (rolled) {
            rollLabelText = "Tap to roll"
        } else {
            rollLabelText = "\(cards[currentCard])"
            currentCard = currentCard + 1
        }
    }
    
    func updateRollCount() {
        if (!rolled) {
            totalCount = totalCount + 1
            countLabelText = "Roll count: \(totalCount)"
        }
    }
    
    func updatePlayer() {
        if (rolled) {
            turnText = "\(players[currentPlayer])'s turn"
            currentPlayer = (currentPlayer + 1) % players.count
        }
    }

    func refreshCards() {
        cards = [2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 11, 11, 12]
        cards.shuffle()
        currentCard = 0
    }
}
