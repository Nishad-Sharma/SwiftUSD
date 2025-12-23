/* ----------------------------------------------------------------
 *  SwiftUSD - UsdSkelImaging Link
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import UsdSkelImaging

/// Ensures UsdSkelImaging C++ module is linked.
///
/// This import forces TF_REGISTRY_FUNCTION macros to execute,
/// registering skeletal animation adapters with Hydra:
/// - `UsdSkelImagingSkeletonAdapter` - Processes Skeleton prims
/// - `UsdSkelImagingSkelRootAdapter` - Processes SkelRoot prims
/// - `UsdSkelImagingAnimationAdapter` - Processes SkelAnimation prims
/// - `UsdSkelImagingResolvingSceneIndexPlugin` - Scene index for skeleton processing
public enum UsdSkelImaging
{}
