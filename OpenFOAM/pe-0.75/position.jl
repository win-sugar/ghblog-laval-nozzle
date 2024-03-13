
using NLsolve

gasconst = 8.31446262
MW = 29e-3
cp = 1005
R = gasconst / MW
gamma = cp/(cp-R)

A0 = 0.0016129
p0 = 6895
T0 = 100
rho0 = p0/(R*T0)
a0 = sqrt( gamma*R*T0 )
#println("rho0 = $rho0")
#println("a0 = $a0")

Ts = 2/(gamma+1) * T0
ps = (2/(gamma+1))^(gamma/(gamma-1)) * p0
rhos = (2/(gamma+1))^(1/(gamma-1)) * rho0
as = sqrt( 2/(gamma+1) ) * a0
us = as
As = 0.00064516

#println("Ts = $Ts")
#println("ps = $ps")
#println("rhos = $rhos")
#println("as = $as")



#area = 0.0008129027418811211
 area = 0.0008129027418810686

f(x,area) = area - ( 1.25 - 0.25*cos( (0.2*(x[1]/2.54e-2)-1.0)*pi ) )*2.54e-2^2

#g = x -> f(x,area,gamma,As)
g(x) = f(x,area)

ini = 0.18
sol = nlsolve( g, [ ini ], show_trace=true, ftol=1e-15, method=:newton)
#sol = nlsolve( x -> f(x,area,gamma,As), [ 0.3 ])

result = sol.zero
x = result[1]
println("position = $x")

#println("x=$x  area=$area  M=",result[1])
#@show result

#rho = ( ((gamma+1)/2)/(1+(gamma-1)/2*M^2) )^(1/(gamma-1)) * rhos
#T = ((gamma+1)/2)/(1+(gamma-1)/2*M^2) * Ts
#p = ( ((gamma+1)/2)/(1+(gamma-1)/2*M^2) )^(gamma/(gamma-1)) * ps
#u = M*( ((gamma+1)/2)/(1+(gamma-1)/2*M^2) )^0.5 * us

#println("x=$x  area=$area  M=$M  p=$p  T=$T  rho=$rho  u=$u")





