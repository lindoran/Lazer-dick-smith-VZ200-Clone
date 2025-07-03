// Z80 system reset controller using ATtiny RESET pin as trigger
// - Uses external pull-up on Z80 /RESET for noise resilience
// - ATtiny pin is OUTPUT LOW to assert reset, INPUT (high-Z) to release

#define RESET_PIN  0   // Physical pin 5 on ATtiny85 (Z80 /RESET output)

void setup() {
  // Assert Z80 /RESET (drive low)
  DDRB |= (1 << RESET_PIN);      // Set as output
  PORTB &= ~(1 << RESET_PIN);    // Output LOW

  delay(100);                    // Hold for 100ms

  // Release Z80 /RESET (high-Z, external pull-up pulls high)
  DDRB &= ~(1 << RESET_PIN);     // Set as input (high-Z)
  // No need to set PORTB, leave as is
}

void loop() {
  // Nothing needed; all action is in setup()
}
