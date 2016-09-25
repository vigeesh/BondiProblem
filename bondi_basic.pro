PRO b9

x=fltarr(2002) 
y=fltarr(2002) 

FOR i=1,2000  DO BEGIN
	x[i] = i*(1.0)/1000
	B=0.00001
	a = 4*ALOG10(x[i]) + (4/x[i]) - 3
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc')
	PRINT, x[i], a, y[i]
ENDFOR
plot, x, y
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - A]
END
