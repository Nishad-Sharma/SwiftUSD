/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.Animation
{
  // MARK: - Factory Methods (Static)

  /// Define a SkelAnimation prim at the given path on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.Animation
  {
    UsdSkel.Animation.Define(stage.pointee.getPtr(), path)
  }

  /// Define a SkelAnimation prim at the given path string on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.Animation
  {
    UsdSkel.Animation.define(stage, path: .init(path))
  }

  /// Get a SkelAnimation schema object for an existing prim at the given path.
  static func get(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.Animation
  {
    UsdSkel.Animation.Get(stage.pointee.getPtr(), path)
  }

  /// Get a SkelAnimation schema object for an existing prim at the given path string.
  static func get(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.Animation
  {
    UsdSkel.Animation.get(stage, path: .init(path))
  }

  // MARK: - Attribute Accessors

  /// Get the joints attribute (token array identifying which joints this animation affects).
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

  /// Get the translations attribute (float3 array of joint-local translations).
  func getTranslationsAttr() -> Usd.Attribute
  {
    GetTranslationsAttr()
  }

  /// Create the translations attribute with an optional default value.
  @discardableResult
  func createTranslationsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateTranslationsAttr(defaultValue, writeSparsely)
  }

  /// Get the rotations attribute (quatf array of joint-local rotations).
  func getRotationsAttr() -> Usd.Attribute
  {
    GetRotationsAttr()
  }

  /// Create the rotations attribute with an optional default value.
  @discardableResult
  func createRotationsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateRotationsAttr(defaultValue, writeSparsely)
  }

  /// Get the scales attribute (half3 array of joint-local scales).
  func getScalesAttr() -> Usd.Attribute
  {
    GetScalesAttr()
  }

  /// Create the scales attribute with an optional default value.
  @discardableResult
  func createScalesAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateScalesAttr(defaultValue, writeSparsely)
  }

  /// Get the blend shapes attribute (token array identifying blend shapes).
  func getBlendShapesAttr() -> Usd.Attribute
  {
    GetBlendShapesAttr()
  }

  /// Create the blend shapes attribute with an optional default value.
  @discardableResult
  func createBlendShapesAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateBlendShapesAttr(defaultValue, writeSparsely)
  }

  /// Get the blend shape weights attribute (float array of weights).
  func getBlendShapeWeightsAttr() -> Usd.Attribute
  {
    GetBlendShapeWeightsAttr()
  }

  /// Create the blend shape weights attribute with an optional default value.
  @discardableResult
  func createBlendShapeWeightsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateBlendShapeWeightsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Transform Convenience Methods

  /// Get resolved joint transforms at the specified time.
  /// - Parameters:
  ///   - xforms: Output array to receive the transforms
  ///   - time: The time at which to evaluate (default is UsdTimeCode.Default())
  /// - Returns: true if transforms were successfully computed
  /// - Note: For efficiency, prefer using UsdSkelAnimQuery instead.
  @discardableResult
  func getTransforms(_ xforms: inout VtMatrix4dArray, time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    GetTransforms(&xforms, time)
  }

  /// Set joint transforms from an array of matrices.
  /// - Parameters:
  ///   - xforms: Array of orthogonal transform matrices
  ///   - time: The time at which to author (default is UsdTimeCode.Default())
  /// - Returns: true if transforms were successfully set
  /// - Note: The given transforms must be orthogonal.
  @discardableResult
  func setTransforms(_ xforms: VtMatrix4dArray, time: Usd.TimeCode = Usd.TimeCode.Default()) -> Bool
  {
    SetTransforms(xforms, time)
  }

  // MARK: - Prim Access

  /// Get the underlying prim.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }
}
