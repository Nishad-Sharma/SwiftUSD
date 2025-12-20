/* ----------------------------------------------------------------
 *  A T H E M
 * ----------------------------------------------------------------
 *  Copyright (C) 2016 Pixar.
 *  Copyright (C) 2025 Afloat Technologies. All Rights Reserved.
 *  Licensed under https://openusd.org/license
 * ---------------------------------------------------------------- */

import CxxStdlib
import Sdf
import Usd

/// UsdClipsAPI is an API schema that provides an interface to a prim's clip metadata.
/// Clips are a "value resolution" feature that allows specifying a sequence of USD files
/// to be consulted over time as a source of varying overrides for prims.
public typealias UsdClipsAPI = Pixar.UsdClipsAPI

/// Reference pointer to an SdfLayer
public typealias SdfLayerRefPtr = Pixar.SdfLayerRefPtr

public extension Usd {
    /// API schema for USD Value Clips - allows referencing animation from external USD files.
    typealias ClipsAPI = UsdClipsAPI
}

public extension Sdf {
    /// Reference pointer to an SdfLayer
    typealias LayerRefPtr = SdfLayerRefPtr
}

// MARK: - Clip Activation Entry

/// Represents a clip activation entry mapping stage time to a clip index.
public struct UsdClipActive: Sendable {
    /// The time on the stage when this clip becomes active
    public var stageTime: Double
    /// The index of the clip in the clipAssetPaths array
    public var clipIndex: Int

    public init(stageTime: Double, clipIndex: Int) {
        self.stageTime = stageTime
        self.clipIndex = clipIndex
    }
}

// MARK: - Clip Time Mapping Entry

/// Represents a time mapping entry between stage time and clip time.
public struct UsdClipTime: Sendable {
    /// The time on the stage
    public var stageTime: Double
    /// The corresponding time within the active clip
    public var clipTime: Double

    public init(stageTime: Double, clipTime: Double) {
        self.stageTime = stageTime
        self.clipTime = clipTime
    }
}

// MARK: - ClipsAPI Extension

public extension Usd.ClipsAPI {

    // MARK: - Initialization

    /// Create a ClipsAPI for the given prim.
    /// - Parameter prim: The prim to attach clip metadata to
    init(_ prim: Usd.Prim) {
        self = Pixar.UsdClipsAPI(prim)
    }

    // MARK: - Clip Prim Path

    /// Get the prim path within clips from which time samples are read.
    /// - Returns: The prim path string, or nil if not set
    func getClipPrimPath() -> String? {
        var primPath = std.string()
        guard GetClipPrimPath(&primPath) else { return nil }
        return String(primPath)
    }

    /// Get the prim path within clips for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The prim path string, or nil if not set
    func getClipPrimPath(clipSet: String) -> String? {
        var primPath = std.string()
        guard GetClipPrimPath(&primPath, std.string(clipSet)) else { return nil }
        return String(primPath)
    }

    /// Set the prim path within clips from which to read time samples.
    /// - Parameter path: The prim path (e.g., "/Model")
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipPrimPath(_ path: String) -> Bool {
        SetClipPrimPath(std.string(path))
    }

    /// Set the prim path within clips for a named clip set.
    /// - Parameters:
    ///   - path: The prim path
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipPrimPath(_ path: String, clipSet: String) -> Bool {
        SetClipPrimPath(std.string(path), std.string(clipSet))
    }

    // MARK: - Clip Active Times

    /// Get the clip activation times for the default clip set.
    /// Each entry specifies when a clip (by index) becomes active.
    /// - Returns: Array of activation entries, or nil if not set
    func getClipActive() -> [UsdClipActive]? {
        var active = Pixar.VtVec2dArray()
        guard GetClipActive(&active) else { return nil }
        var result: [UsdClipActive] = []
        for i in 0..<active.size() {
            let vec = active[Int(i)]
            result.append(UsdClipActive(stageTime: vec[0], clipIndex: Int(vec[1])))
        }
        return result
    }

