workspace "GameEngine"
	architecture "x64"
	
	configurations
	{
		"Debug", 
		"Release", 
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

-- Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "GameEngine/vendor/GLFW/include"
IncludeDir["GLAD"] = "GameEngine/vendor/GLAD/include"
IncludeDir["ImGui"] = "GameEngine/vendor/imgui"
IncludeDir["glm"] = "GameEngine/vendor/glm"

include "GameEngine/vendor/GLFW"
include "GameEngine/vendor/GLAD"
include "GameEngine/vendor/ImGui"

project "GameEngine"
	location "GameEngine"
	kind "StaticLib"
	language "C++"
	staticruntime "on"		
	cppdialect "C++17"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	pchheader "egpch.h"
	pchsource "GameEngine/src/egpch.cpp"
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp", 
		"%{prj.name}/vendor/glm/glm/**.hpp",
		"%{prj.name}/vendor/glm/glm/**.inl",
	}
	
	includedirs
	{
		"%{prj.name}/src",
		"%{prj.name}/vendor/spdlog/include",
		"%{IncludeDir.GLFW}",
		"%{IncludeDir.GLAD}",
		"%{IncludeDir.ImGui}",
		"{IncludeDir.glm}",
	}
	
	links
	{
		"GLFW",
		"GLAD",
		"ImGui",
		"opengl32.lib"
	}
	
	
	
	filter "system:windows"
		systemversion "latest"
		
		defines
		{
			"GE_PLATFORM_WINDOWS",
			"GE_BUILD_DLL",
			"GLFW_INCLUDE_NONE"
		}
	
		
	filter "configurations:Debug"
		defines "GE_DEBUG"
		runtime "Debug"
		symbols "on"
		
	filter "configurations:Release"
		defines "GE_RELEASE"
		runtime "Release"
		optimize "on"
		
	filter "configurations:Dist"
		defines "GE_DIST"
		runtime "Release"
		optimize "on"
		
project "SandBox"
	location "SandBox"
	kind "ConsoleApp"
	language "C++"
	staticruntime "on"
	cppdialect "C++17"
	
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
	
	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	
	includedirs
	{
		"GameEngine/vendor/spdlog/include",
		"GameEngine/src",
		"{IncludeDir.glm}",
		"GameEngine/vendor",
	}
	
	links
	{
		"GameEngine"
	}
	
	filter "system:windows"
		systemversion "latest"
		
		defines
		{
			"GE_PLATFORM_WINDOWS"
		}
		
	filter "configurations:Debug"
		defines "GE_DEBUG"
		runtime "Debug"
		symbols "On"
		
	filter "configurations:Release"
		defines "GE_RELEASE"
		runtime "Release"
		optimize "On"
		
	filter "configurations:Dist"
		defines "GE_DIST"
		runtime "Release"
		optimize "On"
		