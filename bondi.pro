PRO bondi56

x=fltarr(1001) 
y=fltarr(1001)

plot, x, y, xrange=[0, 4.0], yrange=[0, 4.0]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;BONDI- 1

FOR i=0,1000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	
	a = 4*ALOG10(x[i]) + (4/x[i]) - 3
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc')
	;PRINT, i, x[i], a, y[i]
ENDFOR
oplot, x, y

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;BONDI5

FOR C = 3, 10, 1 DO BEGIN
FOR i=0,1000 DO BEGIN
	x[i] = i*(1.0)/1000 + .01
	B=0.01
	
	a = 4*ALOG10(x[i]) + (4/x[i]) - C
	d = x[i]^2 -ALOG10(x[i]^2) - a
	print, d
	;IF d GE 0 THEN CONTINUE
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;PRINT, i, x[i], a, y[i]
ENDFOR
oplot, x, y, MAX_VALUE=0.65
ENDFOR



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;BONDI6

r=fltarr(2001) 
s=fltarr(2001) 
FOR C = 3, 10 DO BEGIN
FOR i=0,2000 DO BEGIN
	r[i] = i*(1.0)/1000
	B=2
	a = 4*ALOG10(s[i]) + (4/s[i]) - C
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	s[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	IF s[i] LE 0.8 THEN CONTINUE
	;PRINT, i, x[i], a, y[i]
ENDFOR
oplot, x, y, MIN_VALUE=0.66
ENDFOR

END
