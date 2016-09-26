PRO bondi7

e=fltarr(1001) 
f=fltarr(1001) 
plot,e,f

FOR C = 3, 10, 1 DO BEGIN
FOR i=0,1000 DO BEGIN
	e[i] = i*(1.0)/1000 + .01
	B=0.01
	
	a = 4*ALOG10(e[i]) + (4/e[i]) - C
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	f[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;PRINT, i, e[i], a, f[i]
ENDFOR
oplot, e, f, MAX_VALUE=0.658
ENDFOR

r=fltarr(2001) 
s=fltarr(2001) 
FOR C = 3, 10 DO BEGIN
FOR i=0,2000 DO BEGIN
	r[i] = i*(1.0)/1000
	B=2
	a = 4*ALOG10(r[i]) + (4/r[i]) - C
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	s[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	IF r[i] LE 0.8 THEN CONTINUE
	;PRINT, i, r[i], a, s[i]
ENDFOR
oplot, r, s, MIN_VALUE=0.6595
ENDFOR
END

FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 -ALOG10(B^2) - A]
END
