function find_amb_prescriptions()               //это нужно доработать
{
  
  var w0=Sys.Process("Automedi");  
  max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max; 
  height=w0.VCLObject("AMMain").VCLObject("pResume").Height;
  
           
  current_height = 1;   
  
  w_temp = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1);  
     
  Sys.Process("Automedi").VCLObject("AMMain").SetFocus();
  
 //.Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2").VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid")
  
  
  while (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2").VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VisibleOnScreen == false)
  {
      if (current_height + 400 <= max_height)
      {
            Log.Message ("+ 400");
            current_height = current_height + 400 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
            Log.Message (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VisibleOnScreen);
            Log.Message (current_height); 
            
            
      }
      
      else if (current_height + 200 <= max_height)
      {
            Log.Message ("+ 200"); 
            current_height = current_height + 200 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
            Log.Message (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VisibleOnScreen);
            Log.Message (current_height); 
            
      }
      
      else if (current_height + 100 <= max_height)
      {
            Log.Message ("+ 100");
            current_height = current_height + 100 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
            Log.Message (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VisibleOnScreen);
            Log.Message (current_height); 
            
      }
      
      else if (current_height + 10 <= max_height)
      {
            Log.Message ("+ 10"); 
            current_height = current_height + 10 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
            Log.Message (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VisibleOnScreen);
            Log.Message (current_height);
      }
      
     /* else if (current_height + 1 <= max_height)
      {
            current_height = current_height + 1 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
      }*/
  }  
  
  h = w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2").VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").Height;
  Log.Message ("h:");
  Log.Message (h); 
  
  Log.Message ("current_height:");
  Log.Message (current_height); 
  Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos = current_height + h / 2 ;
  
  /*               
  while (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).VisibleOnScreen == false)
  {
      if (current_height + 400 <= max_height)
      {
            current_height = current_height + 400 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
      }
      
      else if (current_height + 200 <= max_height)
      {
            current_height = current_height + 1 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
      }
      
      else if (current_height + 100 <= max_height)
      {
            current_height = current_height + 1 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
      }
      
      else if (current_height + 10 <= max_height)
      {
            current_height = current_height + 1 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
      }
      
      else if (current_height + 1 <= max_height)
      {
            current_height = current_height + 1 //(height / 50);
            Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
      }
  }   */
  
  w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click(); 
  
 /* if (w_temp.WaitVCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49" , 200).VisibleOnScreen == 0) 
  {
       current_height=current_height + 10 //(height / 50);
      Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
  }   */
  /*
  
  
  current_height = 127;
  while (current_height+height < max_height)
  {
      current_height=current_height+height;
      Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;
  }  */
}