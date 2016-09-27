PRO bondi24

SET_PLOT, 'PS'
DEVICE, Filename='bondi24.ps'
x=fltarr(4001) 
y=fltarr(4001) 

plot, x, y, xrange=[0, 4.0], yrange=[0, 4.0], xtitle='r/r_c', ytitle='v/c_s'
XYOutS, 1, 1, 'Critical Point', Size=1.0
FOR i=0,1000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
oplot, x, y, MIN_VALUE = 1.000001

FOR i=1000,4000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
oplot, x, y, MAX_VALUE = .999999

DEVICE, /CLOSE_FILE
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END
