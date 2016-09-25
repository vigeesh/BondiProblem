PRO b15
b=fltarr(201)
result=fltarr(3)
FOR I=0,200  DO BEGIN
	OPENW, 1, 'test.dat'
	X = 1
	b[I] = I*0.1
	;PRINT, b[I]
	PRINTF, 1, b[I]
	CLOSE, 1
	result = NEWTON(X, 'newtfunc')
	print, I, result
ENDFOR

END

FUNCTION newtfunc, X
OPENR, 5, 'test.dat'
READF, 5, A
CLOSE, 5
RETURN, [X^2 -ALOG10(X^2) - A]
END