    /// Get the clip activation times for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: Array of activation entries, or nil if not set
    func getClipActive(clipSet: String) -> [UsdClipActive]? {
        var active = Pixar.VtVec2dArray()
        guard GetClipActive(&active, std.string(clipSet)) else { return nil }
        var result: [UsdClipActive] = []
        for i in 0..<active.size() {
            let vec = active[Int(i)]
            result.append(UsdClipActive(stageTime: vec[0], clipIndex: Int(vec[1])))
        }
        return result
    }

    /// Set the clip activation times for the default clip set.
    /// - Parameter active: Array of (stageTime, clipIndex) entries
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipActive(_ active: [UsdClipActive]) -> Bool {
        var vtActive = Pixar.VtVec2dArray()
        for entry in active {
            vtActive.push_back(Pixar.GfVec2d(entry.stageTime, Double(entry.clipIndex)))
        }
        return SetClipActive(vtActive)
    }

    /// Set the clip activation times for a named clip set.
    /// - Parameters:
    ///   - active: Array of (stageTime, clipIndex) entries
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipActive(_ active: [UsdClipActive], clipSet: String) -> Bool {
        var vtActive = Pixar.VtVec2dArray()
        for entry in active {
            vtActive.push_back(Pixar.GfVec2d(entry.stageTime, Double(entry.clipIndex)))
        }
        return SetClipActive(vtActive, std.string(clipSet))
    }

    // MARK: - Clip Time Mapping

    /// Get the clip time mapping for the default clip set.
    /// Maps stage time to clip time, allowing time dilation and looping.
    /// - Returns: Array of time mapping entries, or nil if not set
    func getClipTimes() -> [UsdClipTime]? {
        var times = Pixar.VtVec2dArray()
        guard GetClipTimes(&times) else { return nil }
        var result: [UsdClipTime] = []
        for i in 0..<times.size() {
            let vec = times[Int(i)]
            result.append(UsdClipTime(stageTime: vec[0], clipTime: vec[1]))
        }
        return result
    }

    /// Get the clip time mapping for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: Array of time mapping entries, or nil if not set
    func getClipTimes(clipSet: String) -> [UsdClipTime]? {
        var times = Pixar.VtVec2dArray()
        guard GetClipTimes(&times, std.string(clipSet)) else { return nil }
        var result: [UsdClipTime] = []
        for i in 0..<times.size() {
            let vec = times[Int(i)]
            result.append(UsdClipTime(stageTime: vec[0], clipTime: vec[1]))
        }
        return result
    }

    /// Set the clip time mapping for the default clip set.
    /// - Parameter times: Array of (stageTime, clipTime) entries
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTimes(_ times: [UsdClipTime]) -> Bool {
        var vtTimes = Pixar.VtVec2dArray()
        for entry in times {
            vtTimes.push_back(Pixar.GfVec2d(entry.stageTime, entry.clipTime))
        }
        return SetClipTimes(vtTimes)
    }

    /// Set the clip time mapping for a named clip set.
    /// - Parameters:
    ///   - times: Array of (stageTime, clipTime) entries
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTimes(_ times: [UsdClipTime], clipSet: String) -> Bool {
        var vtTimes = Pixar.VtVec2dArray()
        for entry in times {
            vtTimes.push_back(Pixar.GfVec2d(entry.stageTime, entry.clipTime))
        }
        return SetClipTimes(vtTimes, std.string(clipSet))
    }

    // MARK: - Template Clips

    /// Get the template asset path pattern (e.g., "anim.###.usd").
    /// The # characters are replaced with frame numbers.
    /// - Returns: The template pattern, or nil if not set
    func getClipTemplateAssetPath() -> String? {
        var path = std.string()
        guard GetClipTemplateAssetPath(&path) else { return nil }
        return String(path)
    }

