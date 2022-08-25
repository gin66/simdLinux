import Foundation

public func simd_cross(_ left: simd_double3, _ right: simd_double3) -> simd_double3 {
    let x = left.y*right.z - left.z*right.y
    let y = left.z*right.x - left.x*right.z
    let z = left.x*right.y - left.y*right.x
    let res = simd_double3(x, y, z)
//    if recording.enable {
//        let entry = SimdRecordingCross(p1: left, p2: right, res: res)
//        recording.append(cross: entry)
//    }
    return res
}

public func simd_act(_ quat: simd_quatd, _ vector: simd_double3) -> simd_double3 {
    // https://en..m.wijipedia.org/wiki/Euler-Rodrigues_formula
    // alternative: https://gamedev.stackexchange.com/questions/28395/rotating-vector3-by-a-quaternion
    let w = simd_double3(quat.ix, quat.iy, quat.iz)
    let w_x = simd_cross(w, vector)
    let w_w_x = simd_cross(w, w_x)
    let res = vector + 2*quat.r*w_x + 2*w_w_x
//    if recording.enable {
//        let entry = SimdRecordingAct(p1: quat, p2: vector, res: res)
//        recording.append(act: entry)
//    }
    return res
}
