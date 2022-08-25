import Foundation

public typealias simd_quatf = QUAT4<Float>
public typealias simd_quatd = QUAT4<Double>

public extension simd_quatf {
    static let zero = simd_quatf(0, 0, 0, 0)
    static let one = simd_quatf(1, 1, 1, 1)
}

public extension simd_quatd {
    static let zero = simd_quatd(0, 0, 0, 0)
    static let one = simd_quatd(1, 1, 1, 1)
}

public struct QUAT4<T>: Codable, Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Codable, T: Hashable, T: Comparable, T: FloatingPoint {
    public typealias Scalar = T

    var vector: SIMDn<T>

    public var components: [Scalar] {
        get { return vector.vector }
        set(newVector) { vector.vector = newVector }
    }

    var ix: T {
        get { return vector.vector[0] }
        set(newX) { vector.vector[0] = newX }
    }

    var iy: T {
        get { return vector.vector[1] }
        set(newY) { vector.vector[1] = newY }
    }

    var iz: T {
        get { return vector.vector[2] }
        set(newZ) { vector.vector[2] = newZ }
    }

    var r: T {
        get { return vector.vector[3] }
        set(newR) { vector.vector[3] = newR }
    }

    public init(_ x: T, _ y: T, _ z: T, _ w: T) {
        vector = SIMDn([x, y, z, w])
    }

    public init(x: T, y: T, z: T, w: T) {
        vector = SIMDn([x, y, z, w])
    }

    init(intVec: SIMDn<T>) {
        vector = intVec
    }

    public init(_ vector: [T]) {
        self.vector = SIMDn(vector)
    }
}

extension QUAT4: Equatable where T: FloatingPoint {
    public init(from decoder: Decoder) throws {
        let a = try Array<T>.init(from: decoder)
        vector = SIMDn(a)
    }

    public func encode(to encoder: Encoder) throws {
        try vector.vector.encode(to: encoder)
    }

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
        return vector.dot(other.vector)
    }

    func distance(other: Self) -> T {
        return vector.distance(other.vector)
    }

    func min(_ other: Self) -> Self {
        return Self(intVec: vector.min(other.vector))
    }

    func max(_ other: Self) -> Self {
        return Self(intVec: vector.max(other.vector))
    }

    func length() -> T {
        return vector.simd_length()
    }

    func normalize() -> Self {
        return Self(intVec: vector.normalize())
    }

    func abs() -> Self {
        return Self(intVec: vector.abs())
    }
}
