//
//  ConversationVC.swift
//  easemob-demo-uikit
//
//  Created by wangfeng on 2025/10/15.
//

import UIKit
import EaseChatUIKit
class ConversationVC: ConversationListController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func toChat(indexPath: IndexPath, info: ConversationInfo) {
        let vc = ComponentsRegister.shared.MessageViewController.init(conversationId: info.id, chatType: info.type == .chat ? .chat:.group) as? MessageController
        guard let vc = vc else { return }
        vc.id = 2
        vc.modalPresentationStyle = .fullScreen
        ControllerStack.toDestination(vc: vc)
    }
}
