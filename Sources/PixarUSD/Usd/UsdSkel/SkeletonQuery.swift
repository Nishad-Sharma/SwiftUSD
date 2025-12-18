/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.SkeletonQuery
{
  // MARK: - Validity

  /// Return true if this query is valid.
  var isValid: Bool
  {
    IsValid()
  }

  // MARK: - Pose Availability

  /// Returns true if the skeleton has a valid bind pose.
  func hasBindPose() -> Bool
  {
    HasBindPose()
  }

  /// Returns true if the skeleton has a valid rest pose.
  func hasRestPose() -> Bool
  {
    HasRestPose()
  }

  // MARK: - Prim Access

  /// Returns the underlying Skeleton primitive.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }

  /// Returns the bound skeleton instance, if any.
  func getSkeleton() -> UsdSkel.Skeleton
  {
    Pixar.UsdSkel_Swift_SkeletonQueryGetSkeleton(self)
  }

  /// Returns the animation query that provides animation for the bound skeleton, if any.
  func getAnimQuery() -> UsdSkel.AnimQuery
  {
    Pixar.UsdSkel_Swift_SkeletonQueryGetAnimQuery(self)
  }

  /// Returns the topology of the bound skeleton instance, if any.
  func getTopology() -> UsdSkel.Topology
  {
    Pixar.UsdSkel_Swift_SkeletonQueryGetTopology(self)
  }

  /// Returns a mapper for remapping from the bound animation to the skeleton.
  func getMapper() -> UsdSkel.AnimMapper
  {
    Pixar.UsdSkel_Swift_SkeletonQueryGetMapper(self)
  }

  // MARK: - Joint Order

  /// Returns an array of joint paths describing the order and parent-child relationships.
  func getJointOrder() -> VtTokenArray
  {
    GetJointOrder()
  }

  // MARK: - Compute Transforms

  /// Compute joint transforms in joint-local space.
  /// - Parameters:
  ///   - xforms: Output array for transforms.
  ///   - time: The time at which to evaluate.
  ///   - atRest: If true, ignore animation and use rest pose.
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeJointLocalTransforms(_ xforms: inout VtMatrix4dArray,
                                   time: Usd.TimeCode = Usd.TimeCode.Default(),
                                   atRest: Bool = false) -> Bool
  {
    Pixar.UsdSkel_Swift_SkeletonQueryComputeJointLocalTransforms4d(self, &xforms, time, atRest)
  }

  /// Compute joint transforms in skeleton space.
  /// - Parameters:
  ///   - xforms: Output array for transforms.
  ///   - time: The time at which to evaluate.
  ///   - atRest: If true, ignore animation and use rest pose.
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeJointSkelTransforms(_ xforms: inout VtMatrix4dArray,
                                  time: Usd.TimeCode = Usd.TimeCode.Default(),
                                  atRest: Bool = false) -> Bool
  {
    Pixar.UsdSkel_Swift_SkeletonQueryComputeJointSkelTransforms4d(self, &xforms, time, atRest)
  }

  /// Compute skinning transforms: inverse(bindTransform) * jointTransform.
  /// These are the transforms typically used for skinning.
  /// - Parameters:
  ///   - xforms: Output array for transforms.
  ///   - time: The time at which to evaluate.
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeSkinningTransforms(_ xforms: inout VtMatrix4dArray,
                                 time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    Pixar.UsdSkel_Swift_SkeletonQueryComputeSkinningTransforms4d(self, &xforms, time)
  }

  /// Compute joint rest-relative transforms.
  /// - Parameters:
  ///   - xforms: Output array for transforms.
  ///   - time: The time at which to evaluate.
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeJointRestRelativeTransforms(_ xforms: inout VtMatrix4dArray,
                                          time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    Pixar.UsdSkel_Swift_SkeletonQueryComputeJointRestRelativeTransforms4d(self, &xforms, time)
  }

  /// Get joint world bind transforms.
  /// - Parameter xforms: Output array for transforms.
  /// - Returns: true if transforms were retrieved successfully.
  @discardableResult
  func getJointWorldBindTransforms(_ xforms: inout VtMatrix4dArray) -> Bool
  {
    Pixar.UsdSkel_Swift_SkeletonQueryGetJointWorldBindTransforms4d(self, &xforms)
  }

  // MARK: - Description

  /// Get a description string for debugging.
  func getDescription() -> String
  {
    String(GetDescription())
  }
}
