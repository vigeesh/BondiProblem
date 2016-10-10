PRO bvis8


;SET_PLOT, 'PS'
;DEVICE, Filename='bvis4.ps'


U=fltarr(21,21)
V=fltarr(21,21)

b = 300

FOR i= 0,20 DO BEGIN
FOR j= 0,20 DO BEGIN
x=i-10
y=j-10
U[i, j] = b*(x^2 - y^2)
V[i, j] = -2*b*x*y
ENDFOR
ENDFOR


VELOVECT, U, V


;DEVICE, /CLOSE_FILE

END

