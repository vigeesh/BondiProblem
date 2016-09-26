PRO bondi18

SET_PLOT, 'PS'
DEVICE, Filename='bondi7.ps'
x=fltarr(4001) 
y=fltarr(4001) 

plot, x, y, xrange=[0, 4.0], yrange=[0, 4.0], xtitle='r/r_c', ytitle='v/v_c'
XYOutS, 1, 1, 'Critical Point', Size=2.0
FOR C = -15, 15 DO BEGIN
FOR i=0,4000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	a = 4*ALOG(x[i]) + (4/x[i]) + C
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
oplot, x, y, MIN_VALUE = 1.01

FOR i=0,4000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG(x[i]) + (4/x[i]) + C
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
oplot, x, y, MAX_VALUE = 0.99
ENDFOR

DEVICE, /CLOSE_FILE
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END
