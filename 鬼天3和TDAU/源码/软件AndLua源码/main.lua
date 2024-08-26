require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "AndLua"
import "android.provider.Settings"
import "android.content.Context"
import "android.media.MediaPlayer"
import "android.graphics.PixelFormat"
import "android.content.Intent"
import "android.net.Uri"
import "android.media.MediaPlayer"
import "android.graphics.drawable.GradientDrawable"
import "android.content.*"
import "android.graphics.*"
import "canvas"
import "com.androlua.LuaDrawable"
import "android.animation.ObjectAnimator"
import "android.animation.ArgbEvaluator"
import "android.animation.ValueAnimator"
import "XF/gn1"
import "gonggaoTC"

activity.setRequestedOrientation(1)--横屏0--竖屏1
activity.setTheme(R.Theme_Blue)
activity.setTitle("测试")
activity.setContentView(loadlayout(layout))
隐藏标题栏() 沉浸状态栏()


function 动画1(控件ID)
  local 动画对象 = AnimationSet(true)
  local 动画容器 = LayoutAnimationController(动画对象,0.2)
  local 渐变动画 = AlphaAnimation(0,1)
  local 下滑动画 = TranslateAnimation(0, 0, 55, 0)
  动画容器.setOrder(LayoutAnimationController.ORDER_NORMAL)
  渐变动画.setDuration(500)
  下滑动画.setDuration(600)
  动画对象.addAnimation(渐变动画)
  动画对象.addAnimation(下滑动画)
  控件ID.setLayoutAnimation(动画容器)
end

local 音频播放器=MediaPlayer()
function 播放(路径)
  音频播放器.reset()
  .setDataSource(路径)
  .prepare()
  .start()
  .setOnCompletionListener({
    onCompletion=function()
    end})
end

function 语音(文字)
  音频播放器.reset()
  .setDataSource("https://dict.youdao.com/dictvoice?audio="..文字.."&le=zh")
  .prepare()
  .start()
  .setOnCompletionListener({
    onCompletion=function()
    end})
end

os.execute("su")

ROOT=os.execute("su")
if ROOT
  提示("当前为ROOT模式")
 else
  提示("当前为框架模式")
end

function 暂停(路径)
  音频播放器.reset()
end


验证是否成功获取公告=true
Http.get("https://sharechain.qq.com/6df0a3d1060040b16b65f0bc9945e181",nil,"utf8",nil,function(code,content,cookie,header)
  import "android.content.pm.PackageManager"
  当前版本=activity.getPackageManager().getPackageInfo(activity.getPackageName(), 0).versionName--获取当前版本
  content=content:gsub("amp;","") or content;--过滤
  是否更新=content:match("【是否更新】(.-)【是否更新】")--状态是否强制更新
  最新版本=content:match("【最新版本】(.-)【最新版本】")--最新版的版本
  更新公告=content:match("【更新公告】(.-)【更新公告】")--更新公告
  提取密码=content:match("【提取密码】(.-)【提取密码】")--提取密码
  下载链接=content:match("【下载链接】(.-)【下载链接】")--链接蓝奏云下载链接，自带直链下载
  常驻公告=content:match("【常驻公告】(.-)【常驻公告】")--常驻公告
  获取账号=content:match("【获取账号】(.-)【获取账号】")--获取QQ号
  群还是号=content:match("【群还是号】(.-)【群还是号】")--如果是号就跳转账号，是群就跳转群
  会员密码=content:match("【会员密码】(.-)【会员密码】")--类卡密验证
end)


function 公告TC()
  tc=AlertDialog.Builder(this)
  tc.setCancelable(false)--false为不可触摸关闭，true为点击空白处关闭
  tc.setView(loadlayout(gonggaoTC))
  tc=tc.show()

  版本显示.setText(最新版本)
  if 是否更新=="不更新"
    验证是否成功获取公告=true
    语音("欢迎使用该辅助")
    提示("当前版本为"..当前版本)
    TC标题.setText("公告")
    TC公告.setText(常驻公告)
   elseif 是否更新=="更新"
    验证是否成功获取公告=true
    if 当前版本=="7.0-beta5"
      最新版本=当前版本
    end
    if 当前版本==最新版本
      语音("欢迎使用该辅助，当前版本为最新版。")
      TC标题.setText("公告")
      TC公告.setText(常驻公告)
     else
      版本显示.setText(当前版本.."  -->  "..最新版本)
      语音("发现新版本"..最新版本.."请及时更新")
      验证是否成功获取公告=false
      TC确定按钮.setText("退出")
      TC标题.setText("更新公告")
      TC公告.setText(更新公告)
    end

  end
  语音("欢迎使用主人科技")
  if 验证是否成功获取公告==false
    TC确定按钮.setText("退出")
   else
    TC确定按钮.setText("确定")
  end

  function TC确定按钮.onClick()
    if 验证是否成功获取公告==true
      tc=tc.hide()
     elseif 验证是否成功获取公告==false
      结束程序()
     else
      语音("发生未知错误，自动结束程序")
      结束程序()
    end
  end

  function TC退出.onClick()
    结束程序()
    语音("退出成功")
  end

  function TC刷新公告按钮.onClick()
    tc=tc.hide()
    公告TC()
  end
