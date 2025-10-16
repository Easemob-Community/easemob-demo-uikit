//
//  ViewController.swift
//  easemob-demo-uikit
//
//  Created by wangfeng on 2025/10/15.
//

import UIKit
import EaseChatUIKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func OnLogin(_ sender: UIButton) {
        
        ChatClient.shared().login(withUsername: "wf1", password: "1") { user, err in
            if err == nil {
                print("登录成功")
                UIApplication.shared.chat.keyWindow?.rootViewController = UINavigationController(rootViewController: ConversationVC())

            }else{
                print("登录失败:\(String(describing: err?.description))")
            }
        }
    }
    
}

