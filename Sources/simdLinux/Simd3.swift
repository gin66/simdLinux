import Foundation

public typealias simd_float3 = SIMD3<Float>
public typealias simd_double3 = SIMD3<Double>

public extension simd_float3 {
    static let zero = simd_float3(0, 0, 0)
    static let one = simd_float3(1, 1, 1)
}

public extension simd_double3 {
    static let zero = simd_double3(0, 0, 0)
    static let one = simd_double3(1, 1, 1)
}

public struct SIMD3<T>: Codable, Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Codable, T: Hashable, T: Comparable, T: FloatingPoint {
    public typealias Scalar = T

    var vector: SIMDn<T>
    
    public var components: [Scalar] {
        get { return vector.vector }
        set(newVector) { vector.vector = newVector }
    }

    var x: T {
        get { return vector.vector[0] }
        set(newX) { vector.vector[0] = newX }
    }

    var y: T {
        get { return vector.vector[1] }
        set(newY) { vector.vector[1] = newY }
    }

    var z: T {
        get { return vector.vector[2] }
        set(newZ) { vector.vector[2] = newZ }
    }

    public init(_ x: T, _ y: T, _ z: T) {
        vector = SIMDn([x, y, z])
    }

    public init(x: T, y: T, z: T) {
        vector = SIMDn([x, y, z])
    }

    public init(from decoder: Decoder) throws {
        let a = try Array<T>.init(from: decoder)
        vector = SIMDn(a)
    }

    public func encode(to encoder: Encoder) throws {
        try vector.vector.encode(to: encoder)
    }

    init(intVec: SIMDn<T>) {
        self.vector = intVec
    }

    public init(_ vector: [T]) {
        self.vector = SIMDn(vector)
    }
}

extension SIMD3: Equatable where T: FloatingPoint {
    public static func == (left: Self, right: Self) -> Bool {
        return left.vector == right.vector
    }

    static func + (left: Self, right: Self) -> Self {
        return Self(intVec: left.vector + right.vector)
    }

    static func + (left: Self, right: T) -> Self {
        return Self(intVec: left.vector + right)
    }

    static func - (left: Self, right: Self) -> Self {
        return Self(intVec: left.vector - right.vector)
    }

    static func - (left: Self, right: T) -> Self {
        return Self(intVec: left.vector - right)
    }

    static prefix func - (vector: Self) -> Self {
        return Self(intVec: -vector.vector)
    }

    static func * (left: Self, right: Self) -> Self {
        return Self(intVec: left.vector * right.vector)
    }

    static func * (left: Self, right: T) -> Self {
        return Self(intVec: left.vector * right)
    }

    static func * (left: T, right: Self) -> Self {
        return Self(intVec: left * right.vector)
    }

    static func / (left: Self, right: T) -> Self {
        return Self(intVec: left.vector / right)
    }

    static func += (left: inout Self, right: Self) {
        left.vector += right.vector
    }

    static func -= (left: inout Self, right: Self) {
        left.vector -= right.vector
    }

    func dot(other: Self) -> T {
        return self.vector.dot(other.vector)
    }

    func distance(other: Self) -> T {
        return self.vector.distance(other.vector)
    }

    func min(_ other: Self) -> Self {
        return Self(intVec: self.vector.min(other.vector))
    }

    func max(_ other: Self) -> Self {
        return Self(intVec: self.vector.max(other.vector))
    }

    func length() -> T {
        return self.vector.simd_length()
    }

    func normalize() -> Self {
        return Self(intVec: self.vector.normalize())
    }

    func abs() -> Self {
        return Self(intVec: self.vector.abs())
    }
}
