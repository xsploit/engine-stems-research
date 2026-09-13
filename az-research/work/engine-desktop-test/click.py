from Xlib import display,X
from Xlib.ext import xtest
import sys,time
D=display.Display(':88');w=D.create_resource_object('window',int(sys.argv[1],0));x,y=map(int,sys.argv[2:4]);button=int(sys.argv[4]) if len(sys.argv)>4 else 1
w.set_input_focus(X.RevertToParent,X.CurrentTime);w.warp_pointer(x,y);D.sync();xtest.fake_input(D,X.ButtonPress,button);D.sync();time.sleep(.1);xtest.fake_input(D,X.ButtonRelease,button);D.sync()

time.sleep(.3)
