#ifndef LIGHT_H
#define LIGHT_H


class Light
{
public:
    GLfloat pos[3];
    GLfloat color[3];

    Light(GLfloat x = 0.0, GLfloat y = 0.0, GLfloat z = 0.0,
          GLfloat r = 1.0, GLfloat g = 1.0, GLfloat b = 1.0, GLfloat f = 1.0)
    {
        pos[0] = x;
        pos[1] = y;
        pos[2] = z;

        color[0] = r*f;
        color[1] = g*f;
        color[2] = b*f;
    }
};


#endif // LIGHT_H
