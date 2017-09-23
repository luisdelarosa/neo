# neo
Raspberry Pi 3 application to demonstrate usage of a NeoPixel array that uses the WS2812B protocol.

Note that this needs to be run with sudo due the usage of PWM. See the NOTES for the error you get if you don't use sudo.

I usually run with:
```
swift build && sudo .build/debug/neo
```

One important piece of documentation for using the WS2812x library is that just calling setLED or setLEDAsMatrix or setLEDAsSequentialMatrix is not enough. You need to call start() afterwards to actually make it happen. For some reason that was not clear to me and I got frustated at nothing happening.

Note that was used with this LED matrix from Amazon: https://www.amazon.com/gp/product/B01DC0IMRW
I used a level shifter to convert from 3.3V to 5V and found the best brightness there, but found that sending it the output from GPIO pin 18 at 3.3V worked fine, just seemed to be lower brightness.
I used a capacitor to ease the startup/shutdown of the LED array, as recommended by Adafruit's Neopixel Uberguide.

TODO create a fritzing diagram
