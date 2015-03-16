module SO
    using Base

export dotplot, tomovie, chopm,  tomm, fromm

chopm(x::Complex,tol)=abs(imag(x)) < tol ? chopm(real(x)) : chopm(real(x)) + chopm(imag(x))im
chopm(x::Real,tol)=abs(x-round(x)) < tol ? int(round(x)) : x
chopm(x,tol)=x

chopm(A::Array,tol)=Any[chopm(A[k,j],tol) for k=1:size(A,1), j=1:size(A,2)]

chopm(B::AbstractArray,tol)=chopm(full(B),tol)



chopm(x)=chopm(x,1000eps())




##Plot

dotplot(r,opts...)=Main.PyPlot.scatter(real(r),imag(r),opts...)

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

end #module
