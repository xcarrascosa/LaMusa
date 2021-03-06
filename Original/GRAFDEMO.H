! Grafdemo.h
!
!  Rutinas para mostrar autom�ticamente un gr�fico al cambiar de
!  localidad o al examinar un objeto.
!
! (c) 2000 Zak McKracken 
!
! Son rutinas de alto nivel que realizan llamadas a SIX para el manejo
! de los gr�ficos, por lo que sirven tanto para juegos .z6 como para
! juegos Glulx (los detalles espec�ficos de cada m�quina se manejan
! desde SIX, y no desde este fichero).

Global NumGrafPrevia;   ! Gr�fico mostrado la �ltima vez que se llam�
                        ! a PintarGraficoLocalidad
Global MarcoPintado=0;  ! �Se ha pintado ya el marco de la imagen?
Global AnchoPrevio=0;   ! Ancho que ten�a la pantalla la �ltima vez
                        ! que se llam� a PintarGraficoLocalidad
                        ! (piensese que el jugador puede cambiar el
                        ! tama�o de la ventana del int�rprete)


! PintaMarco dibuja la banderola sobre la cual aparecen los gr�ficos
! de cada localidad. La banderola est� almacenada en el gr�fico
! Marco_jpg. Adem�s, el resto de la ventana se rellena con un patr�n
! que se obtiene de Fondo_jpg
!
! El par�metro "forzar" fuerza a que se repinte
!
[ PintaMarco forzar ag;

    ag=AnchoDeVentanaGrafica();
    if (forzar||(AnchoPrevio==0)||(AnchoPrevio~=ag))
    {
	! Si la ventana ha cambiado de tama�o, hay que volver a pintar
	! el fondo y el marco, para que quede centrado en las nuevas
	! dimensiones.
	AnchoPrevio=ag;
	PatronFondoGraficos(negro);
    	PintarGraficoCentrado(negro);
	MarcoPintado=0;
    }

    if (MarcoPintado==0)
    {
    	PintarGraficoCentrado(negro);
    	MarcoPintado=1;
    }
];


! La siguiente funci�n decide qu� gr�fico es el adecuado para esa
! localidad, y lo pinta centrado sobre la banderola anterior.
!
! Solo lo pinta si detecta que el gr�fico ha cambiado, o si el
! parametro "forzar" vale true.
!
[ PintarGraficoLocalidad forzar
    n;

    ! Si estamos a oscuras, el gr�fico a dibujar es Oscuridad_png
    ! Si no, lo sacamos de la propiedad numgrafico de la localidad
    ! actual (y si esta propiedad no existe, usamos el gr�fico
    ! Sin_Imagen_jpg
    !
    if (localizacion==laoscuridad) n=negro;
    else if (localizacion provides numgrafico) n=localizacion.numgrafico;
    else n=negro;
    if (forzar||(n~=NumGrafPrevia))
    {
	NumGrafPrevia=n;
	PintaMarco(forzar);
	PintarGraficoCentrado(n);
	rtrue;
    }
    rfalse;
];


! La rutina TrasElPrompt se ejecuta siempre despues de que la librer�a
! haya impreso el prompt ">", es un buen momento para repintar el
! gr�fico de la localidad.
!
[ TrasElPrompt;
    PintarGraficoLocalidad();
];


! Lo siguiente es un punto de entrada de SIX. Debe ocuparse de
! repintar el gr�fico de la localidad:
!
[ RepintarGraficos;
    PintarGraficoLocalidad(true);
];



! Cambiamos la rutina ExaminarSub por otra que adem�s d� la
! descripci�n, muestre el gr�fico del objeto (es decir, cuando el
! jugador ponga EX OBJETO, saldr� una imagen de �ste, adem�s de su
! descripci�n. La imagen se toma de la propiedad numgrafico del
! objeto, si tiene una).
!
! La rutina se ha escrito "copiando y pegando" la que ven�a en
! Acciones.h, y a�adi�ndole simplemente las lineas se�aladas
!
Replace ExaminarSub;
[ ExaminarSub i;
    if (localizacion==laoscuridad) return M__L(##Examinar,1);

 ! -----A�ADIDO
    if (uno provides numgrafico)
	PintarGraficoEnLinea(uno.numgrafico, imagealign_inlineup);
    ! puedes cambiar el tipo de alineaci�n, si prefieres.
 ! -----FIN DE A�ADIDO

    i=uno.descripcion;
    if (i==0)
    {   if (uno has recipiente) <<BuscarEn uno>>;
      	if (uno has conmutable) { M__L(##Examinar,3,uno); rfalse; }
      	return M__L(##Examinar,2,uno);
    }
    ImprimirOEjecutar(uno, descripcion);
    if (uno has conmutable) M__L(##Examinar,3,uno);
    if (RutinasDespues()==1) rtrue;
];

!================================================================
! FIN DE Grafdemo.h

