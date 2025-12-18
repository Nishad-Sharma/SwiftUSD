#ifndef __PXR_BASE_ARCH_H__
#define __PXR_BASE_ARCH_H__

// Arch
#include <Arch/api.h>
#include <Arch/swiftInterop.h>

// the check for __cplusplus here, ensures that
// the Arch module (like when built from Swift)
// is compliant with C, needed for openexr-c.c
// to include Arch/pragmas.

#if defined(__cplusplus)
#include <Arch/align.h>
#include <Arch/attributes.h>
#include <Arch/buildMode.h>
#include <Arch/debugger.h>
#include <Arch/defines.h>
#include <Arch/export.h>
#include <Arch/functionLite.h>
#include <Arch/hash.h>
#include <Arch/hints.h>
#include <Arch/pragmas.h>
#include <Arch/testArchAbi.h>
#include <Arch/testArchUtil.h>
#include <Arch/threads.h>
#include <Arch/timing.h>
#include <Arch/inttypes.h>
#include <Arch/math.h>

// Note: The following headers are excluded from the Arch module on Windows
// because they include <string> which triggers ICU module loading via the MSVC STL's
// <cuchar> -> <uchar.h> chain. ICU's module map has header search path issues that
// prevent it from building correctly when triggered indirectly.
// These headers are still available for direct C++ inclusion in .cpp files.
#if !defined(_WIN32)
#include <Arch/daemon.h>
#include <Arch/demangle.h>
#include <Arch/env.h>
#include <Arch/error.h>
#include <Arch/fileSystem.h>
#include <Arch/function.h>
#include <Arch/library.h>
#include <Arch/mallocHook.h>
#include <Arch/stackTrace.h>
#include <Arch/symbols.h>
#include <Arch/systemInfo.h>
#include <Arch/virtualMemory.h>
#include <Arch/vsnprintf.h>
#include <Arch/errno.h>
#include <Arch/regex.h>
#endif
#else // !defined(__cplusplus)
#include <Arch/defines.h>
#include <Arch/export.h>
#include <Arch/pragmas.h>
#endif // defined(__cplusplus)

#endif  // __PXR_BASE_ARCH_H__
