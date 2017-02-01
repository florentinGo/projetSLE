/************************************************************************/
/*																		*/
/*	main.c	--	ZYBO_CAMERA						*/
/*																		*/
/************************************************************************/

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include "xparameters.h"
#include "xuartps.h"
#include "xiicps.h"
#include "OV9655_camera.h"
#include "xiicps_hw.h"
#include "stdio.h"



/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

int main(void)
{
  XIicPs IIc;

  xil_printf("\x1B[2J"); // Clear terminal


  /* Configuration camera */
  OV9655_InitI2C(&IIc, XPAR_XIICPS_0_DEVICE_ID);
  OV9655_Config(&IIc, cam_config_640_480, cam_config_640_480_n);
  OV9655_Config_rw(&IIc, cam_config_rw, cam_config_rw_n);

  OV9655_CameraConfigInteractive(&IIc);

  //////////////////////////////////////////////////////////////

  xil_printf("Config ok\n\r");
  while(1);
}
