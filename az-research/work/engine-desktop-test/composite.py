from Xlib import display
from Xlib.ext import composite
import time
D=display.Display(':88');w=D.create_resource_object('window',0xe0000c);w.composite_redirect_window(composite.RedirectAutomatic);w.configure(width=1101);D.sync();time.sleep(.2);w.configure(width=1100);D.sync()
while True:time.sleep(1)
