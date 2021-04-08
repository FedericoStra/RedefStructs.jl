.PHONY: all
all: makedocs


.PHONY: makedocs
makedocs: setup-project
	julia --project make.jl


DOCTEST_CMD = \
using Documenter: DocMeta, doctest ;\
using RedefStructs ;\
DocMeta.setdocmeta!(RedefStructs, :DocTestSetup, :(using RedefStructs); recursive=true) ;\
doctest(RedefStructs)

.PHONY: doctest
doctest: setup-project
	julia --project -e '$(DOCTEST_CMD)'

SETUP_PROJECT_CMD = \
using Pkg ;\
Pkg.develop(PackageSpec(path="..")) ;\
Pkg.instantiate()

.PHONY: setup-project
setup-project:
	julia --project -e '$(SETUP_PROJECT_CMD)'
