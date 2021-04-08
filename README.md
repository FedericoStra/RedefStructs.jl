# RedefStructs.jl

![Lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)<!--
![Lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-stable-green.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-retired-orange.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-archived-red.svg)
![Lifecycle](https://img.shields.io/badge/lifecycle-dormant-blue.svg) -->
[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://FedericoStra.github.io/RedefStructs.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://FedericoStra.github.io/RedefStructs.jl/dev)
[![Build Status](https://github.com/FedericoStra/RedefStructs.jl/workflows/CI/badge.svg)](https://github.com/FedericoStra/RedefStructs.jl/actions)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

This package provides the macro `@redef`, which allows to create `struct`ures which are redefinable.

## Example

```julia
julia> using RedefStructs

julia> @redef struct S
           s::String
       end

julia> S("Hello").s
"Hello"

julia> @redef mutable struct S
           n::Int
       end

julia> S(42).n
42
```
