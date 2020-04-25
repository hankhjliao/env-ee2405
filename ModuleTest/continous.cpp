#include "mbed.h"

#define CENTER_BASE 1500

PwmOut servo(D11);
InterruptIn button(SW2);
DigitalOut led2(LED2);
DigitalOut led3(LED3);

const int s = 100;
volatile int speed = 0;

void ISR() {
    if(speed == s)
    {
        speed = 0;
        led2 = 0;
        led3 = 0;
    }
    else if(speed == 0)
    {
        speed = -s;
        led2 = 1;
        led3 = 0;
    }
    else if(speed == -s)
    {
        speed = s;
        led2 = 0;
        led3 = 1;
    }
}

void servo_control(int value)
{
    if (value > 200)       value = 200;
    else if (value < -200) value = -200;

    servo = (CENTER_BASE + value)/20000.0f;
}

int main()
{
    button.rise(&ISR);
    servo.period(.02);

    while(1)
    {
        servo_control(speed);
        wait(2);
    }
}
