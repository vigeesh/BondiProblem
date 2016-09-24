PRO b1
x=fltarr(100002)
y=fltarr(100002) 
a=fltarr(100002)

;FOR c=-1000,100 DO BEGIN
FOR i=.001,1, 0.0001 DO BEGIN
	x[i]=i
	;print, x[i]
	a[i] = 4*alog(x[i]) + (4/x[i]) + 2
	;print, a[i]
	IF a[i] LT 0 THEN CONTINUE
	y[i] = sqrt(a[i])
	b = alog(y[i]^2)
	d = y[i]^2 - b - a[i]
	print, d	
	print, y[i]
ENDFOR
;print, c
plot, x, y, xrange=[0,2], yrange=[0,2] 
;ENDFOR
END
