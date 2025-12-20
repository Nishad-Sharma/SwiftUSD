#ifndef __PXR_IMAGING_GLF_H__
#define __PXR_IMAGING_GLF_H__

// glf
#include <Glf/api.h>
#include <Glf/bindingMap.h>
#include <Glf/contextCaps.h>
#include <Glf/debugCodes.h>
#include <Glf/diagnostic.h>
#include <Glf/drawTarget.h>
#include <Glf/glContext.h>

// glContextRegistry.h uses TfSingleton with inline GetInstance() which causes
// module serialization failures on Windows due to the _instance static variable
// definition not being visible during module compilation
#if !defined(_WIN32)
#include <Glf/glContextRegistry.h>
#endif

#include <Glf/glRawContext.h>
#include <Glf/info.h>
#include <Glf/simpleLight.h>
#include <Glf/simpleLightingContext.h>
#include <Glf/simpleMaterial.h>
#include <Glf/simpleShadowArray.h>
#include <Glf/texture.h>
#include <Glf/uniformBlock.h>
#include <Glf/utils.h>

#include <Glf/testGLContext.h>
#endif  // __PXR_IMAGING_GLF_H__
