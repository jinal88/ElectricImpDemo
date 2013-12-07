
button <- hardware.pin1;

function buttonPushed() {
    imp.sleep(0.02);
    local state = button.read();
    agent.send("button", state);
}

button.configure(DIGITAL_IN_PULLUP, buttonPushed);

agent.send("id", hardware.getdeviceid());