    /// Get the template asset path pattern for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The template pattern, or nil if not set
    func getClipTemplateAssetPath(clipSet: String) -> String? {
        var path = std.string()
        guard GetClipTemplateAssetPath(&path, std.string(clipSet)) else { return nil }
        return String(path)
    }

    /// Set the template asset path pattern.
    /// Use # for frame number padding (e.g., "anim.###.usd" for 001, 002, etc.)
    /// - Parameter path: The template pattern
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateAssetPath(_ path: String) -> Bool {
        SetClipTemplateAssetPath(std.string(path))
    }

    /// Set the template asset path pattern for a named clip set.
    /// - Parameters:
    ///   - path: The template pattern
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateAssetPath(_ path: String, clipSet: String) -> Bool {
        SetClipTemplateAssetPath(std.string(path), std.string(clipSet))
    }

    /// Get the template stride (frame increment).
    /// - Returns: The stride value, or nil if not set
    func getClipTemplateStride() -> Double? {
        var stride: Double = 0
        guard GetClipTemplateStride(&stride) else { return nil }
        return stride
    }

    /// Get the template stride for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The stride value, or nil if not set
    func getClipTemplateStride(clipSet: String) -> Double? {
        var stride: Double = 0
        guard GetClipTemplateStride(&stride, std.string(clipSet)) else { return nil }
        return stride
    }

    /// Set the template stride (frame increment).
    /// - Parameter stride: The stride value
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateStride(_ stride: Double) -> Bool {
        SetClipTemplateStride(stride)
    }

    /// Set the template stride for a named clip set.
    /// - Parameters:
    ///   - stride: The stride value
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateStride(_ stride: Double, clipSet: String) -> Bool {
        SetClipTemplateStride(stride, std.string(clipSet))
    }

    /// Get the template start time.
    /// - Returns: The start time, or nil if not set
    func getClipTemplateStartTime() -> Double? {
        var time: Double = 0
        guard GetClipTemplateStartTime(&time) else { return nil }
        return time
    }

    /// Get the template start time for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The start time, or nil if not set
    func getClipTemplateStartTime(clipSet: String) -> Double? {
        var time: Double = 0
        guard GetClipTemplateStartTime(&time, std.string(clipSet)) else { return nil }
        return time
    }

    /// Set the template start time.
    /// - Parameter time: The start time
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateStartTime(_ time: Double) -> Bool {
        SetClipTemplateStartTime(time)
    }

    /// Set the template start time for a named clip set.
    /// - Parameters:
    ///   - time: The start time
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateStartTime(_ time: Double, clipSet: String) -> Bool {
        SetClipTemplateStartTime(time, std.string(clipSet))
    }

    /// Get the template end time.
    /// - Returns: The end time, or nil if not set
    func getClipTemplateEndTime() -> Double? {
        var time: Double = 0
        guard GetClipTemplateEndTime(&time) else { return nil }
        return time
    }

    /// Get the template end time for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The end time, or nil if not set
    func getClipTemplateEndTime(clipSet: String) -> Double? {
        var time: Double = 0
        guard GetClipTemplateEndTime(&time, std.string(clipSet)) else { return nil }
        return time
    }

    /// Set the template end time.
    /// - Parameter time: The end time
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateEndTime(_ time: Double) -> Bool {
        SetClipTemplateEndTime(time)
    }

    /// Set the template end time for a named clip set.
    /// - Parameters:
    ///   - time: The end time
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateEndTime(_ time: Double, clipSet: String) -> Bool {
        SetClipTemplateEndTime(time, std.string(clipSet))
    }

    /// Get the template active offset.
    /// - Returns: The offset value, or nil if not set
    func getClipTemplateActiveOffset() -> Double? {
        var offset: Double = 0
        guard GetClipTemplateActiveOffset(&offset) else { return nil }
        return offset
    }

