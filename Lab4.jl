using Plots
using DifferentialEquations

w1 = 14.4
w2 = 1
w3 = 1
g1 = 0
g2 = 17
g3 = 15
x0 = 2
y0 = -0.2
tspan = (0.0, 31.0)

function f1(du, u, p, t)
    du[1] = u[2]
    du[2] = -w1*u[1] - g1*u[2]
end

function f2(du, u, p, t)
    du[1] = u[2]
    du[2] = -w2*u[1] - g2*u[2]
end

function f3(du, u, p, t)
    du[1] = u[2]
    du[2] = -w3*u[1] - g3*u[2] + 0.7*sin(3t)
end

prob1 = ODEProblem(f1, [x0, y0], tspan)
sol1 = solve(prob1, dtmax = 0.05)
prob2 = ODEProblem(f2, [x0, y0], tspan)
sol2 = solve(prob2, dtmax = 0.05)
prob3 = ODEProblem(f3, [x0, y0], tspan)
sol3 = solve(prob3, dtmax = 0.05)

x1 = [u[1] for u in sol1.u]
y1 = [u[2] for u in sol1.u]
x2 = [u[1] for u in sol2.u]
y2 = [u[2] for u in sol2.u]
x3 = [u[1] for u in sol3.u]
y3 = [u[2] for u in sol3.u]
t = [t for t in sol1.t]

plt1 = plot(dpi = 300, title = "Фазовый портрет", legend = false)
plot!(plt1, x1, y1, color = :red)

plt2 = plot(dpi = 300, title = "Решение уравнения", legend = false)
plot!(plt2, t, x1, color = :red)
plot!(plt2, t, y1, color = :blue)

plt3 = plot(dpi = 300, title = "Фазовый портрет", legend = false)
plot!(plt3, x2, y2, color = :red)

plt4 = plot(dpi = 300, title = "Решение уравнения", legend = false)
plot!(plt4, t, x2, color = :red)
plot!(plt4, t, y2, color = :blue)

plt5 = plot(dpi = 300, title = "Фазовый портрет", legend = false)
plot!(plt5, x3, y3, color = :red)

plt6 = plot(dpi = 300, title = "Решение уравнения", legend = false)
plot!(plt6, t, x3, color = :red)
plot!(plt6, t, y3, color = :blue)