-- needed to build with msvc-wine
if is_plat("windows") then
    add_cxxflags("cl::/std:c++23preview", {force = true})
else
    set_languages("c++23")
end

-- include subprojects
includes("lib/commonlibsse", "extern/styyx-utils")

local MOD_NAME = "PlaceHolder"
local MOD_VERSION = "0.0.0"
local MOD_DESC = "PlaceHolder"

-- set project constants
set_project(MOD_NAME)
set_version(MOD_VERSION)
set_license("GPL-3.0")
set_warnings("allextra")
set_encodings("utf-8")

--{{ADDITIONAL CONFIGS}}--

-- add common rules
add_rules("mode.debug", "mode.releasedbg")
add_rules("plugin.vsxmake.autoupdate")

-- define targets
target(MOD_NAME)
    add_deps("styyx-util")
    add_rules("commonlibsse.plugin", {
        name = MOD_NAME,
        author = "styyx",
        description = MOD_DESC
    })

    -- add src files
    add_files("src/**.cpp")
    add_headerfiles("src/**.h")
    add_includedirs("src")
    set_pcxxheader("src/pch.h")
