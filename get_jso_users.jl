import GitHub, PkgDeps  # both export users()

jso_repos, _ = GitHub.repos("JuliaSmoothOptimizers")
jso_names = [splitext(x.name)[1] for x ∈ jso_repos]

dependents = Dict{String,Vector{String}}()

for name ∈ jso_names
    try
        dependents[name] = filter(x -> x ∈ jso_names, PkgDeps.users(name))
    catch e
        # package not registered; don't insert into dependents
    end
end

for name ∈ keys(dependents)
    @info "" name, dependents[name]

    if length(dependents[name]) > 0
        open(name * "-dependents.txt", "w") do f
            for dep ∈ dependents[name]
                println(f, dep)
            end
        end
    end
end
