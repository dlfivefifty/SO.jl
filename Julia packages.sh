#!/usr/bin/bash

# Clone packages


if [ ! -d $HOME/Projects/SO.jl ]; then
	git clone https://github.com/dlfivefifty/SO.jl $HOME/Projects/SO.jl
fi
if [ ! -d $HOME/Projects/julia ]; then
	git clone https://github.com/JuliaLang/julia $HOME/Projects/julia
fi



CMTY=JuliaApproximation
for PKG in ApproxFun SingularIntegralEquations RatFun SpectralMeasures MultivariateOrthogonalPolynomials RiemannHilbert
do
	if [ ! -d $HOME/Projects/$PKG ]; then
		git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
	fi
done


CMTY=JuliaMatrices
PKG=BandedMatrices
if [ ! -d $HOME/Projects/$PKG ]; then
	git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
fi


CMTY=MikaelSlevinsky
for PKG in HierarchicalMatrices FastTransforms
do
	if [ ! -d $HOME/Projects/$PKG ]; then
		git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
	fi
done

CMTY=ajt60gaibb
PKG=FastGaussQuadrature
if [ ! -d $HOME/Projects/$PKG ]; then
	git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
fi


CMTY=JuliaMath
PKG=RandomMatrices
if [ ! -d $HOME/Projects/$PKG ]; then
	git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
fi

CMTY=daanhb
PKG=Domains
if [ ! -d $HOME/Projects/$PKG ]; then
	git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
fi

CMTY=dlfivefifty
PKG=ComplexPhasePortrait
if [ ! -d $HOME/Projects/$PKG ]; then
	git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
fi




## Run in Julia

julia -e 'Pkg.update(); Pkg.add("IJulia"); Pkg.add("SingularIntegralEquations"); Pkg.add("Plots"); Pkg.add("Plotly"); Pkg.add("GR"); Pkg.add("GLVisualize");'


## Copy packages


                     c 


for PKG in RatFun SpectralMeasures MultivariateOrthogonalPolynomials RiemannHilbert Domains ComplexPhasePortrait
do
	if [ ! -d $HOME/.julia/v$JULIA_VERSION/$PKG ]; then
		ln -s $HOME/Projects/$PKG $HOME/.julia/v$JULIA_VERSION/$PKG
	fi
done

if [ ! -d $HOME/.julia/v$JULIA_VERSION/SO ]; then
	ln -s $HOME/Projects/SO.jl $HOME/.julia/v0.6/SO
fi
