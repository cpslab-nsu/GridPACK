# -------------------------------------------------------------
# file: FindCPLEX.cmake
# -------------------------------------------------------------
# -------------------------------------------------------------
# Obtained from 
# http://lemon.cs.elte.hu/trac/lemon/browser/lemon/cmake/FindCPLEX.cmake
# -------------------------------------------------------------
# -------------------------------------------------------------
# Last Change: 2015-09-16 08:09:15 d3g096
# -------------------------------------------------------------

SET(CPLEX_ROOT_DIR "" CACHE PATH "CPLEX root directory")

FIND_PATH(CPLEX_INCLUDE_DIR
  ilcplex/cplex.h
  PATHS "C:/ILOG/CPLEX91/include"
  PATHS "/opt/ilog/cplex91/include"
  HINTS ${CPLEX_ROOT_DIR}/include
)
FIND_LIBRARY(CPLEX_LIBRARY
  cplex91
  PATHS "C:/ILOG/CPLEX91/lib/msvc7/stat_mda"
  PATHS "/opt/ilog/cplex91/bin"
  HINTS ${CPLEX_ROOT_DIR}/bin
)

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(CPLEX DEFAULT_MSG CPLEX_LIBRARY CPLEX_INCLUDE_DIR)

FIND_PATH(CPLEX_BIN_DIR
  cplex91.dll
  PATHS "C:/ILOG/CPLEX91/bin/x86_win32"
)

IF(CPLEX_FOUND)
  SET(CPLEX_INCLUDE_DIRS ${CPLEX_INCLUDE_DIR})
  SET(CPLEX_LIBRARIES ${CPLEX_LIBRARY})
  IF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    SET(CPLEX_LIBRARIES "${CPLEX_LIBRARIES};m;pthread")
  ENDIF(CMAKE_SYSTEM_NAME STREQUAL "Linux")
ENDIF(CPLEX_FOUND)

MARK_AS_ADVANCED(CPLEX_LIBRARY CPLEX_INCLUDE_DIR CPLEX_BIN_DIR)

IF(CPLEX_FOUND)
  SET(HAVE_CPLEX TRUE)
ENDIF(CPLEX_FOUND)
