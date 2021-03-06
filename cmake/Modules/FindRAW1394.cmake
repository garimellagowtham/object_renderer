#############################################################################
#
# $Id: FindRAW1394.cmake 4056 2013-01-05 13:04:42Z fspindle $
#
# This file is part of the ViSP software.
# Copyright (C) 2005 - 2013 by INRIA. All rights reserved.
# 
# This software is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# ("GPL") version 2 as published by the Free Software Foundation.
# See the file LICENSE.txt at the root directory of this source
# distribution for additional information about the GNU GPL.
#
# For using ViSP with software that can not be combined with the GNU
# GPL, please contact INRIA about acquiring a ViSP Professional 
# Edition License.
#
# See http://www.irisa.fr/lagadic/visp/visp.html for more information.
# 
# This software was developed at:
# INRIA Rennes - Bretagne Atlantique
# Campus Universitaire de Beaulieu
# 35042 Rennes Cedex
# France
# http://www.irisa.fr/lagadic
#
# If you have questions regarding the use of this file, please contact
# INRIA at visp@inria.fr
# 
# This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
# WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
# Description:
# Try to find libraw1394 for IEEE1394 camera under Linux.
# Once run this will define: 
#
# RAW1394_FOUND
# RAW1394_INCLUDE_DIRS
# RAW1394_LIBRARIES
#
# Authors:
# Fabien Spindler
#
#############################################################################

IF(NOT UNIX)
# MESSAGE("FindRAW1394.cmake: libraw1394 only available for Unix.")
	SET(RAW1394_FOUND FALSE)
ELSE(NOT UNIX)

	FIND_PATH(RAW1394_INCLUDE_DIR libraw1394/raw1394.h
			$ENV{RAW1394_HOME}/include
			/usr/include )
#MESSAGE("DBG RAW1394_INCLUDE_DIR=${RAW1394_INCLUDE_DIR}")  

	FIND_LIBRARY(RAW1394_LIBRARY
			NAMES raw1394
			PATHS 
			$ENV{RAW1394_HOME}/lib
			/usr/lib
			)
#MESSAGE("DBG RAW1394_LIBRARY=${RAW1394_LIBRARY}")

## --------------------------------

	IF(RAW1394_LIBRARY)
		SET(RAW1394_LIBRARIES ${RAW1394_LIBRARY})
		ELSE(RAW1394_LIBRARY)
#MESSAGE("libraw1394 library not found.")
	ENDIF(RAW1394_LIBRARY)

	IF(NOT RAW1394_INCLUDE_DIR)
#MESSAGE("libraw1394 include dir not found.")
	ENDIF(NOT RAW1394_INCLUDE_DIR)

	IF(RAW1394_LIBRARIES AND RAW1394_INCLUDE_DIR)
		SET(RAW1394_INCLUDE_DIRS ${RAW1394_INCLUDE_DIR})
		SET(RAW1394_FOUND TRUE)
	ELSE(RAW1394_LIBRARIES AND RAW1394_INCLUDE_DIR)
		SET(RAW1394_FOUND FALSE)
	ENDIF(RAW1394_LIBRARIES AND RAW1394_INCLUDE_DIR)

	MARK_AS_ADVANCED(
		RAW1394_INCLUDE_DIR
		RAW1394_LIBRARIES
		RAW1394_LIBRARY
	)
ENDIF(NOT UNIX)
