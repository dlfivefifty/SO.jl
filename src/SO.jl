module SO
    using Base, ApproxFun, Juno

export dotplot, tomovie, chopm,  tomm, fromm, latex2unicode

chopm(x::Complex,tol)=abs(imag(x)) < tol ? chopm(real(x),tol) : chopm(real(x),tol) + chopm(imag(x),tol)im
chopm(x::Real,tol)=abs(x-round(x)) < tol ? round(Int,x) : x
chopm(x,tol)=x

chopm(A::Array,tol)=Any[chopm(A[k,j],tol) for k=1:size(A,1), j=1:size(A,2)]

chopm(B::AbstractArray,tol)=chopm(Matrix(B),tol)



chopm(x)=chopm(x,1000eps())




##Plot

dotplot(r,opts...)=Main.Gadfly.plot(x=real(r),y=imag(r),opts...)


function tomovie(v::Array;plotfunction=plot,zlims=-1,opts...)
    tm=string(time_ns())
    dr="/tmp/" * tm * "mov"

    mkdir(dr)

    for k=1:size(v,1)
        for j=1:size(v,2)
            if zlims!=-1
                PyPlot.zlim(zlims[1],zlims[2])
            end
            plotfunction(v[k,j];opts...)
        end
        PyPlot.savefig(dr * "/" * string(k) * ".png")
        PyPlot.clf()
    end

    run(`ffmpeg -r 25 -i $dr/%d.png $dr/out.mpg`)
    run(`open $dr/out.mpg`)
end


## Marthematica

tomm(A::Array)=writecsv("/tmp/juliatowm.csv",A)
frommm()=readcsv("/tmp/juliatowm.csv")


ENV["COLUMNS"]=130

Juno.render(i::Juno.Inline,f::Fun) = string(f)

let changevals = ("ℝ", "ℂ", "ℤ", "≅", "≥", "≤", "±", "⊢", "∈", "⊂", "≠", "ℓ", "⊕", "⊗", "⊤", "→", "×", "…", "⋯", "⋱", "⋮", string.('𝐚':'𝐳')..., string.('α':'ω')..., string.('Α':'Ω')...)
    global function latex2unicode(str)
        for k in sort(collect(keys(REPL.REPLCompletions.latex_symbols)); lt=(x,y) -> !isless(length(x),length(y)))
            v = REPL.REPLCompletions.latex_symbols[k]
            if v in changevals
                str = replace(str, k => v)
            end
        end
        str
    end
	global function unicode2latex(str)
        for k in sort(collect(keys(REPL.REPLCompletions.latex_symbols)); lt=(x,y) -> !isless(length(x),length(y)))
            v = REPL.REPLCompletions.latex_symbols[k]
            if v in changevals
                str = replace(str, v => k)
            end
        end
        str
    end
end

end #module
