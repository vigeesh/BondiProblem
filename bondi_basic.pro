PRO b13

x=fltarr(2001)
y=fltarr(2001) 
a=fltarr(2001)
b=fltarr(2001)
g=fltarr(2001)

FOR i=0,2000  DO BEGIN
	x[i] = i*(1.0)/1000 + 0.000001
FOR j=0,2000  DO BEGIN
	y[j] = j*(1.0)/1000 + 0.000001
	a[j] = (y[j])^2 - ALOG10((y[j])^2) - 4*ALOG10(x[i]) - (4/x[i]) + 3
	;print, i, j, a[j]
ENDFOR
print, i
min = WHERE(ABS(a) EQ MIN(ABS(a)))
;print, min
;y[i]=min*(1.0)/1000 + 0.000001
plot, y, a
ENDFOR
plot, x, y
END
