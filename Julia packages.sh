#!/usr/bin/bash

# Clone packages


if [ ! -d $HOME/Projects/SO.jl ]; then
	git clone https://github.com/dlfivefifty/SO.jl $HOME/Projects/SO.jl
fi
if [ ! -d $HOME/.julia/v$JULIA_VERSION/SO ]; then
ln -s $HOME/Projects/SO.jl $HOME/.julia/v$JULIA_VERSION/SO
fi


CMTY=JuliaApproximation
for PKG in ApproxFun SingularIntegralEquations RatFun SpectralMeasures MultivariateOrthogonalPolynomials RiemannHilbert OscillatoryIntegrals
do
    $HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG
done


CMTY=JuliaMatrices
for PKG in BandedMatrices BlockBandedMatrices
do
	$HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG
done

CMTY=MikaelSlevinsky
for PKG in HierarchicalMatrices FastTransforms
do
	$HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG
done

CMTY=ajt60gaibb
PKG=FastGaussQuadrature
$HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG


CMTY=JuliaMath
PKG=RandomMatrices
$HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG

CMTY=daanhb
PKG=Domains
$HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG

CMTY=JuliaHolomorphic
PKG=ComplexPhasePortrait
$HOME/Projects/SO.jl/clonejuliapkg.sh $CMTY $PKG




## Run in Julia

julia -e 'Pkg.update(); Pkg.add("IJulia"); Pkg.add("SingularIntegralEquations"); Pkg.add("Plots"); Pkg.add("Plotly"); Pkg.add("GR"); Pkg.add("GLVisualize");'


## Copy packages


for PKG in RatFun SpectralMeasures MultivariateOrthogonalPolynomials RiemannHilbert Domains ComplexPhasePortrait BlockBandedMatrices OscillatoryIntegrals
do
	if [ ! -d $HOME/.julia/v$JULIA_VERSION/$PKG ]; then
		ln -s $HOME/Projects/$PKG $HOME/.julia/v$JULIA_VERSION/$PKG
	fi
done

if [ ! -d $HOME/.julia/v$JULIA_VERSION/SO ]; then
	ln -s $HOME/Projects/SO.jl $HOME/.julia/v0.6/SO
fi
