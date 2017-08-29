#XCode command line tools

xcode-select --install

#brew

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"


brew doctor
brew update

brew install gcc
brew install cmake



# Clone packages



git clone https://github.com/dlfivefifty/SO.jl $HOME/Projects/SO.jl
git clone https://github.com/JuliaLang/julia $HOME/Projects/julia
git clone https://github.com/JuliaMatrices/BandedMatrices.jl $HOME/Projects/BandedMatrices


CMTY=JuliaApproximation
for PKG in ApproxFun SingularIntegralEquations RatFun SpectralMeasures MultivariateOrthogonalPolynomials RiemannHilbert
do
	if [ ! -d $HOME/Projects/$PKG ]; then
		git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG
	fi
done

CMTY=MikaelSlevinsky
PKG=FastTransforms
git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG


CMTY=ajt60gaibb
PKG=FastGaussQuadrature
git clone https://github.com/$CMTY/$PKG.jl $HOME/Projects/$PKG


#julia

cp $HOME/Projects/SO.jl/Make.user $HOME/Projects/julia/
cd $HOME/Projects/julia/
make



## Run in Julia

Pkg.update()
Pkg.add("IJulia"); Pkg.add("SingularIntegralEquations"); Pkg.add("Plots"); Pkg.add("Plotly"); Pkg.add("GR"); Pkg.add("GLVisualize"); 


## Copy packages


for PKG in BandedMatrices FastTransforms FastGaussQuadrature ApproxFun SingularIntegralEquations
do
	trash $HOME/.julia/v$JULIA_VERSION/$PKG
	ln -s $HOME/Projects/$PKG $HOME/.julia/v$JULIA_VERSION/$PKG
done


for PKG in RatFun SpectralMeasures MultivariateOrthogonalPolynomials RiemannHilbert
do
	if [ ! -d $HOME/.julia/v$JULIA_VERSION/$PKG ]; then
		ln -s $HOME/Projects/$PKG $HOME/.julia/v$JULIA_VERSION/$PKG
	fi
done

ln -s $HOME/Projects/SO.jl $HOME/.julia/v0.6/SO

## Run in command line

~/.julia/v$JULIA_VERSION/Conda/deps/usr/bin/jupyter notebook
