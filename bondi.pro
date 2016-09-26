PRO bon

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
