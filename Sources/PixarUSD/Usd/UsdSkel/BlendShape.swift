/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.BlendShape
{
  // MARK: - Factory Methods (Static)

  /// Define a BlendShape prim at the given path on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.BlendShape
  {
    UsdSkel.BlendShape.Define(stage.pointee.getPtr(), path)
  }

  /// Define a BlendShape prim at the given path string on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.BlendShape
  {
    UsdSkel.BlendShape.define(stage, path: .init(path))
  }

  /// Get a BlendShape schema object for an existing prim at the given path.
  static func get(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.BlendShape
  {
    UsdSkel.BlendShape.Get(stage.pointee.getPtr(), path)
  }

  /// Get a BlendShape schema object for an existing prim at the given path string.
  static func get(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.BlendShape
  {
    UsdSkel.BlendShape.get(stage, path: .init(path))
  }

  // MARK: - Offsets Attribute

  /// Get the offsets attribute (position offsets from base pose).
  func getOffsetsAttr() -> Usd.Attribute
  {
    GetOffsetsAttr()
  }

  /// Create the offsets attribute with an optional default value.
  @discardableResult
  func createOffsetsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateOffsetsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Normal Offsets Attribute

  /// Get the normal offsets attribute.
  func getNormalOffsetsAttr() -> Usd.Attribute
  {
    GetNormalOffsetsAttr()
  }

  /// Create the normal offsets attribute with an optional default value.
  @discardableResult
  func createNormalOffsetsAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreateNormalOffsetsAttr(defaultValue, writeSparsely)
  }

  // MARK: - Point Indices Attribute

  /// Get the point indices attribute.
  func getPointIndicesAttr() -> Usd.Attribute
  {
    GetPointIndicesAttr()
  }

  /// Create the point indices attribute with an optional default value.
  @discardableResult
  func createPointIndicesAttr(_ defaultValue: Vt.Value = Vt.Value(), writeSparsely: Bool = false) -> Usd.Attribute
  {
    CreatePointIndicesAttr(defaultValue, writeSparsely)
  }

  // MARK: - Inbetween Shapes

  /// Create an inbetween shape with the given name.
  /// - Parameter name: The name of the inbetween shape.
  /// - Returns: The created inbetween shape.
  @discardableResult
  func createInbetween(_ name: Tf.Token) -> UsdSkel.InbetweenShape
  {
    CreateInbetween(name)
  }

  /// Create an inbetween shape with the given name string.
  /// - Parameter name: The name of the inbetween shape.
  /// - Returns: The created inbetween shape.
  @discardableResult
  func createInbetween(_ name: String) -> UsdSkel.InbetweenShape
  {
    CreateInbetween(Tf.Token(name))
  }

  /// Get an inbetween shape by name.
  /// - Parameter name: The name of the inbetween shape.
  /// - Returns: The inbetween shape if it exists.
  func getInbetween(_ name: Tf.Token) -> UsdSkel.InbetweenShape
  {
    GetInbetween(name)
  }

  /// Get an inbetween shape by name string.
  /// - Parameter name: The name of the inbetween shape.
  /// - Returns: The inbetween shape if it exists.
  func getInbetween(_ name: String) -> UsdSkel.InbetweenShape
  {
    GetInbetween(Tf.Token(name))
  }

  /// Check if an inbetween shape exists with the given name.
  /// - Parameter name: The name of the inbetween shape.
  /// - Returns: true if the inbetween shape exists.
  func hasInbetween(_ name: Tf.Token) -> Bool
  {
    HasInbetween(name)
  }

  /// Check if an inbetween shape exists with the given name string.
  /// - Parameter name: The name of the inbetween shape.
  /// - Returns: true if the inbetween shape exists.
  func hasInbetween(_ name: String) -> Bool
  {
    HasInbetween(Tf.Token(name))
  }

  // MARK: - Prim Access

  /// Get the underlying prim.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }
}
