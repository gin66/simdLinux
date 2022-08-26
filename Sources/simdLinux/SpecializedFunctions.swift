import Foundation

public func simd_cross<T: FloatingPoint>(_ left: SIMD3<T>, _ right: SIMD3<T>) -> SIMD3<T> {
    let x = left.y*right.z - left.z*right.y
    let y = left.z*right.x - left.x*right.z
    let z = left.x*right.y - left.y*right.x
    let res = SIMD3<T>(x, y, z)
    return res
}

public func simd_act<T>(_ quat: QUAT4<T>, _ vector: SIMD3<T>) -> SIMD3<T> {
    // https://en..m.wijipedia.org/wiki/Euler-Rodrigues_formula
    // alternative: https://gamedev.stackexchange.com/questions/28395/rotating-vector3-by-a-quaternion
    let w = SIMD3<T>(quat.ix, quat.iy, quat.iz)
    let w_x = simd_cross(w, vector)
    let w_w_x = simd_cross(w, w_x)
    let res = vector + 2*quat.r*w_x + 2*w_w_x
    return res
}

public func simd_quaternion<T: Numeric>(_ ang: Double, _ vector: SIMD3<T>) -> QUAT4<T> {
    let n = simd_normalize(vector)
    let c = cos(ang/2) as! T
    let s = sin(ang/2) as! T
    let ix = n.x*s
    let iy = n.y*s
    let iz = n.z*s
    return QUAT4(ix, iy, iz, c)
}

public func simd_mul<T>(_ left: QUAT4<T>, _ right: QUAT4<T>) -> QUAT4<T> {
    // Hamilton product https://en.wikipedia.org/wiki/Quaternion
    let a1 = left.r
    let a2 = right.r
    let b1 = left.ix
    let b2 = right.ix
    let c1 = left.iy
    let c2 = right.iy
    let d1 = left.iz
    let d2 = right.iz
    let r = a1*a2 - b1*b2 - c1*c2 - d1*d2
    let ix = a1*b2 + b1*a2 + c1*d2 - d1*c2
    let iy = a1*c2 - b1*d2 + c1*a2 + d1*b2
    let iz = a1*d2 + b1*c2 - c1*b2 + d1*a2
    let res = QUAT4(ix, iy, iz, r)
    return res
}
