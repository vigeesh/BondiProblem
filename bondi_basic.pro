PRO b6

x=fltarr(100002)
y=fltarr(100002) 
a=fltarr(100002)
b=fltarr(100002)
g=fltarr(100002)

FOR i=1,5000  DO BEGIN
	x[i] = i*(1.0)/1000
	a[i] = (4*ALOG10(x[i])) + (4/x[i]) - 3
	FOR j=1,5000  DO BEGIN
		y[j] = j*(1.0)/1000
		b[j] = ((y[j])^2) - (ALOG10((y[j])^2)) 
		g[j] = b[j] - a[i]
		print, x[i], y[j], a[i], b[j], g[j]
	ENDFOR
	plot, g, y
ENDFOR
END
