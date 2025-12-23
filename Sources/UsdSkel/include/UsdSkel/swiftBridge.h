//
// Copyright 2025 Pixar
//
// Licensed under the terms set forth in the LICENSE.txt file available at
// https://openusd.org/license.
//
#ifndef PXR_USD_USD_SKEL_SWIFT_BRIDGE_H
#define PXR_USD_USD_SKEL_SWIFT_BRIDGE_H

/// \file UsdSkel/swiftBridge.h
/// Swift-compatible bridge functions for UsdSkel types.
///
/// This header provides functions to work around Swift C++ interop limitations:
///
/// 1. Const reference returns - C++ methods that return const T& are not accessible
///    from Swift, so we provide by-value returning wrapper functions.
///
/// 2. Template methods - C++ template methods cannot be called from Swift, so we
///    provide explicit instantiations for common types (GfMatrix4d, GfMatrix4f).
///
/// 3. Inline methods - Some inline methods defined in headers without USDSKEL_API
///    are not exported to Swift modules.
///
/// ## Usage from Swift
///
/// ### SkeletonQuery Access
/// \code
/// let skelQuery = cache.getSkelQuery(skeleton)
/// let topology = Pixar.UsdSkel_Swift_SkeletonQueryGetTopology(skelQuery)
/// let animQuery = Pixar.UsdSkel_Swift_SkeletonQueryGetAnimQuery(skelQuery)
/// \endcode
///
/// ### Computing Transforms
/// \code
/// var xforms = VtMatrix4dArray()
/// if Pixar.UsdSkel_Swift_SkeletonQueryComputeJointLocalTransforms4d(
///     skelQuery, &xforms, time, false) {
///     // Use transforms...
/// }
/// \endcode

#include "pxr/pxrns.h"
#include "UsdSkel/api.h"
#include "UsdSkel/animMapper.h"
#include "UsdSkel/animQuery.h"
#include "UsdSkel/binding.h"
#include "UsdSkel/blendShapeQuery.h"
#include "UsdSkel/skeleton.h"
#include "UsdSkel/skeletonQuery.h"
#include "UsdSkel/skinningQuery.h"
#include "UsdSkel/topology.h"

#include "Gf/matrix4d.h"
#include "Gf/matrix4f.h"
#include "Tf/token.h"
#include "Usd/prim.h"
#include "Usd/timeCode.h"
#include "Vt/array.h"

PXR_NAMESPACE_OPEN_SCOPE

// ===========================================================================
// UsdSkelSkeletonQuery Swift Bridge Functions
// ===========================================================================

/// @{
/// \name UsdSkelSkeletonQuery Accessor Bridge Functions
///
/// These functions wrap const-reference returning methods to return by value.

/// Gets the skeleton from a skeleton query.
/// Wraps UsdSkelSkeletonQuery::GetSkeleton() which returns const&.
USDSKEL_API
UsdSkelSkeleton UsdSkel_Swift_SkeletonQueryGetSkeleton(
    const UsdSkelSkeletonQuery& query);

/// Gets the animation query from a skeleton query.
/// Wraps UsdSkelSkeletonQuery::GetAnimQuery() which returns const&.
USDSKEL_API
UsdSkelAnimQuery UsdSkel_Swift_SkeletonQueryGetAnimQuery(
    const UsdSkelSkeletonQuery& query);

/// Gets the topology from a skeleton query.
/// Wraps UsdSkelSkeletonQuery::GetTopology() which returns const&.
USDSKEL_API
UsdSkelTopology UsdSkel_Swift_SkeletonQueryGetTopology(
    const UsdSkelSkeletonQuery& query);

/// Gets the animation mapper from a skeleton query.
/// Wraps UsdSkelSkeletonQuery::GetMapper() which returns const&.
USDSKEL_API
UsdSkelAnimMapper UsdSkel_Swift_SkeletonQueryGetMapper(
    const UsdSkelSkeletonQuery& query);

/// @}

/// @{
/// \name UsdSkelSkeletonQuery Compute Bridge Functions (Matrix4d)
///
/// Explicit Matrix4d instantiations of template compute methods.

/// Compute joint transforms in joint-local space (Matrix4d version).
USDSKEL_API
bool UsdSkel_Swift_SkeletonQueryComputeJointLocalTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time,
    bool atRest);

/// Compute joint transforms in skeleton space (Matrix4d version).
USDSKEL_API
bool UsdSkel_Swift_SkeletonQueryComputeJointSkelTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time,
    bool atRest);

