import Foundation
import UIKit

class DiceViewController: UIViewController {
    lazy var rollOutcomeLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = textLabel.font.withSize(60)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.text = self.viewModel.rollLabelText
        return textLabel
    }()

    lazy var countLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = UIColor.white
        textLabel.font = textLabel.font.withSize(24)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.text = self.viewModel.countLabelText
        return textLabel
    }()

    lazy var turnLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.textColor = .white
        textLabel.font = textLabel.font.withSize(24)
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.text = self.viewModel.turnText
        return textLabel
    }()

    let viewModel: DiceViewModel

    init(viewModel: DiceViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let topBarStackView = UIStackView(arrangedSubviews: [turnLabel, countLabel])
        topBarStackView.axis = .horizontal
        topBarStackView.distribution = .fillProportionally

        let rootView = UIStackView(arrangedSubviews: [topBarStackView, rollOutcomeLabel])
        rootView.axis = NSLayoutConstraint.Axis.vertical
        rootView.isUserInteractionEnabled = true
        rootView.distribution = .fillProportionally
        rootView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tapped)))

        view = rootView
    }

    @objc func tapped() {
        viewModel.tap(callback: updateView)
    }

    func updateView() {
        rollOutcomeLabel.text = viewModel.rollLabelText
        countLabel.text = viewModel.countLabelText
        turnLabel.text = viewModel.turnText
    }
}
