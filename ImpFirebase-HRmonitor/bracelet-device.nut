imp.configure("Firebase Heartrate Bracelet", [], []);

bracelet <- hardware.pin1;
bracelet.configure(DIGITAL_OUT);

blinking <- false;
bpm <- 60;

function onBracelet(state) {
  server.log("Device got " + state);
  inputBpm <- state.tointeger();
  if(inputBpm>30&&inputBpm<240){
      bpm=inputBpm
  }
 
  if (!blinking) {
    blinking = true;
    blink();
  }
}

agent.on("bracelet", onBracelet);

function blink() {
  timeLit <- 0.05;
  delay <- (60.0/bpm) - timeLit;
  bracelet.write(1);
  imp.sleep(timeLit);
  bracelet.write(0);
  imp.wakeup(delay, blink);
}