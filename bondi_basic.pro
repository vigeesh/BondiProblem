
PRO b11


x=fltarr(1) 
y=fltarr(1) 
;B=fltarr(1)
a=fltarr(1)
c=fltarr(1)
x = 1*(1.0)/1000
B = 0.00001
y = NEWTON(B, 'newtfunc')
print, x, y

END

FUNCTION newtfunc, B
RETURN, [B^2 - ALOG10(B^2) -4*ALOG10(0.00001) + (4/0.00001) - 3 ]
END
