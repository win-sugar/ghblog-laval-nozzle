

#dir_path = "/path/to/your/directory"
#dir_contents = readdir(dir_path)
#
#for item in dir_contents
#    println(item)
#end

dir_path = "C:\\Users\\sato\\laval-nozzle\\openfoam-0.75\\postProcessing\\history"
#dir_path = ".\\postProcessing\\history"
#dir_contents = readdir(dir_path, join=true, filter=x -> isdir(joinpath(dir_path, x)))
dir_contents = readdir(dir_path, join=false )
#dir_contents = readdir(dir_path, join=true )

dirs = sort( parse.(Float64,dir_contents))
#dirs = [ dir for dir in dir_contents if isdir(dir) == true ]
#dirs = [ dir for dir in dir_contents ]

for item in dirs
item = 7.12241e-05
    fullpath = joinpath(dir_path, string(item), "probepoint_T_p.xy")
#   fullpath = "C:\\Users\\sato\\laval-nozzle\\openfoam-0.75\\postProcessing\\history\\7.12241e-05"
    fullpath = 'C:\Users\sato\laval-nozzle\openfoam-0.75\postProcessing\history\7.12241e-05\probepoint_T_p.xy'
    println(fullpath)

    histline = open( readlines, fullpath, "r")

    ndata = length(readlines)
    for i in 1:ndata
        println(readlines[i])
    end

end

#item = string(7.12241e-05)

