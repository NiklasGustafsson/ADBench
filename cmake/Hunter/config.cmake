#Ceres needs glog to be built with sharedlibs
hunter_config(glog
  VERSION ${HUNTER_glog_VERSION} CMAKE_ARGS
	BUILD_SHARED_LIBS=ON
)