/// Compute skinning transforms (Matrix4d version).
/// These are the transforms typically used for skinning:
/// inverse(bindTransform) * jointTransform
USDSKEL_API
bool UsdSkel_Swift_SkeletonQueryComputeSkinningTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time);

/// Compute joint rest-relative transforms (Matrix4d version).
USDSKEL_API
bool UsdSkel_Swift_SkeletonQueryComputeJointRestRelativeTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time);

/// Get joint world bind transforms (Matrix4d version).
USDSKEL_API
bool UsdSkel_Swift_SkeletonQueryGetJointWorldBindTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms);

/// @}

// ===========================================================================
// UsdSkelSkinningQuery Swift Bridge Functions
// ===========================================================================

/// @{
/// \name UsdSkelSkinningQuery Accessor Bridge Functions
///
/// These wrap inline methods that aren't exported to Swift.

/// Gets the prim from a skinning query.
/// Wraps UsdSkelSkinningQuery::GetPrim() which is inline.
USDSKEL_API
UsdPrim UsdSkel_Swift_SkinningQueryGetPrim(
    const UsdSkelSkinningQuery& query);

/// Checks if a skinning query is valid.
/// Wraps UsdSkelSkinningQuery::IsValid() which is inline.
USDSKEL_API
bool UsdSkel_Swift_SkinningQueryIsValid(
    const UsdSkelSkinningQuery& query);

/// Gets the interpolation token from a skinning query.
/// Wraps UsdSkelSkinningQuery::GetInterpolation() which returns const&.
USDSKEL_API
TfToken UsdSkel_Swift_SkinningQueryGetInterpolation(
    const UsdSkelSkinningQuery& query);

/// Gets the number of influences per component.
/// Wraps UsdSkelSkinningQuery::GetNumInfluencesPerComponent() which is inline.
USDSKEL_API
int UsdSkel_Swift_SkinningQueryGetNumInfluencesPerComponent(
    const UsdSkelSkinningQuery& query);

/// Gets the skinning method attribute.
/// Wraps UsdSkelSkinningQuery::GetSkinningMethodAttr() which returns const&.
USDSKEL_API
UsdAttribute UsdSkel_Swift_SkinningQueryGetSkinningMethodAttr(
    const UsdSkelSkinningQuery& query);

/// Gets the geom bind transform attribute.
/// Wraps UsdSkelSkinningQuery::GetGeomBindTransformAttr() which returns const&.
USDSKEL_API
UsdAttribute UsdSkel_Swift_SkinningQueryGetGeomBindTransformAttr(
    const UsdSkelSkinningQuery& query);

/// Gets the joint indices primvar.
/// Wraps UsdSkelSkinningQuery::GetJointIndicesPrimvar() which returns const&.
USDSKEL_API
UsdGeomPrimvar UsdSkel_Swift_SkinningQueryGetJointIndicesPrimvar(
    const UsdSkelSkinningQuery& query);

/// Gets the joint weights primvar.
/// Wraps UsdSkelSkinningQuery::GetJointWeightsPrimvar() which returns const&.
USDSKEL_API
UsdGeomPrimvar UsdSkel_Swift_SkinningQueryGetJointWeightsPrimvar(
    const UsdSkelSkinningQuery& query);

/// Gets the blend shapes attribute.
/// Wraps UsdSkelSkinningQuery::GetBlendShapesAttr() which returns const&.
USDSKEL_API
UsdAttribute UsdSkel_Swift_SkinningQueryGetBlendShapesAttr(
    const UsdSkelSkinningQuery& query);

/// Gets the blend shape targets relationship.
/// Wraps UsdSkelSkinningQuery::GetBlendShapeTargetsRel() which returns const&.
USDSKEL_API
UsdRelationship UsdSkel_Swift_SkinningQueryGetBlendShapeTargetsRel(
    const UsdSkelSkinningQuery& query);

/// @}

// ===========================================================================
// UsdSkelTopology Swift Bridge Functions
// ===========================================================================

/// @{
/// \name UsdSkelTopology Accessor Bridge Functions
///
/// These wrap inline methods that aren't exported to Swift.

/// Gets the parent indices array from a topology.
/// Wraps UsdSkelTopology::GetParentIndices() which returns const&.
USDSKEL_API
VtIntArray UsdSkel_Swift_TopologyGetParentIndices(
    const UsdSkelTopology& topology);