end

定时器=Ticker() 定时器.Period=1200 定时器.onTick=function() 定时器.stop() 公告TC() end 定时器.start()

--【1】免root调用二进制中文函数模块包(理论上支持所有框架)↓
function 免root执行(路径一)--中文函数p
  调用路径一=activity.getLuaDir(路径一)--自动获取lua文件的执行路径,只需填插件二进制在插件的目录路径即可
  os.execute("chmod 777 "..调用路径一)--授予777权限
  Runtime.getRuntime().exec(""..调用路径一)--免root执行二进制功能
end

--【2】root调用二进制中文函数模块包↓
function root执行(路径二)--中文函数
  调用路径二=activity.getLuaDir(路径二)--自动获取lua文件的执行路径,只需填二进制在插件的目录路径即可
  os.execute("su -c chmod 777 "..调用路径二)--授予777权限
  Runtime.getRuntime().exec("su -c "..调用路径二)--root执行二进制功能
end



function 执行(路径,语音提示)
  if os.execute("su") == true
    root执行(路径)
    语音(语音提示)
   else
    免root执行(路径)
    语音(语音提示)
  end
end

VIPS=false

function VIPS验证
  if username.Text==会员密码
    语音("VIP验证成功")
    VIPS=true
   else
    VIPS=false
  end
end


import "android.content.Context"
import "android.view.animation.TranslateAnimation"
import "android.view.animation.AlphaAnimation"
import "android.view.animation.LayoutAnimationController"
import "android.view.animation.AnimationSet"
import "android.graphics.drawable.GradientDrawable"
import "android.provider.Settings"


wmManager=activity.getSystemService(Context.WINDOW_SERVICE) --获取窗口管理器
HasFocus=false --是否有焦点
wmParams =WindowManager.LayoutParams() --对象
if tonumber(Build.VERSION.SDK) >= 26 then
  wmParams.type =WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY--安卓8以上悬浮窗打开方式
 else
  wmParams.type =WindowManager.LayoutParams.TYPE_SYSTEM_ALERT--安卓8以下的悬浮窗打开方式
end
wmManager=activity.getSystemService(Context.WINDOW_SERVICE) --获取窗口管理器
HasFocus=false --是否有焦点
wmParams =WindowManager.LayoutParams() --对象
wmParams.type =WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY --设置悬浮窗方式
import "android.graphics.PixelFormat" --导入
wmParams.format =PixelFormat.RGBA_8888 --设置背景
wmParams.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE--焦点设置
wmParams.gravity = Gravity.LEFT| Gravity.TOP --重力设置
wmParams.x = activity.getWidth()/6
wmParams.y = activity.getHeight()/5
wmParams.width =WindowManager.LayoutParams.WRAP_CONTENT
wmParams.height =WindowManager.LayoutParams.WRAP_CONTENT
if Build.VERSION.SDK_INT >= Build.VERSION_CODES.M&&!Settings.canDrawOverlays(this) then
  print("没有悬浮窗权限，请手动打开权限")
  import "android.net.Uri"
  import "android.content.Intent"
  import "android.provider.Settings"
  function 获取悬浮窗权限()
    intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION);
    intent.setData(Uri.parse("package:" .. activity.getPackageName()));
    activity.startActivityForResult(intent, 100);
  end
  获取悬浮窗权限() intent=Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION)
  activity.startActivityForResult(intent, 100)
  os.exit()
 else
  悬浮球=loadlayout("XF/xuanfuQ")--悬浮球
  悬浮窗=loadlayout("XF/xuanfuC")--悬浮窗
end

判断悬浮窗是否在放大=false

function 放大XFC()--放大悬浮窗代码
  activity.setRequestedOrientation(2)--横屏0--竖屏1
  判断悬浮窗是否在放大=true
  wmManager.addView(悬浮窗,wmParams )
  wmManager.removeView(悬浮球)
end


function 隐藏XFC.onClick()--隐藏悬浮窗代码
  判断悬浮窗是否在放大=false
  wmManager.removeView(悬浮窗)
  wmManager.addView(悬浮球,wmParams )
end

