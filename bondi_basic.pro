PRO b7

x=fltarr(2001)
y=fltarr(2001) 
a=fltarr(2001)
b=fltarr(2001)
g=fltarr(2001)
min=fltarr(2001)
FOR i=0,2000 DO BEGIN
	x[i] = i*(1.0)/1000 + 0.0001
FOR j=0,2000  DO BEGIN
	y[j] = j*(1.0)/1000 + 0.0001
	a[j] = (y[j])^2 - ALOG10((y[j])^2) - 4*ALOG10(x[i]) - (4/x[i]) + 3
	;print, i, j, a[j]
	;print, a[j]
ENDFOR
min[i] = WHERE(ABS(a) EQ MIN(ABS(a)))
print, min[i]
y[i]=  min[i]*(1.0)/1000 + 0.0001
;print, i, x[i], y[i]
ENDFOR
print, x , min
plot, x, y               ;, xrange=[0,0.1], yrange=[0,0.1]
END
