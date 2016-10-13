PRO bvis91


SET_PLOT, 'PS'
DEVICE, Filename='bondivis.ps', /COLOR, BITS=8


U=fltarr(2501,2501)
V=fltarr(2501,2501)
Z=fltarr(2501,2501)
S=fltarr(2501,2501)
x=fltarr(4001) 
y=fltarr(4001) 


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


FOR i= 0,2500 DO BEGIN
FOR j= 0,2500 DO BEGIN
p=(i-1250)/10
q=(j-1250)/10
r=(p^2+q^2)^(0.5)

IF r LE 33 THEN BEGIN
Z[i, j] = 0
ENDIF ELSE BEGIN


IF r LE 100 THEN BEGIN
U[i, j] = y[intr] * COS(theta) 
V[i, j] = -y[intr] * SIN(theta) 
Z[i, j] =1/(1.05*(((U[i, j])^2 + (V[i, j])^2 )^(0.5))) 
ENDIF ELSE BEGIN

intr= Long(r)
theta=ATAN(p/q)
U[i, j] = y[intr] * COS(theta) 
V[i, j] = -y[intr] * SIN(theta) 
Z[i, j] =1/(((U[i, j])^2 + (V[i, j])^2 )^(0.5))
ENDELSE

ENDELSE

ENDFOR

ENDFOR

;DEVICE, DECOMPOSED = 0
LOADCT, 3
TVSCL, SMOOTH(Z,3), 0
XYOutS, 5500, 6000, 'STAR', charsize= 2.0, charthick= 4.0, COLOR =  255, /DEVICE
XYOutS, 5100, 11450, 'Sound Horizon', charsize=1.0, COLOR = 0, /DEVICE

DEVICE, /CLOSE_FILE

END

FUNCTION newtfunc, B
OPENR, 1, 'test.dat' 
READF, 1, A
CLOSE, 1
RETURN, [B^2 - ALOG(B^2) - A]
END


