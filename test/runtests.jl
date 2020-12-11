using RedefStructs
using Test

@testset "redef" begin
    @testset "valid" begin
        abstract type A end
        @redef struct S end
        @redef struct S <: A end
        @redef struct S{T} end
        @redef struct S{T} <: A end
    end
    # @testset "invalid" begin
    #     abstract type A end
    #     @test_throws ErrorException @redef S
    #     @test_throws ErrorException @redef :S
    #     @test_throws ErrorException @redef 1+2
    # end
end



@testset "redef_print" begin
    abstract type A end
    @redef_print struct S end
    @redef_print struct S <: A end
    @redef_print struct S{T} end
    @redef_print struct S{T} <: A end
end
