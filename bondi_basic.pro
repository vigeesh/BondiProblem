PRO b12

A= fltarr(2)
B = 1
A = NEWTON(B, 'newtfunc')
PRINT, A 
END

FUNCTION newtfunc, B 
RETURN, [B^2 - ALOG10(B^2) - 10]
END

