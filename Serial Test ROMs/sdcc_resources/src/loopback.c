#include "rom.h"

int main(void) {
    unsigned char col = 0;     // column counter
    char prev = 0;             // for CRLF normalization

    putc('\r');  // align to column 0 at start

    while (1) {
        char c = testc();
        if (!c) continue;

        // Normalize Enter: CR or LF triggers a new line
        if ((c == '\r' && prev != '\n') || (c == '\n' && prev != '\r')) {
            putc('\r'); putc('\n');
            col = 0;
        }

        // Backspace or DEL
        else if ((c == 0x08 || c == 0x7F) && col > 0) {
            putc('\b'); putc(' '); putc('\b');
            col--;
        }

        // ESC = exit without echo
        else if (c == 0x1B) {
            break;
        }

        // Visible characters
        else if (c >= 0x20 && c < 0x7F) {
            putc(c);
            col++;

            if (col == 80) {
                putc('\n'); putc('\r');
                col = 0;
            }
        }

        // Control codes (ignore silently)
        // else do nothing

        prev = c;
    }

    entmon();
    return 0;
}
