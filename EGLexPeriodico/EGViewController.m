//
//  EGViewController.m
//  EGLexPeriodico
//
//  Created by Esther Gordo Ramos on 20/11/13.
//  Copyright (c) 2013 Esther Gordo Ramos. All rights reserved.
//

#import "EGViewController.h"
#import "EGNavegadorWebVC.h"

@interface EGViewController (){
    BOOL semaforoMenuButton;
    float XMenu, YMenuOculto,YMenuMostrado;
    CGPoint posicionMenuOculto, posicionMenuMostrado;
}

@end

@implementation EGViewController
@synthesize nacionalButton,localButton,deportesButton,saludButton,culturaButton,menuButton;
@synthesize fondoMenuButtonsView,fondoMenuView;
@synthesize tituloPeriodicoLabel;
@synthesize fuenteEnlaceLabel;
@synthesize tituloNoticiaLabel,autorNoticiaLabel,contenidoNoticiaTextView;

- (void)viewDidLoad
{
	// Do any additional setup after loading the view, typically from a nib.
    //NSArray *menuButtonsArray = [[NSArray alloc]initWithObjects:nacionalButton,localButton,deportesButton,culturaButton,saludButton, nil];
    semaforoMenuButton = 0;
    
    XMenu = CGRectGetMinX(self.view.bounds)+fondoMenuButtonsView.frame.size.width/2;
    YMenuOculto = CGRectGetMinY(self.view.bounds)-115;
    YMenuMostrado = CGRectGetMinY(self.view.bounds)+230;
    posicionMenuOculto = CGPointMake(XMenu, YMenuOculto);
    posicionMenuMostrado = CGPointMake(XMenu, YMenuMostrado);
    fondoMenuButtonsView.layer.position = posicionMenuOculto;
    fondoMenuView.layer.opacity = 0;
    
    tituloPeriodicoLabel.font = [UIFont fontWithName:@"AGothiqueTime" size:60.0];
    
    
        
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)pulsarMenuItemActionButton:(id)sender
{
    float randomRed = arc4random()%255;
    float randomBlue = arc4random()%255;
    float randomGreen = arc4random()%255;
    
    self.view.backgroundColor = [UIColor colorWithRed:randomRed/255.f green:randomGreen/255.f blue:randomBlue/255.f alpha:1];
    


}

- (IBAction)pulsarMenuActionButton:(id)sender
{
    [self aparecerMenu];
}


- (IBAction)abrirEnlaceEnNavegador:(id)sender
{
    
}

- (IBAction)nacionalPulsarBoton:(id)sender
{
    [self desaparecerMenu];
    tituloNoticiaLabel.text = @"El Rio Hortega acoge unas jornadas sobre bulimia y anorexia";
    autorNoticiaLabel.text = @"El Norte de Castilla";
    contenidoNoticiaTextView.text = @"Valladolid acogerá la tarde del viernes y la mañana del sábado el décimo encuentro de directivos y técnicos de la Federación Española de Asociaciones de Ayuda y Lucha contra la Anorexia y la Bulimia (Feacab).    El consejero de Sanidad, Antonio María Sáez Aguado, inaugurará un programa en el que se abordará el papel de la sociedad, la familia y los servicios de salud en la prevención y la detección precoz de los trastornos de la conducta alimentaria y también la atención de la anorexia y la bulimia desde los dispositivos asistenciales de Castilla y León.";
    
}

- (IBAction)deportesPulsarBoton:(id)sender
{
    [self desaparecerMenu];
}

- (IBAction)culturaPulsarBoton:(id)sender
{
    [self desaparecerMenu];
}

- (IBAction)saludPulsarBoton:(id)sender
{
    [self desaparecerMenu];
}

- (IBAction)localPulsarBoton:(id)sender
{
    [self desaparecerMenu];
}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"irABuscador"]) {
        EGNavegadorWebVC *destino= (EGNavegadorWebVC *)segue.destinationViewController;
        destino.urlABuscar = [NSURL URLWithString:@"http://desarrolloweb.com"];
    }
}


#pragma mark - Animations

-(void) aparecerMenu
{
    CABasicAnimation *aparecer = [CABasicAnimation animationWithKeyPath:@"opacity"];
    CABasicAnimation *moverAbajo = [CABasicAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *desaparecer = [CABasicAnimation animationWithKeyPath:@"opacity"];
    desaparecer.duration = 1;
    aparecer.duration = 1;
    moverAbajo.duration = 0.5;
    
    
    aparecer.fromValue = 0;
    aparecer.toValue = [NSNumber numberWithFloat:1];
    semaforoMenuButton = 1;
    moverAbajo.fromValue = [NSValue valueWithCGPoint:posicionMenuOculto];
    moverAbajo.toValue =[NSValue valueWithCGPoint:posicionMenuMostrado];
    fondoMenuView.layer.opacity = 1;
    fondoMenuButtonsView.layer.position = posicionMenuMostrado;
    
    
    [fondoMenuButtonsView.layer addAnimation:moverAbajo forKey:@"position"];
    [fondoMenuView.layer addAnimation:aparecer forKey:@"opacity"];
    [fondoMenuView.layer addAnimation:desaparecer forKey:@"opacity2"];

}

-(void)desaparecerMenu
{
    CABasicAnimation *aparecer = [CABasicAnimation animationWithKeyPath:@"opacity"];
    CABasicAnimation *moverAbajo = [CABasicAnimation animationWithKeyPath:@"position"];
    CABasicAnimation *desaparecer = [CABasicAnimation animationWithKeyPath:@"opacity"];
    desaparecer.duration = 1;
    aparecer.duration = 1;
    moverAbajo.duration = 0.5;
    
    desaparecer.fromValue = [NSNumber numberWithFloat:1];
    desaparecer.toValue = 0;
    semaforoMenuButton = 0;
    moverAbajo.fromValue =[NSValue valueWithCGPoint:posicionMenuMostrado];
    moverAbajo.toValue = [NSValue valueWithCGPoint:posicionMenuOculto];
    fondoMenuView.layer.opacity = 0;
    fondoMenuButtonsView.layer.position = posicionMenuOculto;
    
    [fondoMenuButtonsView.layer addAnimation:moverAbajo forKey:@"position"];
    [fondoMenuView.layer addAnimation:aparecer forKey:@"opacity"];
    [fondoMenuView.layer addAnimation:desaparecer forKey:@"opacity2"];

}


@end
