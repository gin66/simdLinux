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

    public var vector: [T]
    public let scalarCount = 2

    var x: T {
        get { return vector[0] }
        set(newX) { vector[0] = newX }
    }

    var y: T {
        get { return vector[1] }
        set(newY) { vector[1] = newY }
    }

    public init(_ x: T, _ y: T) {
        vector = [x, y]
    }

    public init(x: T, y: T) {
        vector = [x, y]
    }

    public init(from decoder: Decoder) throws {
        vector = try Array<T>.init(from: decoder)
    }

    public func encode(to encoder: Encoder) throws {
        try vector.encode(to: encoder)
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD2(vector:)")
        }
    }

    public init(_ vector: [T]) {
        self.vector = vector
        if vector.count != scalarCount {
            fatalError("wrong vector length for SIMD2(vector:)")
        }
    }
}
