/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.Skeleton
{
  // MARK: - Factory Methods (Static)

  /// Define a Skeleton prim at the given path on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.Skeleton
  {
    UsdSkel.Skeleton.Define(stage.pointee.getPtr(), path)
  }

  /// Define a Skeleton prim at the given path string on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.Skeleton
  {
    UsdSkel.Skeleton.define(stage, path: .init(path))
  }

  /// Get a Skeleton schema object for an existing prim at the given path.
  static func get(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.Skeleton
  {
    UsdSkel.Skeleton.Get(stage.pointee.getPtr(), path)
  }

  /// Get a Skeleton schema object for an existing prim at the given path string.
  static func get(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.Skeleton
  {
    UsdSkel.Skeleton.get(stage, path: .init(path))
  }

  // MARK: - Joints Attribute

  /// Get the joints attribute (token array of joint paths).
  /// Each token must be valid when parsed as an SdfPath.
  func getJointsAttr() -> Usd.Attribute
  {
    GetJointsAttr()
  }

  /// Create the joints attribute with an optional default value.
  @discardableResult
  func createJointsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateJointsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Joint Names Attribute

  /// Get the joint names attribute (optional unique names per joint for DCC interop).
  func getJointNamesAttr() -> Usd.Attribute
  {
    GetJointNamesAttr()
  }

  /// Create the joint names attribute with an optional default value.
  @discardableResult
  func createJointNamesAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateJointNamesAttr(defaultValue, writeSparsely)
  }

  // MARK: - Bind Transforms Attribute

  /// Get the bind transforms attribute (world-space transforms at bind time).
  func getBindTransformsAttr() -> Usd.Attribute
  {
    GetBindTransformsAttr()
  }

  /// Create the bind transforms attribute with an optional default value.
  @discardableResult
  func createBindTransformsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateBindTransformsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Rest Transforms Attribute

  /// Get the rest transforms attribute (local-space rest pose transforms).
  func getRestTransformsAttr() -> Usd.Attribute
  {
    GetRestTransformsAttr()
  }

  /// Create the rest transforms attribute with an optional default value.
  @discardableResult
  func createRestTransformsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateRestTransformsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Prim Access

  /// Get the underlying prim.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }
}
