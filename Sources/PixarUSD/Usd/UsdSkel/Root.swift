/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import UsdSkel

public extension UsdSkel.Root
{
  // MARK: - Factory Methods (Static)

  /// Define a SkelRoot prim at the given path on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.Root
  {
    UsdSkel.Root.Define(stage.pointee.getPtr(), path)
  }

  /// Define a SkelRoot prim at the given path string on the stage.
  @discardableResult
  static func define(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.Root
  {
    UsdSkel.Root.define(stage, path: .init(path))
  }

  /// Get a SkelRoot schema object for an existing prim at the given path.
  static func get(_ stage: Usd.StageRefPtr, path: Sdf.Path) -> UsdSkel.Root
  {
    UsdSkel.Root.Get(stage.pointee.getPtr(), path)
  }

  /// Get a SkelRoot schema object for an existing prim at the given path string.
  static func get(_ stage: Usd.StageRefPtr, path: String) -> UsdSkel.Root
  {
    UsdSkel.Root.get(stage, path: .init(path))
  }

  // MARK: - Find

  /// Find the skel root at or above the given prim.
  /// - Parameter prim: The prim to search from.
  /// - Returns: The SkelRoot if found, or an invalid schema object if none exists.
  static func find(_ prim: Usd.Prim) -> UsdSkel.Root
  {
    UsdSkel.Root.Find(prim)
  }

  // MARK: - Prim Access

  /// Get the underlying prim.
  func getPrim() -> Usd.Prim
  {
    GetPrim()
  }
}
