pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--pong
function _init()
  p={x=0,y=64,w=8,h=24,yspeed=3,score=0}
  e={x=118,y=64,w=8,h=24,yspeed=rnd(2)+1}
  b={x=64,y=64,r=3,xspeed=rnd()+1,yspeed=rnd()+1,score=0}
end

function _update()
 if p.score<10 and b.score<10 then
  ball_moves()
  player_moves()
  enemy_moves()
  check_collision()
 else
   reset_detect()
 end
 
end

function _draw()
 if p.score<10 and b.score<10 then
  cls(0)
  --player
  rectfill(p.x,p.y,p.x+p.w,p.y+p.h)
  --enemy
  rectfill(e.x,e.y,e.x+e.w,e.y+e.h)
  --ball
  circfill(b.x,b.y,b.r)
  line(64,0,64,128)
 
 else
  cls(7)
  print("play again?  🅾️",38,58)
 end
  draw_score()
end
-->8
--ball
function ball_moves()
  b.x=b.x+b.xspeed
  b.y=b.y+b.yspeed
  
  if b.x>128 then
    b.xspeed=(b.xspeed+rnd())*-1
  end
  if b.x<0 then
    b.xspeed=b.xspeed*-1
  end
  if b.y>128 or b.y<0 then
    b.yspeed=b.yspeed*-1
  end
end

function check_collision()
  --player hits ball?
  if b.x<p.x+p.w and b.y>p.y and b.y<p.y+p.h then
    b.xspeed=abs(b.xspeed)
    b.yspeed=b.yspeed-1+rnd(2)
    sfx(2)
  end
  --enemy hits ball?
  if b.x>e.x and b.y>e.y and b.y<e.y+e.h then
    b.xspeed=-1*abs(b.xspeed)
    b.yspeed=b.yspeed-1+rnd(2)
    sfx(2)
  end
  
  if b.x>128 then
    p.score=p.score+1
    sfx(0)
  end
  if b.x<0 then
    b.score=b.score+1
    sfx(1)
  end
end
-->8
--player moves
function player_moves()
  if btn(⬆️) then
    b.y=b.y-b.yspeed
  end
  if btn(⬇️) then
    b.y=b.y+b.yspeed
  end
  if p.y<0 then p.y=0 end
  if p.y>128-p.h then p.y=128-p.h end

end

function draw_score()
  print(p.score,20,20)
  print(b.score,98,20)
end  
-->8
--reset
function reset_detect()
 if btn(🅾️) then
    p.score=0
    _init()
  end
end
-->8
--enemy
function enemy_moves() 
  if b.y<e.y+e.h/2 then
    e.y=e.y-1
  end
  if b.y>e.y+e.h/2 then
    e.y=e.y+1
  end
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000600000000000000000000000000000000000000000006000000000000000000000000000000000000000000000606000000000000000
00000000000000000000600000000000000000000000000000000000000000006000000000000000000000000000000000000000000000606000000000000000
00000000000000000000666000000000000000000000000000000000000000006000000000000000000000000000000000000000000000666000000000000000
00000000000000000000606000000000000000000000000000000000000000006000000000000000000000000000000000000000000000006000000000000000
00000000000000000000666000000000000000000000000000000000000000006000000000000000000000000000000000000000000000006000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000006660000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000066666000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000666666600000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000666666600000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000666666600000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000066666000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000006660000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
66666666600000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000006666666660
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000006000000000000000000000000000000000000000000000000000000000000000

__sfx__
000100000d0500d050100501105012050130501405000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000001105013000160001700016000120000e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000c0500c050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
