//
// Copyright 2025 Pixar
//
// Licensed under the terms set forth in the LICENSE.txt file available at
// https://openusd.org/license.
//

#include "UsdSkel/swiftBridge.h"
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

PXR_NAMESPACE_OPEN_SCOPE

// ===========================================================================
// UsdSkelSkeletonQuery Swift Bridge Functions
// ===========================================================================

UsdSkelSkeleton
UsdSkel_Swift_SkeletonQueryGetSkeleton(const UsdSkelSkeletonQuery& query)
{
    return query.GetSkeleton();
}

UsdSkelAnimQuery
UsdSkel_Swift_SkeletonQueryGetAnimQuery(const UsdSkelSkeletonQuery& query)
{
    return query.GetAnimQuery();
}

UsdSkelTopology
UsdSkel_Swift_SkeletonQueryGetTopology(const UsdSkelSkeletonQuery& query)
{
    return query.GetTopology();
}

UsdSkelAnimMapper
UsdSkel_Swift_SkeletonQueryGetMapper(const UsdSkelSkeletonQuery& query)
{
    return query.GetMapper();
}

bool
UsdSkel_Swift_SkeletonQueryComputeJointLocalTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time,
    bool atRest)
{
    if (!xforms) {
        return false;
    }
    return query.ComputeJointLocalTransforms(xforms, time, atRest);
}

bool
UsdSkel_Swift_SkeletonQueryComputeJointSkelTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time,
    bool atRest)
{
    if (!xforms) {
        return false;
    }
    return query.ComputeJointSkelTransforms(xforms, time, atRest);
}

bool
UsdSkel_Swift_SkeletonQueryComputeSkinningTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time)
{
    if (!xforms) {
        return false;
    }
    return query.ComputeSkinningTransforms(xforms, time);
}

bool
UsdSkel_Swift_SkeletonQueryComputeJointRestRelativeTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time)
{
    if (!xforms) {
        return false;
    }
    return query.ComputeJointRestRelativeTransforms(xforms, time);
}

bool
UsdSkel_Swift_SkeletonQueryGetJointWorldBindTransforms4d(
    const UsdSkelSkeletonQuery& query,
    VtMatrix4dArray* xforms)
{
    if (!xforms) {
        return false;
    }
    return query.GetJointWorldBindTransforms(xforms);
}

// ===========================================================================
// UsdSkelSkinningQuery Swift Bridge Functions
// ===========================================================================

UsdPrim
UsdSkel_Swift_SkinningQueryGetPrim(const UsdSkelSkinningQuery& query)
{
    return query.GetPrim();
}

bool
UsdSkel_Swift_SkinningQueryIsValid(const UsdSkelSkinningQuery& query)
{
    return query.IsValid();
}

TfToken
UsdSkel_Swift_SkinningQueryGetInterpolation(const UsdSkelSkinningQuery& query)
{
    return query.GetInterpolation();
}

int
UsdSkel_Swift_SkinningQueryGetNumInfluencesPerComponent(
    const UsdSkelSkinningQuery& query)
{
    return query.GetNumInfluencesPerComponent();
}

UsdAttribute
UsdSkel_Swift_SkinningQueryGetSkinningMethodAttr(
    const UsdSkelSkinningQuery& query)
{
    return query.GetSkinningMethodAttr();
}

UsdAttribute
UsdSkel_Swift_SkinningQueryGetGeomBindTransformAttr(
    const UsdSkelSkinningQuery& query)
{
    return query.GetGeomBindTransformAttr();
}

UsdGeomPrimvar
UsdSkel_Swift_SkinningQueryGetJointIndicesPrimvar(
    const UsdSkelSkinningQuery& query)
{
    return query.GetJointIndicesPrimvar();
}

UsdGeomPrimvar
UsdSkel_Swift_SkinningQueryGetJointWeightsPrimvar(
    const UsdSkelSkinningQuery& query)
{
    return query.GetJointWeightsPrimvar();
}

UsdAttribute
UsdSkel_Swift_SkinningQueryGetBlendShapesAttr(
    const UsdSkelSkinningQuery& query)
{
    return query.GetBlendShapesAttr();
}

UsdRelationship
UsdSkel_Swift_SkinningQueryGetBlendShapeTargetsRel(
    const UsdSkelSkinningQuery& query)
{
    return query.GetBlendShapeTargetsRel();
}

// ===========================================================================
// UsdSkelTopology Swift Bridge Functions
// ===========================================================================

VtIntArray
UsdSkel_Swift_TopologyGetParentIndices(const UsdSkelTopology& topology)
{
    return topology.GetParentIndices();
}

size_t
UsdSkel_Swift_TopologyGetNumJoints(const UsdSkelTopology& topology)
{
    return topology.GetNumJoints();
}

int
UsdSkel_Swift_TopologyGetParent(const UsdSkelTopology& topology, size_t index)
{
    return topology.GetParent(index);
}

bool
UsdSkel_Swift_TopologyIsRoot(const UsdSkelTopology& topology, size_t index)
{
    return topology.IsRoot(index);
}

// ===========================================================================
// UsdSkelBlendShapeQuery Swift Bridge Functions
// ===========================================================================

UsdPrim
UsdSkel_Swift_BlendShapeQueryGetPrim(const UsdSkelBlendShapeQuery& query)
{
    return query.GetPrim();
}

bool
UsdSkel_Swift_BlendShapeQueryIsValid(const UsdSkelBlendShapeQuery& query)
{
    return query.IsValid();
}

size_t
UsdSkel_Swift_BlendShapeQueryGetNumBlendShapes(
    const UsdSkelBlendShapeQuery& query)
{
    return query.GetNumBlendShapes();
}

size_t
UsdSkel_Swift_BlendShapeQueryGetNumSubShapes(
    const UsdSkelBlendShapeQuery& query)
{
    return query.GetNumSubShapes();
}

// ===========================================================================
// UsdSkelBinding Swift Bridge Functions
// ===========================================================================

UsdSkelSkeleton
UsdSkel_Swift_BindingGetSkeleton(const UsdSkelBinding& binding)
{
    return binding.GetSkeleton();
}

size_t
UsdSkel_Swift_BindingGetSkinningTargetCount(const UsdSkelBinding& binding)
{
    return binding.GetSkinningTargets().size();
}

UsdSkelSkinningQuery
UsdSkel_Swift_BindingGetSkinningTargetAtIndex(
    const UsdSkelBinding& binding,
    size_t index)
{
    const VtArray<UsdSkelSkinningQuery>& targets = binding.GetSkinningTargets();
    if (index >= targets.size()) {
        return UsdSkelSkinningQuery();
    }
    return targets[index];
}

// ===========================================================================
// UsdSkelAnimQuery Swift Bridge Functions
// ===========================================================================

bool
UsdSkel_Swift_AnimQueryComputeJointLocalTransforms4d(
    const UsdSkelAnimQuery& query,
    VtMatrix4dArray* xforms,
    UsdTimeCode time)
{
    if (!xforms) {
        return false;
    }
    return query.ComputeJointLocalTransforms(xforms, time);
}

PXR_NAMESPACE_CLOSE_SCOPE
