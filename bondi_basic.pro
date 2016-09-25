PRO b17

x=fltarr(201) 
y=fltarr(201,2) 

FOR C= -3,10 DO BEGIN 
FOR i=0,200 DO BEGIN
	x[i] = i*(1.0)/1000 + 0.1 
	B=[0.1, 2]
	a = 4*ALOG10(x[i]) + (4/x[i]) + C
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc')
	PRINT, i, x[i], a, y[i]
ENDFOR
plot, x, y, xrange = [0, 2.0], yrange = [0, 2.0]
ENDFOR
END


FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 -ALOG10(B^2) - A]
END
