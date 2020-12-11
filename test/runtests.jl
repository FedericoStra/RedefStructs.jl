using RedefStructs
using Test

@testset "redef" begin
    abstract type A end
    @redef struct S end
    @redef struct S <: A end
    @redef struct S{T} end
    @redef struct S{T} <: A end
end

@testset "redef_" begin
    abstract type A end
    @redef_ struct S end
    @redef_ struct S <: A end
    @redef_ struct S{T} end
    @redef_ struct S{T} <: A end
end
