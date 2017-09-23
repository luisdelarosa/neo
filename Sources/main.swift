import SwiftyGPIO
import WS281x
import Foundation

let pwms = SwiftyGPIO.hardwarePWMs(for:.RaspberryPi3)!
let pwm = (pwms[0]?[.P18])!

let numberOfLeds = 64
let matrixWidth = 8
let w = WS281x(pwm, type: .WS2812B, numElements: numberOfLeds)

var initial = [UInt32](repeating:0x0, count: numberOfLeds)

print("clearing")
w.setLeds(initial)

w.start()
w.wait()

for i in 0...(numberOfLeds - 1) {
	print("setting led \(i)")
	w.setLed(i, r: 0x10, g: 0x00, b: 0x10)
	w.start()
	usleep(50_000)
}
sleep(2)

print("setting LEDs as lines")
// Set each line
for i in 0..<matrixWidth {
	for j in 0..<matrixWidth {
		w.setLedAsSequentialMatrix(x: i, y: j, width: matrixWidth, r: 0, g: 0x10, b: 0)
	}
	w.start()
	let line = UInt32(i) + 1
	usleep(line * 50_000)
}

// Clear
w.setLeds(initial)
w.start()
w.wait()

print("cleaning up")
w.cleanup()
