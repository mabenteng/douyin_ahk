MsgBox, 64,演讲笔刷抖音说明,下一页是下一个`n双击下一页是喜欢视频`n三击或长按退出直播`n-----------`n上一页是上一个`n双击上一页是查看评论`n三击或长按关闭评论或暂停`n`n10S秒后自动关闭本窗口, 10
; 示例 #3: 检测热键的单次, 两次和三次按下. 这样
; 允许热键根据您按下次数的多少
; 执行不同的操作：
PgDn::
if winc_presses > 0 ; SetTimer 已经启动, 所以我们记录键击.

{

    winc_presses += 1 ;666
    return
}
; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
; 计时器：
winc_presses = 1
SetTimer, KeyWinC, 800 ; 在 800 毫秒内等待更多的键击.
return

KeyWinC:
SetTimer, KeyWinC, off
if winc_presses = 1 ; 此键按下了一次.
{
    Send,{WheelDown}  ; 下一条抖音
}
else if winc_presses = 2 ; 此键按下了两次.
{
    MouseClick, , 969,508, , 0,   ; 点击喜欢视频的xy坐标
}
else if winc_presses > 2
{
    MouseClick, , 980,60, , 0, ; 点击退出直播的xy坐标
    MouseMove, 988, 368 ;将xy坐标转移到视频范围内,为了使上面生效
}
; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
winc_presses = 0
return

PgUp::
if winc_presses1 > 0 ; SetTimer 已经启动, 所以我们记录键击.

{

    winc_presses1 += 1
    return
}
; 否则, 这是新开始系列中的首次按下. 把次数设为 1 并启动
; 计时器：
winc_presses1 = 1
SetTimer, KeyWinC1, 800 ; 在 800 毫秒内等待更多的键击.
return

KeyWinC1:
SetTimer, KeyWinC1, off
if winc_presses1 = 1 ; 此键按下了一次.
{
    Send,{WheelUp}  ; 上一个抖音
}
else if winc_presses1 = 2 ; 此键按下了两次.
{
    MouseClick, , 970,593, , 0,   ; 打开评论的xy坐标点击
}
else if winc_presses1 > 2
{
    MouseClick, , 976,238, , 0,  ; 关闭评论的xy坐标点击
}
; 不论触发了上面的哪个动作, 都对 count 进行重置
; 为下一个系列的按下做准备:
winc_presses1 = 0
return