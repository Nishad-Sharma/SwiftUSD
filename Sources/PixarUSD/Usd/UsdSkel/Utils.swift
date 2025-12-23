/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

// MARK: - UsdSkel Utility Functions

/**
 * # UsdSkel Utilities
 *
 * Utility functions for skeletal animation operations.
 *
 * ## Transform Composition
 *
 * The `makeTransforms` function is essential for animation blending workflows:
 *
 * 1. Sample animations using `AnimQuery.computeJointLocalTransformComponents()`
 *    to get separate translation, rotation, and scale arrays
 * 2. Blend components: LERP for translations/scales, SLERP for rotations
 * 3. Recompose into matrices using `makeTransforms()`
 * 4. Apply to skeleton
 *
 * ## Usage
 *
 * ```swift
 * // Sample animation at a time
 * var trans = VtVec3fArray()
 * var rots = VtQuatfArray()
 * var scales = VtVec3hArray()
 * animQuery.computeJointLocalTransformComponents(&trans, &rots, &scales, time: time)
 *
 * // After blending, recompose
 * if let xforms = UsdSkelUtils.makeTransforms(
 *     translations: blendedTrans,
 *     rotations: blendedRots,
 *     scales: blendedScales
 * ) {
 *     // Apply blended transforms
 * }
 * ```
 */
public enum UsdSkelUtils {

  // MARK: - Transform Composition

  /// Compose transforms from translation/rotation/scale components.
  ///
  /// This is the inverse of `AnimQuery.computeJointLocalTransformComponents()`.
  /// Use this to reconstruct matrices after blending animation components.
  ///
  /// The transform order is: Scale → Rotate → Translate (SRT).
  ///
  /// - Parameters:
  ///   - translations: Array of translation vectors (Vec3f)
  ///   - rotations: Array of rotation quaternions (Quatf)
  ///   - scales: Array of scale vectors (Vec3h)
  /// - Returns: Array of composed transforms (Matrix4d), or nil if composition failed
  ///
  /// - Note: All input arrays must have the same length.
  public static func makeTransforms(
    translations: VtVec3fArray,
    rotations: VtQuatfArray,
    scales: VtVec3hArray
  ) -> VtMatrix4dArray? {
    var xforms = VtMatrix4dArray()
    guard Pixar.UsdSkel_Swift_MakeTransforms(
      translations, rotations, scales, &xforms
    ) else {
      return nil
    }
    return xforms
  }

  /// Compose transforms from translation/rotation/scale components (in-place version).
  ///
  /// This variant writes to an existing output array for better performance
  /// in tight loops where avoiding allocations is important.
  ///
  /// - Parameters:
  ///   - translations: Array of translation vectors (Vec3f)
  ///   - rotations: Array of rotation quaternions (Quatf)
  ///   - scales: Array of scale vectors (Vec3h)
  ///   - xforms: Output array for composed transforms (Matrix4d)
  /// - Returns: true if composition succeeded
  @discardableResult
  public static func makeTransforms(
    translations: VtVec3fArray,
    rotations: VtQuatfArray,
    scales: VtVec3hArray,
    into xforms: inout VtMatrix4dArray
  ) -> Bool {
    Pixar.UsdSkel_Swift_MakeTransforms(
      translations, rotations, scales, &xforms
    )
  }
}

// MARK: - UsdSkel Namespace Extension

public extension UsdSkel {
  /// Utility functions for skeletal animation operations.
  typealias Utils = UsdSkelUtils
}
