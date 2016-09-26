PRO bondi2

x=fltarr(3001) 
y=fltarr(3001) 

FOR i=0,3000 DO BEGIN
	x[i] = i*(1.0)/1000 + .1 
	B=0.001
	
	a = 4*ALOG10(x[i]) + (4/x[i]) - 2.3
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc')
	PRINT, i, x[i], a, y[i]
ENDFOR
plot, x, y, xrange=[0, 2.0], yrange=[0, 4.0]
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 -ALOG10(B^2) - A]
END
