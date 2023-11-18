package com.example.lab8iweb.Beans;

import java.util.Random;

public class Soldade extends Pobladores {
    int produccionMoral = new Random().nextInt(10,40);
    int fuerza = new Random().nextInt(15,50);
}
