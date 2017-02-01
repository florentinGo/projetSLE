////////////////////////////////////////////////////////////////////////////////
// Company:        ENSIMAG
// Engineer:       Fondevilla Mathieu, Yu Wanwan
// 
// Module Name:    TestBench for CatapultC-Vsim simulation 
// Project Name:   JPEG2000 & HLS
//
////////////////////////////////////////////////////////////////////////////////
#include "Main_Trans_Ond_opt.h"
#include <stdio.h>
#include <stdlib.h>
#include <fstream>
#include <mc_scverify.h>

#define NB_LEVELS 3

/* This testbench makes a compression of the picture "lena2.pgm".
 * The compression is made with a level of NB_LEVELS.
 * The result picture is written in the current directory, with the
 *	name "trans_ond.pgm".
 */

CCS_MAIN(int argc, char *argv[])
{
  
  ac_int<8,false> image[HEIGHT_IMAGE*WIDTH_IMAGE];
  ac_int<8,false> comp[HEIGHT_IMAGE*WIDTH_IMAGE];
  ac_int<8,false> vga[HEIGHT_IMAGE*WIDTH_IMAGE];

  unsigned int i;
  unsigned int j;

  int useless;
  std::string dumb_string;
  std::ifstream fichier("image/lena2.pgm", std::ios::in);
  
/*** Ecriture du fichier test source dans la mémoire ***/
  if(!fichier) {
    std::cout << "ça ne lit pas le fichier" << std::endl;
    CCS_RETURN(1);
  }
  getline(fichier, dumb_string);
  fichier >> useless >> useless >> useless;
  std::cout << " img " << dumb_string << useless << std::endl;
  Ram_Y : for(i = 0; i < HEIGHT_IMAGE; i++) {
  Ram_X : for(j = 0; j < WIDTH_IMAGE; j++) {
    fichier >> useless;
     image[i*WIDTH_IMAGE + j]  = useless;
    }
  }
  fichier.close();
  std::cout << " fichier OK" << std::endl;
  
/*** Appel du programme principal ***/
  CCS_DESIGN(Main_Trans_Ond_Opt)(image, comp, vga, NB_LEVELS);

/*** Ecriture de la mémoire vga dans le fichier résultat **/
  printf("Trans_Ond OK\n");
  std::ofstream fichier_out("trans_ond.pgm", std::ios::out);
  if(!fichier_out) {
    std::cerr << "ça n'ecrit pas le fichier" << std::endl;
    CCS_RETURN(1);
  }
  fichier_out << "P2" << std::endl 
	      << WIDTH_IMAGE << " " << HEIGHT_IMAGE << std::endl 
	      << "255" << std::endl;
  Ond_Y : for(i = 0; i < HEIGHT_IMAGE; i++) {
  Ond_X : for(j = 0; j < WIDTH_IMAGE; j++) {
      fichier_out << vga[i*WIDTH_IMAGE + j] << " ";
    }
  }
  fichier_out << std::endl;
  fichier_out.close();
 
  CCS_RETURN(0);
}
