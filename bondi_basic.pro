
PRO b4

x=fltarr(100002)
y=fltarr(100002) 
a=fltarr(100002)
b=fltarr(100002)
g=fltarr(100002)

FOR i=1,2000  DO BEGIN
	x[i] = i*(1.0)/1000
	a[i] = 4*ALOG10(x[i]) + (4/x[i]) - 3
	;PRINT, i, x[i], a[i]

FOR j=1,2000  DO BEGIN
	y[j] = j*(1.0)/1000
	b[j] = (y[j])^2 - ALOG10((y[j])^2) - a[i]
	PRINT, j, y[j], b[j]
ENDFOR
;print, b
plot, b, y
ENDFOR
END
