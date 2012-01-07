solution "stb"
  language "C"
  configurations { "release" }
	objdir "build"
	targetdir "build"
	
  project "stb_image"
	  kind "StaticLib"
  	files { "stb_image.c" }

  project "stb_vorbis"
	  kind "StaticLib"
  	files { "stb_vorbis.c" }

   project "stb_truetype"
	  kind "StaticLib"
  	files { "stb_truetype.c" }
