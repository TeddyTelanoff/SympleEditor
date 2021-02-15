workspace "SympleEditor"
	architecture "x86"

	configurations {
		"Debug",
		"Release"
	}
	
	flags "MultiProcessorCompile"
	
outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "SympleEditor"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	
	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")
	
	files {
		"src/**.h",
		"src/**.hpp",
		
		"src/**.c",
		"src/**.cpp",
	}
	
	includedirs {
		"src",
		
		"vendor/glfw/include",
		"vendor/glew/include",
	}
	
	defines {
		"null=0",
		
		"GLEW_STATIC",
	}
	
	links {
		"vendor/glfw/lib-vc2019/glfw3",
		"vendor/glew/lib/Release/Win32/glew32s",
		
		"OpenGL32",
	}
	
	filter "configurations:Debug"
		defines "__SY_DEBUG"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"