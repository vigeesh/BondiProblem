PRO b2
x=fltarr(100002)
y=fltarr(100002) 
a=fltarr(100002)
d=fltarr(100002)
g=fltarr(100002)

FOR i=1,200  DO BEGIN
	x[i] = i*(1.0)/100
	a[i] = 4*ALOG10(x[i]) + (1/x[i]) + 3
	;FOR j=0,200 DO BEGIN
		;y[j] = j*(1.0)/100
		;d[j] = y[j]^2 - (ALOG10(y[j]^2))
		;g[j] = d[j] - a[i]
		PRINT, i, x[i], a[i]
	;ENDFOR
	
       ;print, x
	;print, g		
	;min = WHERE(ABS(g) EQ MIN(ABS(g)))
	;y[i] = min*(1.0)/1000
	;print, min, y[i]
;print, x[i], min, y[i]
ENDFOR
print, a, x
END
