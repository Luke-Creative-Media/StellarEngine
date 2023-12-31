project "Engine"
    kind "SharedLib"
    language "C++"
    cppdialect "C++20"
    targetdir "Binaries/%{cfg.buildcfg}"
    staticruntime "off"

    files {
        "source/**.h",
        "source/**.cpp",
        "source/**.c",
    }

    includedirs
    {
       "source",
    }

    sysincludedirs {
        "$(SolutionDir)Dependencies/include"
    }

    syslibdirs {
        "$(SolutionDir)Dependencies/lib"
    }

    links {
        "opengl32.lib",
        "GLFW.lib"
    }

    targetdir ("../Binaries/" .. OutputDir .. "/")
    objdir ("../Binaries/Intermediates/" .. OutputDir .. "/")

    filter "system:windows"
        systemversion "latest"
        defines { }

    filter "configurations:Debug"
        defines { "DEBUG", "ST_PLATFORM_WINDOWS", "ST_BUILD_DLL" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines { "RELEASE", "ST_PLATFORM_WINDOWS", "ST_BUILD_DLL" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist"
        defines { "DIST", "ST_PLATFORM_WINDOWS", "ST_BUILD_DLL" }
        runtime "Release"
        optimize "On"
        symbols "Off"