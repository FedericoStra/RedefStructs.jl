```@meta
CurrentModule = RedefStructs
```

# RedefStructs.jl

Documentation for [RedefStructs.jl](https://github.com/FedericoStra/RedefStructs.jl).

This package provides the macro [`@redef`](@ref), which allows to create `struct`ures which are redefinable.

## Example

```jldoctest
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

## Library

```@index
```

```@autodocs
Modules = [RedefStructs]
```
