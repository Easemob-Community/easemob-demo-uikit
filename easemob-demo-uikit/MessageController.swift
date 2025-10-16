//
//  MessageController.swift
//  easemob-demo-uikit
//
//  Created by wangfeng on 2025/10/16.
//

import UIKit
import EaseChatUIKit

class MessageController: MessageListController {

    var id:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("id:\(String(describing: id))")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
