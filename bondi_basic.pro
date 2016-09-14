PRO bond
r=fltarr(1002)
u=fltarr(1002)
FOR i=.01,2, 0.001 DO BEGIN
	r[i]=i
	print, r[i]
	u[i+1] = u[i] + delta*(((1/r[i]^2)-(2*a^2/r[i]))/((a^2)/u[i])- u[i])
ENDFOR
END
