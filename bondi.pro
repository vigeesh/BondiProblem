PRO bondi21

SET_PLOT, 'PS'
DEVICE, Filename='bondi11.ps'
x=fltarr(4001) 
y=fltarr(4001) 

plot, x, y, xrange=[0, 4.0], yrange=[0, 4.0], xtitle='r/r_c', ytitle='v/v_c'
XYOutS, 1, 1, '. Critical Point', Size=1.0


DEVICE, /CLOSE_FILE
END


