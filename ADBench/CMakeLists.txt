﻿# CMakeList.txt : CMake project for ADBench, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.6)


function(JOIN VALUES GLUE OUTPUT)
  string (REGEX REPLACE "([^\\]|^);" "\\1${GLUE}" _TMP_STR "${VALUES}")
  string (REGEX REPLACE "[\\](.)" "\\1" _TMP_STR "${_TMP_STR}")
  set (${OUTPUT} "${_TMP_STR}" PARENT_SCOPE)
endfunction()

JOIN("${GMM_D_VALS}" ", " GMM_D_STR)
JOIN("${GMM_K_VALS}" ", " GMM_K_STR)

# Output CMake variables to powershell script
file(WRITE "${CMAKE_CURRENT_LIST_DIR}/cmake-vars-${AD_BUILD_TYPE}.ps1"
	"$bindir = \"${CMAKE_BINARY_DIR}\"\n$buildtype = \"${AD_BUILD_TYPE}\"\n$gmm_d_vals = @(${GMM_D_STR})\n$gmm_k_vals = @(${GMM_K_STR})\n")
