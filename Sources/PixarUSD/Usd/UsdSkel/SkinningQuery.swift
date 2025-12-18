/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import Gf
import UsdSkel
import UsdGeom

public extension UsdSkel.SkinningQuery
{
  // MARK: - Validity

  /// Return true if this query is valid.
  var isValid: Bool
  {
    Pixar.UsdSkel_Swift_SkinningQueryIsValid(self)
  }

  // MARK: - Prim Access

  /// Get the prim this query is associated with.
  func getPrim() -> Usd.Prim
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetPrim(self)
  }

  // MARK: - Feature Availability

  /// Returns true if there are blend shapes associated with this prim.
  func hasBlendShapes() -> Bool
  {
    HasBlendShapes()
  }

  /// Returns true if joint influence data is associated with this prim.
  func hasJointInfluences() -> Bool
  {
    HasJointInfluences()
  }

  // MARK: - Influence Information

  /// Returns the number of influences encoded for each component.
  func getNumInfluencesPerComponent() -> Int32
  {
    Int32(Pixar.UsdSkel_Swift_SkinningQueryGetNumInfluencesPerComponent(self))
  }

  /// Returns true if the prim has rigid deformation (same influences for all points).
  func isRigidlyDeformed() -> Bool
  {
    IsRigidlyDeformed()
  }

  /// Returns the interpolation mode for joint influences.
  func getInterpolation() -> Tf.Token
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetInterpolation(self)
  }

  // MARK: - Attribute Access

  /// Get the skinning method attribute.
  func getSkinningMethodAttr() -> Usd.Attribute
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetSkinningMethodAttr(self)
  }

  /// Get the geometry bind transform attribute.
  func getGeomBindTransformAttr() -> Usd.Attribute
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetGeomBindTransformAttr(self)
  }

  /// Get the joint indices primvar.
  func getJointIndicesPrimvar() -> UsdGeomPrimvar
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetJointIndicesPrimvar(self)
  }

  /// Get the joint weights primvar.
  func getJointWeightsPrimvar() -> UsdGeomPrimvar
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetJointWeightsPrimvar(self)
  }

  /// Get the blend shapes attribute.
  func getBlendShapesAttr() -> Usd.Attribute
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetBlendShapesAttr(self)
  }

  /// Get the blend shape targets relationship.
  func getBlendShapeTargetsRel() -> Pixar.UsdRelationship
  {
    Pixar.UsdSkel_Swift_SkinningQueryGetBlendShapeTargetsRel(self)
  }

  // MARK: - Joint/Blend Shape Order

  /// Get the custom joint order for this skinning site, if any.
  @discardableResult
  func getJointOrder(_ jointOrder: inout VtTokenArray) -> Bool
  {
    GetJointOrder(&jointOrder)
  }

  /// Get the blend shapes for this skinning site, if any.
  @discardableResult
  func getBlendShapeOrder(_ blendShapes: inout VtTokenArray) -> Bool
  {
    GetBlendShapeOrder(&blendShapes)
  }

  // MARK: - Joint Influence Computation

  /// Compute joint influences at the given time.
  /// - Parameters:
  ///   - indices: Output array for joint indices.
  ///   - weights: Output array for joint weights.
  ///   - time: The time at which to evaluate.
  /// - Returns: true if influences were successfully computed.
  @discardableResult
  func computeJointInfluences(_ indices: inout VtIntArray,
                              _ weights: inout VtFloatArray,
                              time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    ComputeJointInfluences(&indices, &weights, time)
  }

  /// Compute joint influences expanded to per-point values.
  /// - Parameters:
  ///   - numPoints: Number of points in the geometry.
  ///   - indices: Output array for joint indices.
  ///   - weights: Output array for joint weights.
  ///   - time: The time at which to evaluate.
  /// - Returns: true if influences were successfully computed.
  @discardableResult
  func computeVaryingJointInfluences(numPoints: Int,
                                     _ indices: inout VtIntArray,
                                     _ weights: inout VtFloatArray,
                                     time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    ComputeVaryingJointInfluences(numPoints, &indices, &weights, time)
  }

  // MARK: - Skinning Properties

  /// Get the skinning method token.
  func getSkinningMethod() -> Tf.Token
  {
    GetSkinningMethod()
  }

  /// Get the geometry bind transform at the given time.
  func getGeomBindTransform(time: Usd.TimeCode = Usd.TimeCode.Default()) -> GfMatrix4d
  {
    GetGeomBindTransform(time)
  }

  // MARK: - Description

  /// Get a description string for debugging.
  func getDescription() -> String
  {
    String(GetDescription())
  }
}
