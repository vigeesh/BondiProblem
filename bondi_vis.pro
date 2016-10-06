PRO bvis2


;SET_PLOT, 'PS'
;DEVICE, Filename='bvis1.ps'

x=fltarr(4001) 
y=fltarr(4001)
r=fltarr(3601)
z=fltarr(4001, 3601)

;plot, x, y, xrange=[0, 4.0], yrange=[0, 2.0], xtitle='r/r_c', ytitle='v/c_s'
;XYOutS, 1, 1, 'Critical Point', Size=1.0
FOR i=0,1000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	a = 4*ALOG(x[i]) + (4/x[i]) - 4
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR

FOR i=1000,4000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG(x[i]) + (4/x[i]) - 4
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR

FOR a=0, 4000 DO BEGIN
FOR theta=0, 3600 DO BEGIN
z[a,theta]= y[a]
ENDFOR
ENDFOR

;FOR theta=0, 3600 DO BEGIN
;r[theta]= theta
;ENDFOR



DEVICE, DECOMPOSED = 0

LOADCT, 2
TVscl, z, 0
;DEVICE, /CLOSE_FILE

END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END


We had
