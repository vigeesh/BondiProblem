
PRO bvis3


SET_PLOT, 'PS'
DEVICE, Filename='bvis1.ps'

x=fltarr(2001) 
y=fltarr(2001)
r=fltarr(91)
z=fltarr(2001, 91)

;plot, x, y, xrange=[0, 2.0], yrange=[0, 2.0], xtitle='r/r_c', ytitle='v/c_s'
;XYOutS, 1, 1, 'Critical Point', Size=1.0
FOR i=0,1000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR

FOR i=1000,2000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
;oplot, x, y

;FOR a=0, 200- DO BEGIN
;FOR theta=0, 360 DO BEGIN
;z[a,theta]= y[a]
;ENDFOR
;ENDFOR

;FOR theta=0, 360 DO BEGIN
;r[theta]= theta
;ENDFOR



U=fltarr(2001,361)
V=fltarr(2001,361)

FOR radius= 0,2000 DO BEGIN
FOR i=0,360 DO BEGIN
U[radius, i] = y[radius] * COS(i)
V[radius, i] = y[radius] * SIN(i)
ENDFOR
ENDFOR

Velovect, U, V

;DEVICE, DECOMPOSED = 0

;LOADCT, 3
;TVSCL, z

DEVICE, /CLOSE_FILE

END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END

