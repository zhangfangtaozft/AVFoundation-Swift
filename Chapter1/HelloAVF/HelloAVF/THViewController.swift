//
//  THViewController.swift
//  HelloAVF
//
//  Created by 张芳涛 on 2023/5/13.
//

import UIKit
import AVFAudio

class THViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var speechStrings = ["Hello AV Foundation. How are you?",
                         "I'm well! Thanks for asking.",
                         "Are you excited about the book?",
                         "Very! I have always felt so misunderstood.",
                         "What's your favorite feature?",
                         "Oh, they're all my babies.  I couldn't possibly choose.",
                         "It was great to speak with you!",
                         "The pleasure was all mine!  Have fun!"]
    var showStrings = [String]()
    var synthesizer = AVSpeechSynthesizer()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        setUpAVSpeechSynthesizer()
    }
    
    private func setUpAVSpeechSynthesizer() {
        let voices = [AVSpeechSynthesisVoice(language: "en-US"),
                      AVSpeechSynthesisVoice(language: "en-GB")]
        synthesizer.delegate = self
        for i in 0..<speechStrings.count {
            let utterance = AVSpeechUtterance(string: speechStrings[i])
            utterance.voice = voices[i % 2]
            utterance.rate = 0.5
            utterance.pitchMultiplier = 0.8
            utterance.postUtteranceDelay = 0.1
            synthesizer.speak(utterance)
        }
    }
}

// MARK: - AVSpeechSynthesizerDelegate
extension THViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        showStrings.append(utterance.speechString)
        tableView.reloadData()
        let indexPath = IndexPath(row: showStrings.count - 1, section: 0)
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}

// MARK: - UITableViewDataSource && UITableViewDelegate
extension THViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showStrings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifierLeft = "identifierLeft"
        let identifierRight = "identifierRight"
        if indexPath.row % 2 == 0 {
            let cell = THBubbleCellLeft(style: .default, reuseIdentifier: identifierLeft)
            cell.selectionStyle = .none
            cell.messageLabel!.text = showStrings[indexPath.row]
            return cell
        } else {
            let cell = THBubbleCellRight(style: .default, reuseIdentifier: identifierRight)
            cell.selectionStyle = .none
            cell.messageLabel!.text = showStrings[indexPath.row]
            return cell
        }
       
    }
}
