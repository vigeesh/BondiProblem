PRO b14

x=fltarr(1001) 
y=fltarr(1001) 

FOR j=1000,2000 DO BEGIN
	i=j-1000
	x[i] = j*(1.0)/1000
	B=10
	a = 4*ALOG10(x[i]) + (4/x[i]) - 3
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	
	y[i] = ABS(NEWTON(B, 'newtfunc'))
	PRINT, i, x[i], a, y[i]
ENDFOR
plot, x, y
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 -ALOG10(B^2) - A]
END