function 退出XFC.onClick()--退出悬浮窗代码
  activity.setRequestedOrientation(1)--横屏0--竖屏1
  wmManager.removeView(悬浮窗)
  悬浮球是否启动打开=false
  判断悬浮窗是否在放大=false
  语音("已退出悬浮窗")
end

悬浮球是否启动打开=false

function 登录检测()
  if 悬浮球是否启动打开 ==false
    activity.setRequestedOrientation(2)--横屏0--竖屏1
    wmManager.addView(悬浮球,wmParams)
    悬浮球是否启动打开=true
    if VIPS==false
      语音("卡密验证成功")
     elseif VIPS==true
      语音("卡密验证成功，欢迎VIP用户")
    end
   elseif 悬浮球是否启动打开==true
    语音("悬浮窗已开启，请勿重复登陆")
    提示("悬浮窗已开启，请勿重复登陆")
  end
end



function 线程1()
  悬浮球时间.setText(os.date("%H:%M:%S"))
end
thread(function()
  require "import"
  while true do
    Thread.sleep(200)
    call("线程1")
  end
end)

function 悬浮球图标.OnTouchListener(v,event)--这个图标移动代码
  if event.getAction()==MotionEvent.ACTION_DOWN then
    firstX=event.getRawX()
    firstY=event.getRawY()
    wmX=wmParams.x
    wmY=wmParams.y
   elseif event.getAction()==MotionEvent.ACTION_MOVE then
    wmParams.x=wmX+(event.getRawX()-firstX)
    wmParams.y=wmY+(event.getRawY()-firstY)
    wmManager.updateViewLayout(悬浮球,wmParams)
   elseif event.getAction()==MotionEvent.ACTION_UP then
  end
  return false
end

function 悬浮窗窗体.OnTouchListener(v,event)--这个图标移动代码
  if event.getAction()==MotionEvent.ACTION_DOWN then
    firstX=event.getRawX()
    firstY=event.getRawY()
    wmX=wmParams.x
    wmY=wmParams.y
   elseif event.getAction()==MotionEvent.ACTION_MOVE then
    wmParams.x=wmX+(event.getRawX()-firstX)
    wmParams.y=wmY+(event.getRawY()-firstY)
    wmManager.updateViewLayout(悬浮窗,wmParams)
   elseif event.getAction()==MotionEvent.ACTION_UP then
  end
  return false
end

--自定义悬浮窗大小代码
winParams=悬浮窗2.getLayoutParams() winParamy=悬浮窗2.getLayoutParams() function 调节大小2.OnTouchListener(v,event) if event.getAction()==MotionEvent.ACTION_DOWN then firstX=event.getRawX() firstY=event.getRawY() wmX=winParams.width wmY=winParams.height wmX=winParamy.width elseif event.getAction()==MotionEvent.ACTION_MOVE then winParams.width=wmX+(event.getRawX()-firstX) winParams.height=wmY+(event.getRawY()-firstY) winParamy.width=wmX+(event.getRawX()-firstX) 悬浮窗2.setLayoutParams(winParams) 悬浮窗2.setLayoutParamy(winParamy) elseif event.getAction()==MotionEvent.ACTION_UP then end return true end

控件圆角(悬浮窗1,0xffffffff,25)
控件圆角(悬浮球时间背景卡片,0xffffffff,25)
控件圆角(悬浮球图标背景卡片,0xffffffff,25)

function gn0()
  滑动窗口.showPage(0)
end

function gn1()
  滑动窗口.showPage(1)
end

标题点击次数=0
隐藏控件(悬浮窗2)
--隐藏控件(悬浮窗3)
悬浮窗2是否显示=false
function 悬浮窗1标题.onClick()
  if VIPS==true
    if 悬浮窗2是否显示==false
      显示控件(悬浮窗2)
      悬浮窗2是否显示=true
     else
      隐藏控件(悬浮窗2)
      悬浮窗2是否显示=false
    end
   else
    if 标题点击次数==100
      提示("恭喜发现彩蛋")
      语音("恭喜发现彩蛋")
      显示控件(悬浮窗2)
     else
      标题点击次数=标题点击次数+1
    end
  end
end

function 伤害1()
  执行("ejz/shg","伤害恢复中")
end

function 伤害2()
  执行("ejz/sh+","21亿秒杀伤害开启中")
end

function 伤害3()
  执行("ejz/sh-","21亿加血伤害开启中")
end

