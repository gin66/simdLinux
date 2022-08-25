import Foundation

public typealias simd_float2 = SIMD2<Float>
public typealias simd_double2 = SIMD2<Double>

extension simd_float2 {
    public static let zero = simd_float2(0, 0)
    public static let one = simd_float2(1, 1)
}
extension simd_double2 {
    public static let zero = simd_double2(0, 0)
    public static let one = simd_double2(1, 1)
}

public struct SIMD2<T>:  Codable, Hashable, SIMD where T: AdditiveArithmetic, T: Numeric, T: Codable, T: Hashable, T: Comparable, T: FloatingPoint {
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

    public init(_ x: T, _ y: T) {
        vector = SIMDn([x, y])
    }

    public init(x: T, y: T) {
        vector = SIMDn([x, y])
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

extension SIMD2: Equatable where T: FloatingPoint {
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
