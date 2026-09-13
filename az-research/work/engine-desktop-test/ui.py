from Xlib import display,X
from Xlib.ext import composite,xtest
from PIL import Image
import sys,time
D=display.Display(':88');r=D.screen().root
if len(sys.argv)>1:
 x,y=map(int,sys.argv[1:3]);xtest.fake_input(D,X.MotionNotify,x=x,y=y);xtest.fake_input(D,X.ButtonPress,1);xtest.fake_input(D,X.ButtonRelease,1);D.sync();time.sleep(.3)
for w in r.query_tree().children:
 if w.get_attributes().map_state!=X.IsViewable:continue
 g=w.get_geometry()
 if g.width<100:continue
 print(hex(w.id),w.get_wm_name(),g.x,g.y,g.width,g.height)
 try:
  p=w.composite_name_window_pixmap();im=p.get_image(0,0,g.width,g.height,X.ZPixmap,0xffffffff)
  Image.frombytes('RGB',(g.width,g.height),im.data,'raw','BGRX').save(f'work/engine-desktop-test/window-{w.id}.png')
 except Exception as e: print(e)
