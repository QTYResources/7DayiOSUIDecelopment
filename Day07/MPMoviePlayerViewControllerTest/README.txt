MPMoviePlayerViewController的使用方法（在iOS 9.0已经过时，了解即可）

（1）使用MPMoviePlayerViewController需要导入#import <MediaPlayer/MediaPlayer.h>头文件

（2）初始化视频文件路径
	NSString *path = [[NSBundle mainBundle]pathForResource:@"iphone" ofType:@"mp4"];

（3）创建视频文件URL对象
	NSURL *url = [NSURL fileURLWithPath:path];

（4）初始化MPMoviePalyerViewController视图控件
	MPMoviePlayerViewController *controller = [[MPMoviePlayerViewController alloc]initWithContentURL:url];

（5）播放视频，视频会自动播放
	[self presentMoviePlayerViewControllerAnimated:controller];

