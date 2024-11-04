#region Movement
controlsSetup();
// Moving
faceDir = 1;
moveDir = 0;
runType = 0;
moveSpeed[0] = 2;
moveSpeed[1] = 3.5;
xSpeed = 0;
ySpeed = 0;

// Jumping
grav = .275;
terminalVelocity = 4;
onGround = true;
jumpSpeed = -3.15;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 18;
coyoteHangFrames = 2;
coyoteHangTimer = 0;
coyoteJumpFrames = 5;
coyoteJumpTimer = 0;
// Wall slide
onWall = false;

function setOnGround(_val = true){
	if _val {
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		coyoteHangTimer = 0;
	}
}

checked_answer = false;



#endregion