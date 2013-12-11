local last_beat = 0

function recordBeat(ts) {
    local current_interval = ts - last_beat;
    last_beat = ts;
    agent.send("interval", current_interval)
}

function buttonPressed() {
    local state = button.read();
    if (state == 1) {
        recordBeat(hardware.millis())
    }
}

button <- hardware.pin2;
button.configure(DIGITAL_IN, buttonPressed);
