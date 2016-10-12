PRO bvis4


;SET_PLOT, 'PS'
;DEVICE, Filename='bvis4.ps'


U=fltarr(11,11)
V=fltarr(11,11)
z=fltarr(11,11)
a = 10
b = 30
;plot, x, y, xrange=[0, 2.0], yrange=[0, 2.0], xtitle='r/r_c', ytitle='v/c_s'
;XYOutS, 1, 1, 'Critical Point', Size=1.0
FOR i= 0,10 DO BEGIN
FOR j= 0,10 DO BEGIN
x=i-5
y=j-5
r=(x^2+y^2)^(0.5)
theta=ATAN(y/x)
v_r = b*(1 + ((a^2)/(r^2))) * COS(theta)
v_theta = - b*(1 - ((a^2)/(r^2))) * SIN(theta)
U[i, j] = v_r * COS(theta) + v_theta * SIN(theta)
V[i, j] = - v_r * SIN(theta) + v_theta * COS(theta)
z[i,j] = (U[i, j]^2+V[i, j]^2)^(0.5)  
ENDFOR
ENDFOR

;SHADE_SURF, z

;VELOVECT, U, V

;DEVICE, DECOMPOSED = 0 
;LOADCT, 3
;tvscl, X
;SHADE_SURF, X, AX=45, AZ=45



DEVICE, DECOMPOSED = 0
LOADCT, 3
TVSCL, z

VELOVECT, U, V, OVELPLOT
;DEVICE, /CLOSE_FILE

END

