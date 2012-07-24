import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

int contrast_value    = 0;
int brightness_value  = 0;

void setup() {
    size( 800, 600 );
    opencv = new OpenCV( this );
    opencv.capture( width, height );
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
}

public void stop() {
    opencv.stop();
    super.stop();
}

void draw() {
    opencv.read();
    opencv.convert( GRAY );
    opencv.contrast( contrast_value );
    opencv.brightness( brightness_value );
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
    image( opencv.image(), 0, 0 );
    noFill();
    stroke(255,0,10);
    for( int i=0; i<faces.length; i++ ) {
        rect( faces[i].x, faces[i].y, faces[i].width, faces[i].height );
    }
}

void mouseDragged() {
   contrast_value   = (int) map( mouseX, 0, width, -128, 128 );
   brightness_value = (int) map( mouseY, 0, width, -128, 128 );
}


