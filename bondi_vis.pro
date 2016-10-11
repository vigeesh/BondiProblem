PRO bvis1


;SET_PLOT, 'PS'
;DEVICE, Filename='bvis1.ps'

x=fltarr(1501) 
y=fltarr(1501)
r=fltarr(3601)
z=fltarr(1501, 3601)

;plot, x, y, xrange=[0, 2.0], yrange=[0, 2.0], xtitle='r/r_c', ytitle='v/c_s'
;XYOutS, 1, 1, 'Critical Point', Size=1.0
FOR i=4,1000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR

FOR i=1000,1500 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
;oplot, x, y

FOR a=0, 1500 DO BEGIN
FOR theta=0, 3600 DO BEGIN

FOR i= 1,500 DO BEGIN
FOR j= 1,500 DO BEGIN
x[i] = (i-250) * 1.0
y[j] = j * 1.0 
r = (x[i]^2+y[j]^2)^(0.5)
;theta = ATAN(y[j]/x[i])

v_x = y[a]*COS(theta)
v_y = y[a]*SIN(theta)
z[a,theta]= ((v_x)^2 + (v_y)^2)^(0.5)
ENDFOR
ENDFOR



DEVICE, DECOMPOSED = 0

LOADCT, 3
TVSCL, z

;DEVICE, /CLOSE_FILE

END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END
