发送短信使用方法

（1）跳转到系统短信消息界面需要导入#import <MessageUI/MessageUI.h>包，并且需要实现MFMessageComposeViewControllerDelegate协议，该协议用于处理短息界面用户操作的回调。

（2）初始化短信消息界面视图控制器
    self.con = [[MFMessageComposeViewController alloc]init];

（3）canSendText用于判断是否支持发送文本短信信息
	[MFMessageComposeViewController canSendText];

（4）设置短信消息代理
        self.con.messageComposeDelegate = self;

（5）设置短信的收件人
        self.con.recipients = @[@"13333333333"];

（6）设置短信内容
        self.con.body = @"发送信息的内容";

（7）设置短信标题（没有效果，可能还需要设置其他参数）
        self.con.subject = @"信息的标题";

（8）启动短信消息界面
	[self presentViewController:self.con animated:YES completion:nil];

（9）获取短信回调
	#pragma mark -- 实现MFMessageComposeViewController协议
	- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    		switch (result) {
        		case MessageComposeResultCancelled:
            			NSLog(@"取消发送");
            			break;
        
        		case MessageComposeResultSent:
            			NSLog(@"发送成功");
            			break;
        
        		case MessageComposeResultFailed:
            			NSLog(@"发送失败");
            			break;
    		}
    		[controller dismissViewControllerAnimated:YES completion:nil];
	}

注意：在设置recipients属性的时候，必须严格的设置为NSString类型的数组，否则会出现黑屏现象。