/// Gets the number of joints in a topology.
/// Wraps UsdSkelTopology::GetNumJoints() which is inline.
USDSKEL_API
size_t UsdSkel_Swift_TopologyGetNumJoints(
    const UsdSkelTopology& topology);

/// Gets the parent index of a joint.
/// Wraps UsdSkelTopology::GetParent() which is inline.
USDSKEL_API
int UsdSkel_Swift_TopologyGetParent(
    const UsdSkelTopology& topology,
    size_t index);

/// Checks if a joint is a root (has no parent).
/// Wraps UsdSkelTopology::IsRoot() which is inline.
USDSKEL_API
bool UsdSkel_Swift_TopologyIsRoot(
    const UsdSkelTopology& topology,
    size_t index);

/// @}

// ===========================================================================
// UsdSkelBlendShapeQuery Swift Bridge Functions
// ===========================================================================

/// @{
/// \name UsdSkelBlendShapeQuery Accessor Bridge Functions

/// Gets the prim from a blend shape query.
/// Wraps UsdSkelBlendShapeQuery::GetPrim() which returns const&.
USDSKEL_API
UsdPrim UsdSkel_Swift_BlendShapeQueryGetPrim(
    const UsdSkelBlendShapeQuery& query);

/// Checks if a blend shape query is valid.
/// Wraps UsdSkelBlendShapeQuery::IsValid() which is inline.
USDSKEL_API
bool UsdSkel_Swift_BlendShapeQueryIsValid(
    const UsdSkelBlendShapeQuery& query);

/// Gets the number of blend shapes.
/// Wraps UsdSkelBlendShapeQuery::GetNumBlendShapes() which is inline.
USDSKEL_API
size_t UsdSkel_Swift_BlendShapeQueryGetNumBlendShapes(
    const UsdSkelBlendShapeQuery& query);

/// Gets the number of sub-shapes.
/// Wraps UsdSkelBlendShapeQuery::GetNumSubShapes() which is inline.
USDSKEL_API
size_t UsdSkel_Swift_BlendShapeQueryGetNumSubShapes(
    const UsdSkelBlendShapeQuery& query);

/// @}

// ===========================================================================
// UsdSkelBinding Swift Bridge Functions
// ===========================================================================

/// @{
/// \name UsdSkelBinding Accessor Bridge Functions

/// Gets the skeleton from a binding.
/// Wraps UsdSkelBinding::GetSkeleton() which returns const&.
USDSKEL_API
UsdSkelSkeleton UsdSkel_Swift_BindingGetSkeleton(
    const UsdSkelBinding& binding);

/// Gets the number of skinning targets in a binding.
USDSKEL_API
size_t UsdSkel_Swift_BindingGetSkinningTargetCount(
    const UsdSkelBinding& binding);

/// Gets a skinning query from a binding by index.
USDSKEL_API
UsdSkelSkinningQuery UsdSkel_Swift_BindingGetSkinningTargetAtIndex(
    const UsdSkelBinding& binding,
    size_t index);

/// @}

// ===========================================================================
// UsdSkelAnimQuery Swift Bridge Functions
// ===========================================================================

/// @{
/// \name UsdSkelAnimQuery Compute Bridge Functions (Matrix4d)

/// Compute joint local transforms (Matrix4d version).
USDSKEL_API
bool UsdSkel_Swift_AnimQueryComputeJointLocalTransforms4d(
    const UsdSkelAnimQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time);

/// @}

// ===========================================================================
// UsdSkel Transform Utilities Swift Bridge Functions
// ===========================================================================

/// @{
/// \name Transform Composition Utilities
///
/// These wrap UsdSkel utility functions for transform composition.

/// Compose transforms from translation/rotation/scale components.
/// This is essential for animation blending where transforms are decomposed,
/// blended component-wise (LERP for translation/scale, SLERP for rotation),
/// then recomposed into matrices.
///
/// Wraps UsdSkelMakeTransforms for Swift access.
///
/// \param translations Array of translation vectors (Vec3f)
/// \param rotations Array of rotation quaternions (Quatf)
/// \param scales Array of scale vectors (Vec3h)
/// \param xforms Output array for composed transforms (Matrix4d)
/// \return true if composition succeeded
USDSKEL_API
bool UsdSkel_Swift_MakeTransforms(
    const VtVec3fArray& translations,
    const VtQuatfArray& rotations,
    const VtVec3hArray& scales,
    VtMatrix4dArray* xforms);

/// @}

PXR_NAMESPACE_CLOSE_SCOPE

#endif // PXR_USD_USD_SKEL_SWIFT_BRIDGE_H
