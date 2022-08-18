var w0_var=Sys.Process("Automedi"); // просто процесс автомеди



var patients_id_var=535828;

var pr_drugs_id_var = 436;   // id медикамента


var pr_drugs_id_list = [434, 436, 463, 442];   //id медикаментов, на основе которых делается составное назначение 

var pr_templates_id_var = 220; // id схемы приема

var intake_method_i_var = 2; //просто порядковый номер способа введения из глоссария 

var dose_calc_var = "13/457"; //  дозировка для ввода в калькулятор

var duration_var = 5;  //   длительность назначения (дней, месяцев и т.д.)
                                                               
var break_between_schemes_var = 7  //  перерыв между схемами

var arr_diagnoz = [1792, 4307, 4431];   // массив с id диагнозов

var arr_diagnoz_type=["1 - основное заболевание", "2 - осложнение основного заболевания", "3 - сопутствующее заболевание"]

var arr_diagnoz_type_icd=["основное заболевание", "осложнение основного заболевания", "сопутствующее заболевание"]

var comment = 1 // нужен ли комментарий при созании назначения: 0 -нет , 1 - да
var comment_text = "1239e9qewioJSOWIE"

var pr_template_schemes_id=4211;  //  id типового назначения 
var pr_template_schemes_id_list = [4211, 4210, 4209, 4201];   //id типовых назначений, массив добавила на тот случай, если проверять буду сразу несколько типовых назначений 

var name_motconsu="Поликлиника - Направления/Назначения"
var name_motconsu_diagnoz = "Осмотр - Терапевт"



/*
"1 - основное заболевание"
"2 - осложнение основного заболевания"
"3 - сопутствующее заболевание"
"1.1 - фоновое заболевание"
"1.2 - конкурирующее"
"1.3 - сочетанное"
*/


function patients_id()
{
   return (patients_id_var);
}

function pr_drugs_id()
{
   return (pr_drugs_id_var);
}

function return_scheme_name()
{
   return (scheme_name);
}

function return_pr_template_schemes_id()
{
   return (pr_template_schemes_id);
}

function return_pr_template_schemes_id_list()
{
   return (pr_template_schemes_id_list);
}

function return_pr_drugs_id_list()
{
   return (pr_drugs_id_list);
}

function return_name_motconsu()
{
   return (name_motconsu);
}

function return_name_motconsu_diagnoz()
{
   return (name_motconsu_diagnoz) ;
}


function return_arr_diagnoz()
{
   return (arr_diagnoz)
}

function return_arr_diagnoz_type()
{
   return (arr_diagnoz_type)
}

function return_arr_diagnoz_type_icd()
{
   return (arr_diagnoz_type_icd)
}

function pr_templates_id()
{
   return (pr_templates_id_var)
}

function intake_method_i()
{
   return (intake_method_i_var)
}

function dose_calc()
{
   return (dose_calc_var)
}

function duration()
{
   return (duration_var)
}

function break_between_schemes()
{
   return (break_between_schemes_var)
}

function return_comment_text()
{                        
   return (comment_text);
}

function return_comment()
{
   return (comment);
}

function return_w1()
{
   var w1 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_935A08B5B8DF4F818224FADDDC3642E2").Window("TPageControl", "", 1) // w1 - объект "амбулаторные назначения"  в записи "направления-назначения"
   return (w1)
}
function return_w11()
{
var w11 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1) //w11 - объект "амбулаторные назначения"  в записи с диагнозами     
   return (w11)
}
function return_w2()
{
var w2 = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("PanelGlossDrug").VCLObject("pcDrugs") // w2 - глоссарий справа объекта "амбулаторные назначения" 
   return (w2)
}
function return_w3()
{
var w3 = Sys.Process("Automedi").VCLObject("DirServEditor") // w3 - окно-редактор назначения 
   return (w3)
}
function return_w4()
{
var w4 = Sys.Process("Automedi").VCLObject("fmPRDrugsRecipeEdit") // w4 - окно-редактор рецепта 
   return (w4)
}