--绑定监听
加速拖动条.setOnSeekBarChangeListener{
  onStartTrackingTouch=function()

  end,
  onStopTrackingTouch=function()
    if 加速拖动条.Progress == 0
      语音("未开启")
     elseif 加速拖动条.Progress == 1
      执行("ejz/gtjsg","速度恢复为1倍中")
     elseif 加速拖动条.Progress == 2
      执行("ejz/gtj2","2倍加速开启中")
     elseif 加速拖动条.Progress == 3
      执行("ejz/gtjs3","3倍加速开启中")
     elseif 加速拖动条.Progress == 4
      执行("ejz/gtjs5","5倍加速开启中")
     elseif 加速拖动条.Progress == 5
      执行("ejz/gtjs10","10倍加速开启中")
    end
  end,
  onProgressChanged=function()
    if 加速拖动条.Progress == 0
      加速倍数显示.setText("未开启")
     elseif 加速拖动条.Progress == 1
      加速倍数显示.setText("1倍")
     elseif 加速拖动条.Progress == 2
      加速倍数显示.setText("2倍")
     elseif 加速拖动条.Progress == 3
      加速倍数显示.setText("3倍")
     elseif 加速拖动条.Progress == 4
      加速倍数显示.setText("5倍")
     elseif 加速拖动条.Progress == 5
      加速倍数显示.setText("10倍")
    end
  end}

MCS870强化开关=false
function MCS870强化()
  if MCS870强化开关==false
    MCS870强化开关=true
    执行("ejz/mcs870qhk","MCS870强化开启中")
   elseif MCS870强化开关==true
    MCS870强化开关=false
    语音("该功能无法关闭")
  end
end

高跳开关=false
function 高跳()
  if 高跳开关==false
    高跳开关=true
    执行("ejz/gtk","高跳开启中")
   elseif 高跳开关==true
    高跳开关=false
    执行("ejz/gtg","高跳关闭中")
  end
end

无限子弹开关=false
function 无限子弹()
  if 无限子弹开关==false
    无限子弹开关=true
    执行("ejz/wxzdk","无限子弹开启中")
   elseif 无限子弹开关==true
    无限子弹开关=false
    执行("ejz/wxzdg","无限子弹关闭中")
  end
end

XIX强化开关=false
function XIX强化()
  if XIX强化开关==false
    XIX强化开关=true
    执行("ejz/xixqhk","XIX强化开启中")
   elseif XIX强化开关==true
    XIX强化开关=false
    语音("该功能无法关闭")
  end
end

RPG强化开关=false
function RPG强化()
  if RPG强化开关==false
    RPG强化开关=true
    执行("ejz/rpgqhk","RPG强化开启中")
   elseif RPG强化开关==true
    RPG强化开关=false
    语音("该功能无法关闭")
  end
end

function 飞天负5()
  执行("ejz/ft-5","开启中")
end

function 飞天负2()
  执行("ejz/ft-2","开启中")
end

function 飞天0()
  执行("ejz/ft0","开启中")
end

function 飞天3()
  执行("ejz/ft3","开启中")
end

function 飞天6()
  执行("ejz/ft6","开启中")
end

function 飞天恢复()
  执行("ejz/ftg","开启中")
end

千里刀人开关=false
function 千里刀人()
  if 千里刀人开关==false
    千里刀人开关=true
    执行("ejz/qldrk","千里刀人开启中")
   elseif 千里刀人开关==true
    千里刀人开关=false
    执行("ejz/qldrg","千里刀人关闭中")
  end
end

function 无敌1()
  执行("ejz/wd0","Nan无敌开启中")
end

function 无敌2()
  执行("ejz/wd+","38位血量开启中")
end

function 无敌3()
  执行("ejz/wdg","无敌关闭中")
end


沙盒改生存开关=false
function 沙盒改生存()
  if 沙盒改生存开关==false
    沙盒改生存开关=true
    执行("ejz/shgsck","沙盒改生存开启中，开启成功后请选择沙盒模式进入地图")
   elseif 沙盒改生存开关==true
    沙盒改生存开关=false
    语音("该功能无法关闭，需重启游戏才能恢复")
  end
end

function 站()
  执行("ejz/dxg","站")
end

function 蹲()
  执行("ejz/dxk","蹲")
end

function 趴()
  执行("ejz/pxk","趴")
end

function s1()
  执行("ejz/mzys-1","隐藏名字和血条")
end

function s2()
  执行("ejz/mzys0","白色")
end

function s3()
  执行("ejz/mzys2","绿色")
end

function s4()
  执行("ejz/mzys3","淡蓝色")
end

function s5()
  执行("ejz/mzys4","淡红色")
end

function s6()
  执行("ejz/mzys6","蓝色")
end

function s7()
  执行("ejz/mzys7","黑色")
end

function s8()
  执行("ejz/mzys9","橙色")
end

function s9()
  执行("ejz/mzys10","紫色")
end

function s10()
  执行("ejz/mzys16","红色")
end

