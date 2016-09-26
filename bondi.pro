PRO bondi9

x=fltarr(4001) 
y=fltarr(4001) 

plot, x, y, xrange=[0, 4.0], yrange=[0, 4.0]
FOR C = -1, 10 DO BEGIN
FOR i=0,4000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG10(x[i]) + (4/x[i]) - C
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	;PRINT, i, x[i], a, y[i]
ENDFOR
oplot, x, y, MAX_VALUE = 0.65
ENDFOR
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 -ALOG10(B^2) - A]
END
