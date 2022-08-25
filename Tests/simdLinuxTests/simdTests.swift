import XCTest

#if os(macOS) || os(iOS)
//import simd
#endif
import simdLinux


final class simdTests: XCTestCase {
    func test_cross_01() {
        let x1 = simd_double3(1,0,0)
        let x2 = simd_double3(0,1,0)
        let sol = simd_double3(0,0,1)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_02() {
        let x1 = simd_double3(1,0,0)
        let x2 = simd_double3(1,0,0)
        let sol = simd_double3(0,0,0)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_03() {
        let x1 = simd_double3(0,1,0)
        let x2 = simd_double3(1,0,0)
        let sol = simd_double3(0,0,-1)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_04() {
        let x1 = simd_double3(1,0,0)
        let x2 = simd_double3(0,0,1)
        let sol = simd_double3(0,-1,0)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    func test_cross_05() {
        let x1 = simd_double3(0,1,0)
        let x2 = simd_double3(0,0,1)
        let sol = simd_double3(1,0,0)
        let r = simd_cross(x1,x2)

        let d = simd_distance(sol,r)
        XCTAssertLessThan(d, 1e-12)
    }
    @available(iOS 13.4, *)
    func test_recording() throws {
        var cacheUrl = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        cacheUrl.appendPathComponent("recording.json")
        let fh = try FileHandle(forReadingFrom: cacheUrl) 
        print("Start reading")
        let decoder = JSONDecoder()
        let d = try! fh.readToEnd()!
//        if let recording = try? decoder.decode(SimdRecording.self, from: d) {
//            print("Entries:", recording.mul.count, recording.act.count, recording.cross.count)
//
//            for entry in recording.mul {
//                let q1 = simd_quatd(vector: entry.p1)
//                let q2 = simd_quatd(vector: entry.p2)
//                let res = simd_mul(q1, q2)
//                let d = simd_distance(simd_double4(res.vector), entry.res)
//                XCTAssertLessThan(d, 1e-12)
//            }
//
//            for entry in recording.act {
//                let q1 = simd_quatd(vector: entry.p1)
//                let res = simd_act(q1, entry.p2)
//                let d = simd_distance(res, entry.res)
//                XCTAssertLessThan(d, 1e-12)
//            }
//
//            for entry in recording.cross {
//                let res = simd_cross(entry.p1, entry.p2)
//                let d = simd_distance(res, entry.res)
//                XCTAssertLessThan(d, 1e-12)
//            }
//        }
    }
}
