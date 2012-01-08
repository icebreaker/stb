solution "stb"
  language "C"
  configurations { "release" }
	objdir "build"
	targetdir "build"

  configuration { "linux", "gmake" }
    buildoptions { "-fPIC" }
	
  project "stb_image"
	  kind "StaticLib"
  	files { "stb_image.c" }

  project "stb_vorbis"
	  kind "StaticLib"
  	files { "stb_vorbis.c" }

  project "stb_truetype"
	  kind "StaticLib"
    files { "stb_truetype.c" }

newoption
{
  trigger = "prefix",
  description = "Install prefix"
}

newaction 
{
	trigger     = "install",
	description = "Install into the location specified by --prefix.",
	execute		  = function()
    if _OPTIONS["prefix"] then
      local libdir = path.join(_OPTIONS["prefix"], "lib")
      local incdir = path.join(_OPTIONS["prefix"], "include")
      
      os.copyfile("stb_image.h"   , incdir)
      os.copyfile("stb_vorbis.h"  , incdir)
      os.copyfile("stb_truetype.h", incdir)
      os.copyfile("build/libstb_image.a"    , libdir)
      os.copyfile("build/libstb_vorbis.a"   , libdir)
      os.copyfile("build/libstb_truetype.a" , libdir)
    else
      print("No --prefix was specified.")
    end
	end
}
