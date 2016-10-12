PRO bvis6


;SET_PLOT, 'PS'
;DEVICE, Filename='bvis6.ps', /COLOR, BITS=8


U=fltarr(251,251)
V=fltarr(251,251)
Z=fltarr(251,251)
S=fltarr(251,251)
x=fltarr(4001) 
y=fltarr(4001) 
;z=intarr(3601)

;plot, x, y, xrange=[0, 4.0], yrange=[0, 2.0], xtitle='r/r_c', ytitle='v/c_s'
;XYOutS, 1, 1, 'Critical Point', Size=1.0
FOR i=0,1000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=2
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR

FOR i=1000,4000 DO BEGIN
	x[i] = i*(1.0)/1000 
	B=.01
	
	a = 4*ALOG(x[i]) + (4/x[i]) - 3
	
	OPENW, 1, 'test.dat'
	PRINTF, 1, a
	CLOSE, 1
	y[i] = NEWTON(B, 'newtfunc', /DOUBLE )
	
ENDFOR
DEVICE, DECOMPOSED = 0

FOR i= 0,250 DO BEGIN
FOR j= 0,250 DO BEGIN
p=i-125
q=j-125
r=(p^2+q^2)^(0.5)

IF r LE 100 THEN BEGIN
intr= Long(r)
theta=ATAN(p/q)
U[i, j] = y[intr] * COS(theta) 
V[i, j] = -y[intr] * SIN(theta) 
S[i, j] = ((U[i, j])^2 + (V[i, j])^2 )^(0.5)
IF r LE 40 THEN BEGIN
Z[i, j] = 0
ENDIF
ENDIF ELSE BEGIN
intr= Long(r)
theta=ATAN(p/q)
U[i, j] = y[intr] * COS(theta) 
V[i, j] = -y[intr] * SIN(theta) 
Z[i, j] =((U[i, j])^2 + (V[i, j])^2 )^(0.5)
ENDELSE
ENDFOR
ENDFOR
Z = S + Z
DEVICE, DECOMPOSED = 0

LOADCT, 0
TVSCL, Z, 0

;LOADCT, 0
;TVSCL, S, 0

;VELOVECT, U, V, /OVERPLOT
;DEVICE, /CLOSE_FILE

END

FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END


