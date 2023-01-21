import time

from periphery import GPIO

led = GPIO("/dev/gpiochip4", 10, "out") # gpio_p18

try:
    while True:
        led.write(True)
        time.sleep(0.5)
        led.write(False)
        time.sleep(0.25)
finally:
    led.write(False)
    led.close()
  