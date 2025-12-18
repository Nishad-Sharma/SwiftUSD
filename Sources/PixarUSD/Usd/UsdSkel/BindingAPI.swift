/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel
import UsdGeom

public extension UsdSkel.BindingAPI
{
  // MARK: - Apply Methods (Static)

  /// Apply the SkelBindingAPI schema to the given prim.
  /// - Parameter prim: The prim to apply the schema to.
  /// - Returns: A valid UsdSkelBindingAPI if successful.
  @discardableResult
  static func apply(_ prim: Usd.Prim) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim)
  }

  /// Check if this API schema can be applied to the given prim.
  static func canApply(_ prim: Usd.Prim) -> Bool
  {
    UsdSkel.BindingAPI.CanApply(prim, nil)
  }

  // MARK: - Convenience Apply Methods for Geometry Types

  @discardableResult
  static func apply(_ prim: UsdGeomMesh) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  @discardableResult
  static func apply(_ prim: UsdGeomSphere) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  @discardableResult
  static func apply(_ prim: UsdGeomCapsule) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  @discardableResult
  static func apply(_ prim: UsdGeomCube) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  @discardableResult
  static func apply(_ prim: UsdGeomCylinder) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  @discardableResult
  static func apply(_ prim: UsdGeomCone) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  @discardableResult
  static func apply(_ prim: UsdGeomPlane) -> UsdSkel.BindingAPI
  {
    UsdSkel.BindingAPI.Apply(prim.GetPrim())
  }

  // MARK: - Skinning Method Attribute

  /// Get the skinning method attribute (classicLinear or dualQuaternion).
  func getSkinningMethodAttr() -> Usd.Attribute
  {
    GetSkinningMethodAttr()
  }

  /// Create the skinning method attribute.
  @discardableResult
  func createSkinningMethodAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateSkinningMethodAttr(defaultValue, writeSparsely)
  }

  /// Set the skinning method using the Swift enum.
  @discardableResult
  func setSkinningMethod(_ method: UsdSkel.SkinningMethod) -> Bool
  {
    createSkinningMethodAttr(Vt.Value(method.token), writeSparsely: false).IsValid()
  }

  // MARK: - Geom Bind Transform Attribute

  /// Get the geometry bind transform attribute (world-space transform at bind time).
  func getGeomBindTransformAttr() -> Usd.Attribute
  {
    GetGeomBindTransformAttr()
  }

  /// Create the geometry bind transform attribute.
  @discardableResult
  func createGeomBindTransformAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateGeomBindTransformAttr(defaultValue, writeSparsely)
  }

  // MARK: - Joints Attribute

  /// Get the joints attribute (optional local joint order override).
  func getJointsAttr() -> Usd.Attribute
  {
    GetJointsAttr()
  }

  /// Create the joints attribute.
  @discardableResult
  func createJointsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateJointsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Joint Indices

  /// Get the joint indices attribute.
  func getJointIndicesAttr() -> Usd.Attribute
  {
    GetJointIndicesAttr()
  }

  /// Create the joint indices attribute.
  @discardableResult
  func createJointIndicesAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateJointIndicesAttr(defaultValue, writeSparsely)
  }

  /// Get the joint indices as a primvar.
  func getJointIndicesPrimvar() -> UsdGeomPrimvar
  {
    GetJointIndicesPrimvar()
  }

  /// Create the joint indices primvar.
  /// - Parameters:
  ///   - constant: If true, uses constant interpolation (rigid deformation).
  ///   - elementSize: Number of joint influences per point (-1 for default).
  @discardableResult
  func createJointIndicesPrimvar(constant: Bool, elementSize: Int32 = -1) -> UsdGeomPrimvar
  {
    CreateJointIndicesPrimvar(constant, elementSize)
  }

  // MARK: - Joint Weights

  /// Get the joint weights attribute.
  func getJointWeightsAttr() -> Usd.Attribute
  {
    GetJointWeightsAttr()
  }

  /// Create the joint weights attribute.
  @discardableResult
  func createJointWeightsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateJointWeightsAttr(defaultValue, writeSparsely)
  }

  /// Get the joint weights as a primvar.
  func getJointWeightsPrimvar() -> UsdGeomPrimvar
  {
    GetJointWeightsPrimvar()
  }

  /// Create the joint weights primvar.
  /// - Parameters:
  ///   - constant: If true, uses constant interpolation (rigid deformation).
  ///   - elementSize: Number of joint influences per point (-1 for default).
  @discardableResult
  func createJointWeightsPrimvar(constant: Bool, elementSize: Int32 = -1) -> UsdGeomPrimvar
  {
    CreateJointWeightsPrimvar(constant, elementSize)
  }

  // MARK: - Blend Shapes Attribute

  /// Get the blend shapes attribute.
  func getBlendShapesAttr() -> Usd.Attribute
  {
    GetBlendShapesAttr()
  }

  /// Create the blend shapes attribute.
  @discardableResult
  func createBlendShapesAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateBlendShapesAttr(defaultValue, writeSparsely)
  }

  // MARK: - Relationships

  /// Get the animation source relationship.
  func getAnimationSourceRel() -> Pixar.UsdRelationship
  {
    GetAnimationSourceRel()
  }

  /// Create the animation source relationship.
  @discardableResult
  func createAnimationSourceRel() -> Pixar.UsdRelationship
  {
    CreateAnimationSourceRel()
  }

  /// Get the skeleton relationship.
  func getSkeletonRel() -> Pixar.UsdRelationship
  {
    GetSkeletonRel()
  }

  /// Create the skeleton relationship.
  @discardableResult
  func createSkeletonRel() -> Pixar.UsdRelationship
  {
    CreateSkeletonRel()
  }

  /// Get the blend shape targets relationship.
  func getBlendShapeTargetsRel() -> Pixar.UsdRelationship
  {
    GetBlendShapeTargetsRel()
  }

  /// Create the blend shape targets relationship.
  @discardableResult
  func createBlendShapeTargetsRel() -> Pixar.UsdRelationship
  {
    CreateBlendShapeTargetsRel()
  }

  // MARK: - Convenience Methods

  /// Set up rigid joint influence (same influence for all points).
  /// - Parameters:
  ///   - jointIndex: Index of the influencing joint.
  ///   - weight: Influence weight (default 1.0 for full influence).
  @discardableResult
  func setRigidJointInfluence(jointIndex: Int32, weight: Float = 1.0) -> Bool
  {
    SetRigidJointInfluence(jointIndex, weight)
  }

  /// Get the skeleton bound on this prim (not inherited).
  /// - Parameter skel: Output parameter to receive the skeleton.
  /// - Returns: true if a skeleton binding is defined.
  @discardableResult
  func getSkeleton(_ skel: inout UsdSkel.Skeleton) -> Bool
  {
    GetSkeleton(&skel)
  }

  /// Get the animation source bound on this prim (not inherited).
  /// - Parameter prim: Output parameter to receive the animation prim.
  /// - Returns: true if an animation source binding is defined.
  @discardableResult
  func getAnimationSource(_ prim: inout Usd.Prim) -> Bool
  {
    GetAnimationSource(&prim)
  }

  /// Get the inherited skeleton (from this prim or an ancestor).
  func getInheritedSkeleton() -> UsdSkel.Skeleton
  {
    GetInheritedSkeleton()
  }

  /// Get the inherited animation source (from this prim or an ancestor).
  func getInheritedAnimationSource() -> Usd.Prim
  {
    GetInheritedAnimationSource()
  }

  // MARK: - Prim Access

  /// Get the underlying prim.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }
}
