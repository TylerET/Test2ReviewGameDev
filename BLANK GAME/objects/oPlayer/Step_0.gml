// Setup
getControls();

onWall = false;

#region X Movement

moveDir = rightKey - leftKey;
if moveDir != 0 {faceDir = moveDir}
runType = runKey;
xSpeed = moveDir * moveSpeed[runType];

// X collision
var _subPixel = .5;
if place_meeting(x + xSpeed, y ,  oWall) {
	
	// Check for slope
	if !place_meeting(x + xSpeed, y - abs(xSpeed)-1, oWall) {
		while place_meeting(x + xSpeed, y, oWall) {y -= _subPixel}
	} else {	
	// moves as close to wall precisely
		var _pixelCheck = _subPixel * sign(xSpeed);
		while !place_meeting(x + _pixelCheck, y , oWall) {
			x += _pixelCheck;
		}
		xSpeed = 0;
		onWall = true;
	}

}

//Go down slopes
if ySpeed >= 0 && !place_meeting(x + xSpeed, y + 1, oWall) && place_meeting(x +xSpeed, y + abs(xSpeed)+1, oWall) {
	while !place_meeting(x + xSpeed, y + _subPixel, oWall) { y+= _subPixel}
}

//Move
x += xSpeed;

#endregion

#region Y Movement

// Gravity
if coyoteHangTimer > 0 {
	coyoteHangTimer--;
}else {
	if (onWall && ySpeed > 0) {
		ySpeed += grav / 50;
	} else { ySpeed += grav}
	setOnGround(false);
}


if ySpeed > terminalVelocity {
	ySpeed = terminalVelocity;
}
	
// Initiate the Jump
	if onGround {
		jumpCount = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	} else {
		// if player is in air, make sure they can't do an extra jump
		coyoteJumpTimer--;
		if (jumpCount == 0 && coyoteJumpTimer <= 0) { jumpCount = 1;}
	}

if jumpKeyBuffered && jumpCount < jumpMax {
	jumpKeyBuffered = false;
	jumpKeyBufferTimer = 0;
	jumpCount++;
	jumpHoldTimer = jumpHoldFrames;
	setOnGround(false);
}

// Jump based on holding jump key

if !jumpKey {
	jumpHoldTimer = 0;	
}

if (jumpHoldTimer > 0){
	ySpeed = jumpSpeed;
	jumpHoldTimer--;
}

// Y collision
var _subPixel = .5;
if (place_meeting(x, y + ySpeed, oWall)) {
    // moves as close to floor precisely
	var _pixelCheck = _subPixel * sign(ySpeed);
	while !place_meeting(x, y + _pixelCheck, oWall) {
		y += _pixelCheck;
	}
	//Bonk head check
	if (ySpeed < 0){
		jumpHoldTimer = 0;
	}
	
	ySpeed = 0;
}

if (ySpeed >= 0 && place_meeting(x, y+1, oWall)){
	setOnGround(true);
}

//Move
y += ySpeed;
	
#endregion

if (keyboard_check_pressed(ord("R"))) {
	game_restart()
}

if (keyboard_check_pressed(ord("Q"))) {
	checked_answer = false;
}