    /// Get the template active offset for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The offset value, or nil if not set
    func getClipTemplateActiveOffset(clipSet: String) -> Double? {
        var offset: Double = 0
        guard GetClipTemplateActiveOffset(&offset, std.string(clipSet)) else { return nil }
        return offset
    }

    /// Set the template active offset.
    /// - Parameter offset: The offset value
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateActiveOffset(_ offset: Double) -> Bool {
        SetClipTemplateActiveOffset(offset)
    }

    /// Set the template active offset for a named clip set.
    /// - Parameters:
    ///   - offset: The offset value
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipTemplateActiveOffset(_ offset: Double, clipSet: String) -> Bool {
        SetClipTemplateActiveOffset(offset, std.string(clipSet))
    }

    // MARK: - Manifest

    /// Get the clip manifest asset path.
    /// The manifest indicates which attributes have time samples in clips.
    /// - Returns: The manifest asset path, or nil if not set
    func getClipManifestAssetPath() -> Sdf.AssetPath? {
        var path = Pixar.SdfAssetPath()
        guard GetClipManifestAssetPath(&path) else { return nil }
        return path
    }

    /// Get the clip manifest asset path for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: The manifest asset path, or nil if not set
    func getClipManifestAssetPath(clipSet: String) -> Sdf.AssetPath? {
        var path = Pixar.SdfAssetPath()
        guard GetClipManifestAssetPath(&path, std.string(clipSet)) else { return nil }
        return path
    }

    /// Set the clip manifest asset path.
    /// - Parameter path: The manifest asset path
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipManifestAssetPath(_ path: Sdf.AssetPath) -> Bool {
        SetClipManifestAssetPath(path)
    }

    /// Set the clip manifest asset path for a named clip set.
    /// - Parameters:
    ///   - path: The manifest asset path
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setClipManifestAssetPath(_ path: Sdf.AssetPath, clipSet: String) -> Bool {
        SetClipManifestAssetPath(path, std.string(clipSet))
    }

    /// Generate a clip manifest from the clips.
    /// - Parameter writeBlocksForMissingValues: If true, writes value blocks for clips missing values
    /// - Returns: An anonymous layer containing the manifest (check validity with the RefPtr)
    func generateClipManifest(writeBlocksForMissingValues: Bool = false) -> Sdf.LayerRefPtr {
        GenerateClipManifest(writeBlocksForMissingValues)
    }

    /// Generate a clip manifest for a named clip set.
    /// - Parameters:
    ///   - clipSet: The name of the clip set
    ///   - writeBlocksForMissingValues: If true, writes value blocks for clips missing values
    /// - Returns: An anonymous layer containing the manifest (check validity with the RefPtr)
    func generateClipManifest(clipSet: String, writeBlocksForMissingValues: Bool = false) -> Sdf.LayerRefPtr {
        GenerateClipManifest(std.string(clipSet), writeBlocksForMissingValues)
    }

    // MARK: - Interpolation

    /// Get whether missing clip values should be interpolated from surrounding clips.
    /// - Returns: true if interpolation is enabled, or nil if not set
    func getInterpolateMissingClipValues() -> Bool? {
        var interpolate = false
        guard GetInterpolateMissingClipValues(&interpolate) else { return nil }
        return interpolate
    }

    /// Get whether missing clip values should be interpolated for a named clip set.
    /// - Parameter clipSet: The name of the clip set
    /// - Returns: true if interpolation is enabled, or nil if not set
    func getInterpolateMissingClipValues(clipSet: String) -> Bool? {
        var interpolate = false
        guard GetInterpolateMissingClipValues(&interpolate, std.string(clipSet)) else { return nil }
        return interpolate
    }

    /// Set whether missing clip values should be interpolated from surrounding clips.
    /// - Parameter interpolate: true to enable interpolation
    /// - Returns: true if successful
    @discardableResult
    mutating func setInterpolateMissingClipValues(_ interpolate: Bool) -> Bool {
        SetInterpolateMissingClipValues(interpolate)
    }

