基于环信UIKit实现聊天页面传递参数(swift)
--------
## 项目背景
- UIKit 是基于环信即时通讯 IMSDK 开发的一款即时通讯UI组件库,其中聊天页面大部分情况为内部跳转，如果需要给聊天页面传递自己的业务参数需要特殊处理，这边提供了一个最简单的方案

## 前提条件
- xcode开发环境
- 有效的环信即时通讯 IM 开发者账号
## 实现方法
- 创建iOS项目，并集成 EaseChatUIKit 库
```
platform :ios, '14.0'

target 'easemob-demo-uikit' do
  use_frameworks!
  pod 'EaseChatUIKit','4.15.1'

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.0'
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
```
- 在AppDelegate里面初始化环信
```
let option = ChatOptions(appkey: "自己的APPKEY")
option.isAutoLogin = false
_ = ChatUIKitClient.shared.setup(option:option)
```
- 假如需要在UIKit提供的会话列表页面，点击会话item进入聊天页面时给聊天页面传递自己的业务字段
- 先创建一个 ConversationVC 继承 ConversationListController
- 在登录成功之后跳转 会话列表页面（ConversationVC）
```
ChatClient.shared().login(withUsername: "wf1", password: "1") { user, err in
    if err == nil {
        print("登录成功")
        UIApplication.shared.chat.keyWindow?.rootViewController = UINavigationController(rootViewController: ConversationVC())

    }else{
        print("登录失败:\(String(describing: err?.description))")
    }
}
```
- 拦截UIKit会话列表的点击事件（重新父类方法）
```
override func toChat(indexPath: IndexPath, info: ConversationInfo) {
}
```
- 创建一个 MessageController 继承 MessageListController，把 MessageController 注册到ComponentsRegister.shared.MessageViewController，这一步很重要
```
ComponentsRegister.shared.MessageViewController = MessageController.self
```
- 在 MessageController 创建一个业务id
```
var id:Int?
```
- 在ConversationVC的 toChat 方法里面进行参数参数传递
```
override func toChat(indexPath: IndexPath, info: ConversationInfo) {
    let vc = ComponentsRegister.shared.MessageViewController.init(conversationId: info.id, chatType: info.type == .chat ? .chat:.group) as? MessageController
    guard let vc = vc else { return }
    vc.id = 2
    vc.modalPresentationStyle = .fullScreen
    ControllerStack.toDestination(vc: vc)
}
```


## 参考文档：

注册环信IM：[https://console.easemob.com/user/register](http://easemob.cn/42f39f)

环信官方Demo下载：[https://www.easemob.com/download/demo](http://easemob.cn/wQSuov)

IMGeek社区支持：[https://www.imgeek.net](http://easemob.cn/SNi9e1)
