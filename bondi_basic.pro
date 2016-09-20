PRO b3

x=fltarr(100002)
y=fltarr(100002) 
a=fltarr(100002)
b=fltarr(100002)
g=fltarr(100002)


;This loop is for different c's 
;FOR c=-10,10 DO BEGIN
	
;this loop is for different x values
	FOR i=1,2000  DO BEGIN
		x[i] = i*(1.0)/1000
		a[i] = 4*ALOG10(x[i]) + (1/x[i]) - 3
		;PRINT, i, x[i], a[i]

;this loop is for finding out the LHS of the main equation minus the RHS For individual x  
		FOR j=1,2000  DO BEGIN
			y[j] = j*(1.0)/1000
			b[j] = (y[j])^2 - ALOG10((y[j])^2) - a[i] 
			PRINT, j, y[j], b[j]
		ENDFOR 
		;print, a[i], b, y
		plot, y, b
	ENDFOR
	;plot, a, x, xrange=[0,20]
	;PRINT, c
;ENDFOR
END