    /// Set whether missing clip values should be interpolated for a named clip set.
    /// - Parameters:
    ///   - interpolate: true to enable interpolation
    ///   - clipSet: The name of the clip set
    /// - Returns: true if successful
    @discardableResult
    mutating func setInterpolateMissingClipValues(_ interpolate: Bool, clipSet: String) -> Bool {
        SetInterpolateMissingClipValues(interpolate, std.string(clipSet))
    }
}

// MARK: - Clip Asset Paths

public extension Usd.ClipsAPI
{
  /// Get the clip asset paths for the default clip set.
  /// - Returns: Array of asset paths as strings, or nil if not set
  func getClipAssetPaths() -> [String]?
  {
    var paths = Sdf.AssetPathArray()
    guard GetClipAssetPaths(&paths) else { return nil }
    return paths.toStringArray()
  }

  /// Get the clip asset paths for the default clip set as SdfAssetPath values.
  /// - Returns: Array of SdfAssetPath values, or nil if not set
  func getClipAssetPathsAsAssetPaths() -> [Sdf.AssetPath]?
  {
    var paths = Sdf.AssetPathArray()
    guard GetClipAssetPaths(&paths) else { return nil }
    return paths.toArray()
  }

  /// Get the clip asset paths for a named clip set.
  /// - Parameter clipSet: The name of the clip set
  /// - Returns: Array of asset paths as strings, or nil if not set
  func getClipAssetPaths(clipSet: String) -> [String]?
  {
    var paths = Sdf.AssetPathArray()
    guard GetClipAssetPaths(&paths, std.string(clipSet)) else { return nil }
    return paths.toStringArray()
  }

  /// Get the clip asset paths for a named clip set as SdfAssetPath values.
  /// - Parameter clipSet: The name of the clip set
  /// - Returns: Array of SdfAssetPath values, or nil if not set
  func getClipAssetPathsAsAssetPaths(clipSet: String) -> [Sdf.AssetPath]?
  {
    var paths = Sdf.AssetPathArray()
    guard GetClipAssetPaths(&paths, std.string(clipSet)) else { return nil }
    return paths.toArray()
  }

  /// Set the clip asset paths for the default clip set.
  /// - Parameter paths: Array of path strings
  /// - Returns: true if successful
  @discardableResult
  mutating func setClipAssetPaths(_ paths: [String]) -> Bool
  {
    let vtPaths = Sdf.AssetPathArray(paths)
    return SetClipAssetPaths(vtPaths)
  }

  /// Set the clip asset paths for the default clip set from SdfAssetPath values.
  /// - Parameter paths: Array of SdfAssetPath values
  /// - Returns: true if successful
  @discardableResult
  mutating func setClipAssetPaths(_ paths: [Sdf.AssetPath]) -> Bool
  {
    let vtPaths = Sdf.AssetPathArray(paths)
    return SetClipAssetPaths(vtPaths)
  }

  /// Set the clip asset paths for a named clip set.
  /// - Parameters:
  ///   - paths: Array of path strings
  ///   - clipSet: The name of the clip set
  /// - Returns: true if successful
  @discardableResult
  mutating func setClipAssetPaths(_ paths: [String], clipSet: String) -> Bool
  {
    let vtPaths = Sdf.AssetPathArray(paths)
    return SetClipAssetPaths(vtPaths, std.string(clipSet))
  }

  /// Set the clip asset paths for a named clip set from SdfAssetPath values.
  /// - Parameters:
  ///   - paths: Array of SdfAssetPath values
  ///   - clipSet: The name of the clip set
  /// - Returns: true if successful
  @discardableResult
  mutating func setClipAssetPaths(_ paths: [Sdf.AssetPath], clipSet: String) -> Bool
  {
    let vtPaths = Sdf.AssetPathArray(paths)
    return SetClipAssetPaths(vtPaths, std.string(clipSet))
  }
}
