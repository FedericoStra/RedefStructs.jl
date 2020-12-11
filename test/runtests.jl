using RedefStructs
using Test

@testset "redef" begin
    @testset "valid" begin
        abstract type A end
        @test (@redef struct S end; true)
        @test (@redef struct S <: A end; true)
        @test (@redef struct S{T} end; true)
        @test (@redef struct S{T} <: A end; true)
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
    @test (@redef_print struct S end; true)
    @test (@redef_print struct S <: A end; true)
    @test_broken (@redef_print struct S{T} end; true)
    @test_broken (@redef_print struct S{T} <: A end; true)
end
