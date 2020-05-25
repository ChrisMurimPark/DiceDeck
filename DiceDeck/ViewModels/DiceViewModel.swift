import Foundation

class DiceViewModel {
    private var cards: [Int] = []
    var totalCount = 0
    var currentCard = 0
    var rollLabelText = "Tap to roll"
    var countLabelText = "Roll count: 0"

    init() {
        refreshCards()
    }

    func tap(callback: ()->Void) {
        if (currentCard == cards.count) {
            refreshCards()
        }
        rollLabelText = "\(cards[currentCard])"
        currentCard = currentCard + 1
        totalCount = totalCount + 1
        countLabelText = "Roll count: \(totalCount)"
        callback()
    }

    func refreshCards() {
        cards = [2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 9, 9, 9, 9, 10, 10, 10, 11, 11, 12]
        cards.shuffle()
        currentCard = 0
    }
}