function return_w1_checkpoint(w1)      /////////////////////
{

    var w_temp = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates");
    if (w_temp.WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w1_checkpoint = w_temp.VCLObject("fmPREmbeddedTemplate");
    }
    else if  (w_temp.WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w1_checkpoint = w_temp.VCLObject("fmPREmbeddedTemplate_1");
    }
    else if (w_temp.WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
          var w1_checkpoint = w_temp.VCLObject("fmPREmbeddedTemplate_2");
    }    
    return (w1_checkpoint)
}

function intake(w1, i)
{
    //поле для способа введения
    //w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click();
    w1.VCLObject("PanelNaznach").VCLObject("SimplePanel").VCLObject("dblPrIntakeMethods").VCLObject("Code").Window("Edit", "", 1).Click(); 
    //delay(2000);
    var j=i*15.6-5;
    Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
    //Aliases.Automedi.AMMain.pGlossaire.pMain.PageControl1.GlossarySheet.tcGlossKind.TGlossViewer.DblClick(38, j);
    //delay(2000);
} 

function intake1(w0, i)
{
    //поле для способа введения
    var j=i*15.6-5;
    w0.pRecord.VCLObject("pGlossaire").VCLObject("pMain").VCLObject("PageControl1").VCLObject("GlossarySheet").VCLObject("tcGlossKind").Window("TGlossViewer", "", 1).DblClick(38, j);
} 

function close_edit_window (w0)  //  окно "снять запрет на редактирование"    
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", 1, 700).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("Yes").Click(); 
         delay (1500);       
      }
}

