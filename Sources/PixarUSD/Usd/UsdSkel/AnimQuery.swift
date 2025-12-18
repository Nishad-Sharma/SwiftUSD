/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.AnimQuery
{
  // MARK: - Validity

  /// Return true if this query is valid.
  var isValid: Bool
  {
    IsValid()
  }

  // MARK: - Prim Access

  /// Return the primitive this anim query reads from.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }

  // MARK: - Time Varying Checks

  /// Return true if joint transforms might be time-varying.
  func jointTransformsMightBeTimeVarying() -> Bool
  {
    JointTransformsMightBeTimeVarying()
  }

  /// Return true if blend shape weights might be time-varying.
  func blendShapeWeightsMightBeTimeVarying() -> Bool
  {
    BlendShapeWeightsMightBeTimeVarying()
  }

  // MARK: - Joint/Blend Shape Order

  /// Returns the ordered array of joint tokens in this animation.
  func getJointOrder() -> VtTokenArray
  {
    GetJointOrder()
  }

  /// Returns the ordered array of blend shape tokens in this animation.
  func getBlendShapeOrder() -> VtTokenArray
  {
    GetBlendShapeOrder()
  }

  // MARK: - Compute Methods

  /// Compute joint transforms in joint-local space.
  /// Transforms are returned in the order specified by the joint ordering
  /// of the animation primitive itself.
  /// - Parameters:
  ///   - xforms: Output array for transforms (Matrix4d).
  ///   - time: The time at which to evaluate (default: default time).
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeJointLocalTransforms(_ xforms: inout VtMatrix4dArray,
                                   time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    Pixar.UsdSkel_Swift_AnimQueryComputeJointLocalTransforms4d(self, &xforms, time)
  }

  /// Compute translation, rotation, scale components of joint transforms in joint-local space.
  /// This is provided to facilitate direct streaming of animation data in a form that can
  /// efficiently be processed for animation blending.
  /// - Parameters:
  ///   - translations: Output array for translation components.
  ///   - rotations: Output array for rotation components (quaternions).
  ///   - scales: Output array for scale components (half-precision).
  ///   - time: The time at which to evaluate (default: default time).
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeJointLocalTransformComponents(_ translations: inout VtVec3fArray,
                                            _ rotations: inout VtQuatfArray,
                                            _ scales: inout VtVec3hArray,
                                            time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    ComputeJointLocalTransformComponents(&translations, &rotations, &scales, time)
  }

  /// Compute blend shape weights at the given time.
  /// - Parameters:
  ///   - weights: Output array for blend shape weights.
  ///   - time: The time at which to evaluate (default: default time).
  /// - Returns: true if computation succeeded.
  @discardableResult
  func computeBlendShapeWeights(_ weights: inout VtFloatArray,
                                time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    ComputeBlendShapeWeights(&weights, time)
  }

  // MARK: - Description

  /// Get a description string for debugging.
  func getDescription() -> String
  {
    String(GetDescription())
  }
}
