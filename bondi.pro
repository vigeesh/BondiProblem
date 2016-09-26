PRO bondi11

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
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;PRINT, i, x[i], a, y[i]
ENDFOR
oplot, x, y



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BONDI-5

FOR C = 3, 10 DO BEGIN
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
	PRINT, i, x[i], a, y[i]
ENDFOR
oplot, x, y, MAX_VALUE=0.65
ENDFOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BONDI-6
e=fltarr(2001) 
f=fltarr(2001) 
FOR C = 3, 10 DO BEGIN
FOR i=0,2000 DO BEGIN
	e[i] = i*(1.0)/1000
	B=2
	a = 4*ALOG10(e[i]) + (4/e[i]) - C
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	f[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;IF f[i] LE 0.8 THEN CONTINUE
	PRINT, i, e[i], a, f[i]
ENDFOR
oplot, e, e, MIN_VALUE=0.66
ENDFOR



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BONDI-2


p=fltarr(4001) 
q=fltarr(4001) 

FOR i=0,4000 DO BEGIN
	p[i] = i*(1.0)/1000 + .1 
	B=0.001
	
	a = 4*ALOG10(p[i]) + (4/p[i]) - 2.2
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	q[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;PRINT, i, p[i], a, q[i]
ENDFOR
oplot, p, q

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;BONDI-3
;r=fltarr(4001) 
;s=fltarr(4001) 


FOR C = -2.3, 2, 0.1 DO BEGIN
FOR i=0,4000 DO BEGIN
	p[i] = i*(1.0)/1000 + .01
	B=0.01
	
	a = 4*ALOG10(p[i]) + (4/p[i]) + C
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	q[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;PRINT, i, p[i], a, q[i]
ENDFOR
oplot, p, q
ENDFOR

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;BONDI-4

;t=fltarr(4001) 
;u=fltarr(4001) 

FOR C = -2.3, 2, 0.1 DO BEGIN
FOR i=0,4000 DO BEGIN
	p[i] = i*(1.0)/1000 
	B=2
	
	a = 4*ALOG10(p[i]) + (4/p[i]) + C
	;PRINT, a
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	q[i] = NEWTON(B, 'newtfunc', /DOUBLE)
	;PRINT, i, p[i], a, q[i]
ENDFOR
oplot, p, q
ENDFOR






END

FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 -ALOG10(B^2) - A]
END