function return_w_scheme(w1)         // w_scheme поле для схемы приема в объекте "Амбулаторные назначения"                                                              
{
    if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_1" , 200).Exists)
    {
          var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_1")
    }
    else if (w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").WaitVCLObject("fmPREmbeddedTemplate_2" , 200).Exists)
    {
         var w_scheme = w1.Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("PanelTop").VCLObject("TabControl1").VCLObject("PanelNaznach").VCLObject("PanelTemplate").VCLObject("pnPrTemplate").VCLObject("sbTemplates").VCLObject("fmPREmbeddedTemplate_2")
    } 
    return (w_scheme)
}

function calculator_dose(w2, number)    //функция на калькуляторе набирает дозировку
{
    str_calc_number = String(number);
    for (i = 0; i < str_calc_number.length; i++)
    {
        if (str_calc_number.charAt(i)==".")
        {
            var button_name = "btnDecFrac";
        }
        else if  (str_calc_number.charAt(i)=="/")
        {
             var button_name = "btnFrac"; 
        }
        else
        {
            var button_name="btn"+str_calc_number.charAt(i);
        }
        w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject(button_name).Click();         
    }
    
    w2.VCLObject("tsAppSchemes").VCLObject("AppSchemesForm").VCLObject("fSimpleTemplateEdit").VCLObject("btnDosage").Click();  
}

function return_w_checkpoint(w3)         // w_checkpoint - заготовка для полей в окне-редакторе назначения  (до схемы приема)                                                               
{
    if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder");
    }
    else if  (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_1" , 200).Exists)
    {
          var w_checkpoint = w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_1");
    }
    else if (w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").WaitVCLObject("fmPRPlanBuilder_2" , 200).Exists)
    {
          var w_checkpoint= w3.VCLObject("pRecord").VCLObject("pcPrescr").VCLObject("tsIntakeScheme").VCLObject("pnTemplate").VCLObject("fmPRPlanBuilder_2");
    }    
    return (w_checkpoint)
}

function close_confirmation_window(w0)
{
    if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)
      {
         w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         if (w0.WaitWindow("TMessageForm", "Подтверждение", -1, 1500).Exists)     //это нужно будет убрать сразу после того как ошибку исправят, второго предупреждения быть не должно
         {
             w0.Window("TMessageForm", "Подтверждение", 1).VCLObject("No").Click();
         }         
      }
} 

function diagnoses(w1, arr_diagnoz, arr_diagnoz_type)
{
   for (i = 0; i < arr_diagnoz.length; i++)
  {
    w1.VCLObject("tbNew").Click()
    //выбор "типа" диагноза (основное, сопутствующее и т.д.)
    // Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TFormContainer_6C9F6C7474D94283A5C611485257F3B8.TDBRadioCombo_B7DD45A628B14ED2A20CD4973844CDAF.TDBValuesComboBox.Keys(arr_diagnoz_type[i]); 
    Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TFormContainer_6C9F6C7474D94283A5C611485257F3B8").VCLObject("TDBRadioCombo_B7DD45A628B14ED2A20CD4973844CDAF").Window("TDBValuesComboBox", "", 1).Keys(arr_diagnoz_type[i])
    
    //лукап для выбора диагноза:
    // Aliases.Automedi.AMMain.pResume.pForm.pSPEGRE.TScrollBoxWithControls.TFormContainer_6C9F6C7474D94283A5C611485257F3B8.TDBLookup_84F7CC410C7F4B469C0F222C0BB9DBC8.bRun.Click() 
    Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VCLObject("TFormContainer_6C9F6C7474D94283A5C611485257F3B8").VCLObject("TDBLookup_84F7CC410C7F4B469C0F222C0BB9DBC8").VCLObject("bRun").Click(); 
    
    // вводим id диагноза
    //Aliases.Automedi.ClassifLookDocTree.ListPanel.pGrid.pSearch.Window("TEdit", "*", 1).Keys(arr_diagnoz[i])
    Sys.Process("Automedi").VCLObject("ClassifLookDocTree").VCLObject("ListPanel").VCLObject("pGrid").VCLObject("pSearch").Window("TEdit", "", 1).Keys(arr_diagnoz[i]); 
    
    delay(2000)
    // выбраем диагноз
    //Aliases.Automedi.ClassifLookDocTree.VCLObject("BtnOk").Click();
    Sys.Process("Automedi").VCLObject("ClassifLookDocTree").VCLObject("BtnOk").Click(); 
    delay(2000)
  }
 // return(arr_diagnoz_name)
}

/*
function find_amb_prescriptions(height, max_height)
{
  current_height=127
  while (current_height+height < max_height)
  {
      current_height=current_height+height;
      Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;
  }  
} */

function find_amb_prescriptions(height, max_height)
{
    var w0=Sys.Process("Automedi");
    height=w0.VCLObject("AMMain").VCLObject("pResume").Height;
       
    current_height = 1;   
  
    w_temp = Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1);  
     
    Sys.Process("Automedi").VCLObject("AMMain").SetFocus();

    while (w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2").VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").VisibleOnScreen == false)
    {
        if (current_height + 400 <= max_height)
        {                 
              current_height = current_height + 400 ;
              Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
        }
      
        else if (current_height + 200 <= max_height)
        {                 
              current_height = current_height + 200 ;
              Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
        }
      
        else if (current_height + 100 <= max_height)
        {
              current_height = current_height + 100 ;
              Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
        }
      
        else if (current_height + 10 <= max_height)
        {     
              current_height = current_height + 10;
              Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos=current_height;  
       }
    }  
  
    h = w_temp.VCLObject("TPatDocControl_DA9944085BBF48B1A654475E76146D49").Window("TPageControl", "", 1).Window("TTabSheet", "Амбулаторные назначения", 1).VCLObject("PatDrugDocAmbForm").VCLObject("RecipePanel").VCLObject("TabControl2").VCLObject("PanelRecipe").VCLObject("PatDocAmbRecipeForm").VCLObject("pGrid").VCLObject("GridPanel").VCLObject("Grid").Height;

    Sys.Process("Automedi").VCLObject("AMMain").VCLObject("pResume").VCLObject("pForm").VCLObject("pSPEGRE").Window("TScrollBoxWithControls", "", 1).VScroll.Pos = current_height + h / 2 ;
   
}

function db_connection(query)
{
    var AConnection, RecSet, Cmd, Prm;
    AConnection = ADO.CreateConnection();
    AConnection.ConnectionString = "Provider=MSDASQL;Persist Security Info=False;User ID=sa;password=system;Data Source=gresova";
    AConnection.Open();
    Cmd = ADO.CreateCommand();
    Cmd = new ActiveXObject("ADODB.Command");
    Cmd.ActiveConnection = AConnection;
    Cmd.CommandType = adCmdText; 
    Cmd.CommandText =  query;
    RecSet = Cmd.Execute();
    return(RecSet)
}