/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import Foundation
import Sdf

public typealias SdfAssetPath = Pixar.SdfAssetPath

public extension Sdf
{
  typealias AssetPath = SdfAssetPath
}

public extension Sdf.AssetPath
{
  init(_ path: String)
  {
    self.init(std.string(path))
  }
}

// MARK: - SdfAssetPathArray

public typealias SdfAssetPathArray = Pixar.SdfAssetPathArray

public extension Sdf
{
  typealias AssetPathArray = SdfAssetPathArray
}

public extension Sdf.AssetPathArray
{
  /// Create an empty asset path array.
  init()
  {
    self = Pixar.Sdf_Swift_CreateAssetPathArray()
  }

  /// Create an asset path array from Swift strings.
  init(_ paths: [String])
  {
    self = Pixar.Sdf_Swift_CreateAssetPathArray()
    for path in paths
    {
      Pixar.Sdf_Swift_AssetPathArrayPushBack(&self, Sdf.AssetPath(path))
    }
  }

  /// Create an asset path array from SdfAssetPath values.
  init(_ paths: [Sdf.AssetPath])
  {
    self = Pixar.Sdf_Swift_CreateAssetPathArray()
    for path in paths
    {
      Pixar.Sdf_Swift_AssetPathArrayPushBack(&self, path)
    }
  }

  /// The number of elements in the array.
  var count: Int
  {
    Int(Pixar.Sdf_Swift_AssetPathArraySize(self))
  }

  /// Whether the array is empty.
  var isEmpty: Bool
  {
    count == 0
  }

  /// Access an element at the given index.
  subscript(index: Int) -> Sdf.AssetPath
  {
    Pixar.Sdf_Swift_AssetPathArrayGetElement(self, index)
  }

  /// Append an asset path to the array.
  mutating func append(_ path: Sdf.AssetPath)
  {
    Pixar.Sdf_Swift_AssetPathArrayPushBack(&self, path)
  }

  /// Append an asset path from a string to the array.
  mutating func append(_ path: String)
  {
    Pixar.Sdf_Swift_AssetPathArrayPushBack(&self, Sdf.AssetPath(path))
  }

  /// Convert to Swift array of SdfAssetPath values.
  func toArray() -> [Sdf.AssetPath]
  {
    var result: [Sdf.AssetPath] = []
    result.reserveCapacity(count)
    for i in 0..<count
    {
      result.append(self[i])
    }
    return result
  }

  /// Convert to Swift array of path strings.
  func toStringArray() -> [String]
  {
    toArray().map { String(Pixar.Sdf_Swift_GetAssetPathString($0)) }
  }
}
