using LiveServer

sw = LiveServer.SimpleWatcher()

push!(sw.watchedfiles, LiveServer.WatchedFile(joinpath(@__DIR__, "make.jl")))
push!(sw.watchedfiles, LiveServer.WatchedFile(joinpath(@__DIR__, "src", "index.jl")))

callback = x -> include(joinpath(@__DIR__, "make.jl"))
callback(nothing) # make sure files exist
LiveServer.set_callback!(sw, callback)

LiveServer.serve(sw; dir = joinpath(@__DIR__, "build"), verbose=true)
