function Test6()     // добавление схемы приема из калькулятора
{    
    var w0=Sys.Process("Automedi"); 
    w0.VCLObject("AMMain").SetFocus();
    max_height = w0.VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Max; 
    height=w0.VCLObject("AMMain").VCLObject("pResume").Height;
    
    Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height); 
    
    //w1 - объект "амбулаторные назначения"
    var w1 = Runner.CallMethod("Unit_var.return_w11"); 
    w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
    
    // w2 - глоссарий справа
    var w2 = Runner.CallMethod("Unit_var.return_w2");
    //w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).Keys("");
    
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).Keys("1");
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).Click(5, 5); 
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).ClickR(5, 5);   
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).PopupMenu.Click("Выделить все"); 
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).ClickR(5, 5);
    w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).PopupMenu.Click("Удалить"); 
    
    
    Log.Message("!!!"); 
    arr_diagnoz_type = Runner.CallMethod("Unit_var.return_arr_diagnoz_type_icd");
    arr_diagnoz = Runner.CallMethod("Unit_var.return_arr_diagnoz");    // return_arr_diagnoz
    
    for (i = 0; i < arr_diagnoz_type.length; i++)
    {
          Log.Message(i);
          delay(2000);
          //w_temp = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1);  
          // это очень спорный способ поиска объекта "Амбулаторные назначения" , его нужно как-нибудь потом исправить 
          //if (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2").VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VisibleOnScreen == false)
          //{
                w0.VCLObject("AMMain").SetFocus(); 
                Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height); 
          //}
          w_temp = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1);
          //var w1 = Runner.CallMethod("Unit_var.return_w11"); 
          w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();  
          w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("memComment").Click();  
          w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
    
    
          str=arr_diagnoz_type[i]+"*"
          w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbICD").Click(40, 16);
          w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pTop").VCLObject("pTool").VCLObject("ToolBarView").PopupMenu.Click(str);
          delay(1500);
          var CIM10_ID = arr_diagnoz[i];
          
          var query = "select CIM10_ID, PARENT, LEVEL1 , LEVEL2, LEVEL3, LEVEL4, LEVEL5 , LEVEL6 , LEVEL7, LEVEL8 from CIM10 where CIM10_ID =  " + String(CIM10_ID);
          RecSet = Runner.CallMethod("Unit_var.db_connection", query); 
          
          
          fields = ["CIM10_ID", "PARENT", "LEVEL1" , "LEVEL2", "LEVEL3", "LEVEL4", "LEVEL5" , "LEVEL6", "LEVEL7", "LEVEL8"];
    
          cim_10_id = []
    
          for (k = 0; k < 10; k++)
          {
              if (String(RecSet.Fields(fields[k])) != "null") 
              {
                  cim_10_id.push(RecSet.Fields(fields[k]));
              }
          }
    
          string_cim_10_id = "";
    
          for (k = 0; k < cim_10_id.length; k++)
          {
                if (k != cim_10_id.length - 1)
                {
                     string_cim_10_id = string_cim_10_id + String(cim_10_id[k])+" " + "," + " ";
                }
                else
                {
                    string_cim_10_id = string_cim_10_id + String(cim_10_id[k])+" ";
                }
          }
    
          Log.Message(string_cim_10_id );
    
    
          var query1 = "select DISTINCT PR_DRUGS_ID from PR_DRUGS_CIM10 where CIM10_ID in ( " + string_cim_10_id + ")";
          RecSet1 = Runner.CallMethod("Unit_var.db_connection", query1);
    
          pr_drugs_id_list = []
    
          RecSet1.MoveFirst();
          while (! RecSet1.EOF )
          {
              //Log.Message(RecSet1.Fields("PR_DRUGS_ID").Value);
              pr_drugs_id_list.push(String (RecSet1.Fields("PR_DRUGS_ID")));
              RecSet1.MoveNext();
          }

          Log.Message("!!!!!!!!!!!!!!!");
          
          
          var j = 1;  
      
          for (k = 0; k < pr_drugs_id_list.length; k++)      //нашла id - шники медикаментов, связанных с диагнозом 
          {
              var query2 = "select  * from PR_DRUGS where PR_DRUGS_ID = " + String(pr_drugs_id_list[k]); // Log.Message(pr_drugs_id_list[i]);
              RecSet2 = Runner.CallMethod("Unit_var.db_connection", query2);
              Runner.CallMethod("Unit_var.find_amb_prescriptions",height, max_height); 
        
              var w1 = Runner.CallMethod("Unit_var.return_w11"); 
              w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();  
              w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("memComment").Click();  
              w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("edMed").Click();
                  
        
              var w2 = Runner.CallMethod("Unit_var.return_w2");
              w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VScroll.Pos = j;
              w2.VCLObject("tsDrugList").VCLObject("GridDrugsForm").VCLObject("tbView").Click();
              var temp_window = Sys.Process("Automedi").VCLObject("fDrugEdit").VCLObject("pRecord").VCLObject("Panel1").VCLObject("DBEdit6");
             
              temp_window.Click(); 
              temp_window.ClickR(10, 5); 
              temp_window.PopupMenu.Click("Выделить все"); 
              temp_window.ClickR(10, 5);
              temp_window.PopupMenu.Click("Копировать");
             
              var full_name = Sys.Clipboard; 
              Sys.Process("Automedi").VCLObject("fDrugEdit").Close();
              delay(400);
              j++;
              Log.Message(full_name ); 
        
          }

    }

}