hmax=3;
dif=0.42;
hmin=hmax-dif;
grosor=0.2;
ancho_interno=3.25;
largo_interno=4.34;
ancho_total=ancho_interno+2*grosor;
largo_total=largo_interno+2*grosor;
module columna(){
    cube([grosor,grosor,hmax]);
}

module viga_largo(){
    color("orange")
    cube([largo_interno+2*grosor,grosor,grosor]);
}

module columna_menor(){
    color("green")
    cube([grosor,grosor,hmin]);
}
module viga_ancho(){
    color("orange")
    cube([grosor,ancho_interno+2*grosor,grosor]);
}

module techo_malla(){
    translate([0,ancho_total/2,hmax])
    rotate([-90,0,-90])
    difference (){
        color("MediumTurquoise")
        cylinder(largo_total,d=ancho_total,$fn=12);
        translate([-ancho_total/2,0,-0.5])
        cube([ancho_total,ancho_total/2,largo_total+1]);
    }
}

color("red")
columna();

color("yellow")
translate([largo_interno+grosor,0,0])
columna();

color("pink")
viga_largo();

color("gray")
translate([0,0,hmax-grosor])
viga_largo();

color("skyblue")
viga_ancho();

color("lightgreen")
translate([largo_interno+grosor,0,0])
viga_ancho();

color("orange")
translate([largo_interno+grosor,0,hmax-grosor])
viga_ancho();

color("black")
translate([0,ancho_interno+grosor,0])
viga_largo();

color("purple")
translate([0,ancho_interno+grosor,hmin-grosor])
viga_largo();

//Columna esquina
color("brown")
translate([largo_interno+grosor,ancho_interno+grosor,0])
columna();

color("green")
translate([0,ancho_interno+grosor,0])
columna_menor();

//Vigas baja altura
color("blue")
translate([0,0,hmin-grosor])
viga_ancho();

//translate([0,ancho_total/2,hmax])
//rotate([-90,0,-90])
techo_malla();




