// Matt Burnett | Nov 6 2024 | SpaceGame
import processing.sound.*;
SoundFile laser;
SoundFile death;
SoundFile music;
SoundFile explosion;
SpaceShip s1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Powerup> powups = new ArrayList<Powerup>();
ArrayList<Star> stars = new ArrayList<Star>();
int score, level, rockRate;
boolean play;
Timer rTime, puTime;

void setup() {
  size(800, 800);
  s1 = new SpaceShip();
  score = 0;
  level = 1;
  play = false;
  rockRate = 1000;

  rTime = new Timer(rockRate);
  rTime.start();
  puTime = new Timer(10000);
  puTime.start();

  laser = new SoundFile(this, "laser.mp3");
  death = new SoundFile(this, "death.mp3");
  music = new SoundFile(this, "music.mp3");
  explosion = new SoundFile(this, "explosion.mp3");
}

void draw() {
  if (!play) {
    startScreen();
  } else {
    if (!music.isPlaying()) {
      music.play();
    }
    loop();
    background(0);
    if (frameCount % 100 == 0) {
      level ++;
      rockRate -= 5;
      rTime.totalTime -= 5;
    }
    stars.add(new Star());
    for (int i = 0; i < stars.size(); i++) {
      Star s = stars.get(i);
      s.display();
      s.move();
      if (s.reachedBottom()) {
        stars.remove(s);
      }
    }



    imageMode(CENTER);
    // render powerups
    if (puTime.isFinished()) {
      powups.add(new Powerup());
      puTime.start();
    }

    for (int i = 0; i < powups.size(); i++) {
      Powerup pu = powups.get(i);
      if (pu.intersect(s1) && pu.type == 'a') {
        s1.laserCount += 50;
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type == 'h') {
        s1.health += 25;
        powups.remove(pu);
      } else if (pu.intersect(s1) && pu.type == 't') {
        s1.turretCount ++;
        powups.remove(pu);
      }
      
      pu.display();
      pu.move();
      if (pu.reachedBottom()) {
        powups.remove(pu);
      }
    }


    // render lasers and detect laser v. rock collision
    for (int i = 0; i < lasers.size(); i++) {
      Laser laser = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (laser.intersect(rock)) {
          score += 10;
          rock.diam -= 30;
          lasers.remove(laser);
          if (rock.diam < 20) {
            if (!explosion.isPlaying()) {
              explosion.play();
            }
            rocks.remove(rock);
          }
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
    }
    // rock distribution
    if (rTime.isFinished()) {
      rocks.add(new Rock());
      rTime.start();
    }
    // render rocks and detect rock v. spaceship collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        //deduct 10 points
        score -= 10;
        //deduct 10 health
        s1.health -= 10;
        //delete rock
        rocks.remove(rock);
      }
      if (rock.reachedBottom()) {
        score -= 5;
        rocks.remove(rock);
      }
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health < 1) {
      gameOver();
      noLoop();
    }
  }
}

void keyPressed() {
  if (key == ' ' && s1.fire() && play) {
    lasers.add(new Laser(s1.x, s1.y ));
    s1.laserCount --;
  }
}

void infoPanel() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, 20, width, 40);
  fill(0);
  text("Score: " + score, 20, 36);
  text("Health: " + s1.health, 200, 36);
  text("Level: " + level, 380, 36);
  text("Ammo: " + s1.laserCount, 560, 36);
}

void startScreen() {
  background(0);
  fill(255);
  textAlign(CENTER);
  text("Welcome to SpaceGame!", width/2, 300);
  text("This game was made by Matt Burnett", width/2, 320);
  text("Please click to start...", width/2, 330);
  if (mousePressed) {
    play = true;
  } else {
    play = false;
  }
}

void gameOver() {
  background(0);
  fill(255);
  music.pause();
  if (!death.isPlaying()) {
    death.play();
  }
  noLoop();
  text("Game Over!", width/2, 300);
  text("Score: " + score, width/2, 320);
  text("Level: " + level, width/2, 340);
}

void ticker() {
}

void mousePressed() {
  if (play) {
    
    if (!laser.isPlaying()) {
    laser.play();
  }
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y ));
    s1.laserCount --;
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-10, s1.y ));
    lasers.add(new Laser(s1.x+10, s1.y ));
    s1.laserCount -= 2;
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y ));
    lasers.add(new Laser(s1.x-10, s1.y ));
    lasers.add(new Laser(s1.x+10, s1.y ));
    s1.laserCount -= 3;
  }
  }
}
