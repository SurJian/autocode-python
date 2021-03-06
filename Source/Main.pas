unit Main;


interface


uses
     //
     SysRecords,
     SysConsts,
     SysVars,
     SysUnits,

     //
     teUnit,


     //
     //TkinterWin,


     //MyFunctions,
     //FcConsts,
     NodeEditConsts,
     NodeSearch,
     ACBaseUnits,
     //XMLFlowChartUnit,
     //XMLNSChartUnit,
     XMLTreeViewUnits,
     XMLUnits,
     XMLGenCodeRecords,
     SysOption,


     //
     JsonDataObjects,
     FloatSpinEdit,

     //各语言代码生成
     //XMLPascal,
     //XMLCpp,
     //XMLJava,
     //XMLCSharp,
     //XMLJavaScript,
     //XMLPython,
     Json2Python,
     Json2Flowchart,

     //导出
     ExportWord,
     ExportVisio,
     ExportSVG,


     //
     mxClickSplitter,

     //
     Clipbrd,XPMan, ShellAPI,
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, ExtCtrls, ComCtrls, ToolWin, ImgList, Menus, ActnMan,
     ActnColorMaps,  StdCtrls, TabNotBk, Tabs, ADODB, DB, Buttons,
     Mask, Spin, Types,  Grids,Math,ComObj,IniFiles,FileCtrl, ActnList,ExtDlgs,   pngimage,
     System.ImageList;

type
  TMainForm = class(TForm)
    ColorDialog: TColorDialog;
    ImageList_Modes: TImageList;
    OpenDialog: TOpenDialog;
    ImageList_ToolBar: TImageList;
    Panel_ToolBar: TPanel;
    ToolBar: TToolBar;
    ToolButton_Open: TToolButton;
    ToolButton1: TToolButton;
    ToolButton_GenerateCode: TToolButton;
    ToolButton_Save: TToolButton;
    ToolButton_Expand: TToolButton;
    ToolButton_Collapse: TToolButton;
    ToolButton3: TToolButton;
    ToolButton_Up: TToolButton;
    ToolButton5: TToolButton;
    ToolButton_Down: TToolButton;
    ToolButton_Help: TToolButton;
    MainMenu: TMainMenu;
    MenuItem_File: TMenuItem;
    MenuItem_New: TMenuItem;
    MenuItem_OpenProject: TMenuItem;
    MenuItem_Save: TMenuItem;
    N2: TMenuItem;
    MenuItem_Exit: TMenuItem;
    MenuItem_Edit: TMenuItem;
    MenuItem_GenerateCurr: TMenuItem;
    MenuItem_RefreshTree: TMenuItem;
    N10: TMenuItem;
    MenuItem_ExpandAll: TMenuItem;
    MenuItem_ShrinkAll: TMenuItem;
    MenuItem_Option: TMenuItem;
    MenuItem_Help: TMenuItem;
    N7: TMenuItem;
    MenuItem_HomePage: TMenuItem;
    N3: TMenuItem;
    MenuItem_About: TMenuItem;
    PopupMenu_TreeView: TPopupMenu;
    N18: TMenuItem;
    PopMenu_Copy: TMenuItem;
    PopMenu_Paste: TMenuItem;
    PopMenu_Delete: TMenuItem;
    ToolButton_NewProject: TToolButton;
    StatusBar: TStatusBar;
    ToolButton7: TToolButton;
    N20: TMenuItem;
    Delete1: TMenuItem;
    MenuItem_RunMenu: TMenuItem;
    MeuItem_Generatefile: TMenuItem;
    Panel_Left: TPanel;
    TreeView: TTreeView;
    SaveDialog: TSaveDialog;
    PopMenu_Cut: TMenuItem;
    ToolButton_ZoomIn: TToolButton;
    ToolButton_ZoomOut: TToolButton;
    Cut1: TMenuItem;
    ToolButton_Option: TToolButton;
    ScrollBox: TScrollBox;
    Image: TImage;
    ToolButton2: TToolButton;
    ToolButton_ExportToFile: TToolButton;
    ToolButton_SaveToWord: TToolButton;
    ToolButton_SaveToVisio: TToolButton;
    ToolButton_SaveToSVG: TToolButton;
    ToolButton_SaveToBmp: TToolButton;
    ImageList_24: TImageList;
    SaveDialog_ExportToFile: TSaveDialog;
    SavePictureDialog: TSavePictureDialog;
    SaveVisioDialog: TSaveDialog;
    SaveDialog_SVG: TSaveDialog;
    SaveDialog_Word: TSaveDialog;
    N1: TMenuItem;
    Copyselectedcode1: TMenuItem;
    mxClickSplitter_LeftBottom: TmxClickSplitter;
    mxClickSplitter_Left: TmxClickSplitter;
    Panel_LeftBottom: TPanel;
    Panel_Client: TPanel;
    Panel_Messages: TPanel;
    mxClickSplitter_ClientBottom: TmxClickSplitter;
    Memo_Messages: TMemo;
    ToolButton_RunWithWindow: TToolButton;
    ImageList_TextModes: TImageList;
    ToolButton_TkinterWindow: TToolButton;
    mxClickSplitter1: TmxClickSplitter;
    Memo_Code: TMemo;
    ToolButton4: TToolButton;
    FontDialog: TFontDialog;
    procedure PopMenu_DeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PopMenu_CopyClick(Sender: TObject);
    procedure PopMenu_PasteClick(Sender: TObject);
    procedure MenuItem_ExpandAllClick(Sender: TObject);
    procedure MenuItem_CloseAllClick(Sender: TObject);
    procedure MenuItem_ExpandSelClick(Sender: TObject);
    procedure ToolButton_GenerateCodeClick(Sender: TObject);
    procedure PopupMenu_TreeViewPopup(Sender: TObject);
    procedure TreeViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MenuItem_ExitClick(Sender: TObject);
    procedure ToolButton_ExpandClick(Sender: TObject);
    procedure ToolButton_CollapseClick(Sender: TObject);
    procedure ToolButton_UpClick(Sender: TObject);
    procedure ToolButton_DownClick(Sender: TObject);
    procedure ToolButton_SaveClick(Sender: TObject);
    procedure ToolButton_OpenClick(Sender: TObject);
    procedure ImageDblClick(Sender: TObject);
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ImageMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PopMenu_SetRootClick(Sender: TObject);
    procedure TreeViewMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ToolButton_ZoomInClick(Sender: TObject);
    procedure ToolButton_ZoomOutClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure ToolButton_NewProjectClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton_OptionClick(Sender: TObject);
    procedure ToolButton_ExportToFileClick(Sender: TObject);
    procedure ToolButton_SaveToBmpClick(Sender: TObject);
    procedure ToolButton_SaveToWordClick(Sender: TObject);
    procedure ToolButton_SaveToVisioClick(Sender: TObject);
    procedure ToolButton_SaveToSVGClick(Sender: TObject);
    procedure MenuItem_OptionClick(Sender: TObject);
    procedure MenuItem_HomePageClick(Sender: TObject);
    procedure MenuItem_AboutClick(Sender: TObject);
    procedure Copyselectedcode1Click(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure ToolButton_RunWithWindowClick(Sender: TObject);
    procedure PopMenu_tkinterwindowClick(Sender: TObject);
    procedure TreeViewCollapsed(Sender: TObject; Node: TTreeNode);
    procedure TreeViewExpanded(Sender: TObject; Node: TTreeNode);
    procedure MenuItem_EditClick(Sender: TObject);
    procedure ToolButton_TkinterWindowClick(Sender: TObject);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState;
      var Accept: Boolean);
    procedure TreeViewStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
     private
          iMoveX         : Integer;
          iMoveY         : Integer;
          SelectRect     : TRect;            //标志当前流程图中选择的区域(灰色)
          SelectRectNode : TTreeNode;        //SelectRect对应的节点
          bIsCreating    : Boolean;          //标志是否正在生成树的,用于控制节点转换时是否绘制流程图
          bClose         : Boolean;
          bDelete        : Boolean;
          gjoCopySource  : TJsonObject;      //复制为nil，剪切时为源节点
          gtnCurNode     : TTreeNode;        //鼠标按下时的树节点，用于右键选中
          //
          gsDragSrcText  : string;           //待复制/剪切节点的Text
          gsDragSrcMode  : string;           //待复制/剪切节点的类型
          //
          gtnDragSource  : TTreeNode;        //开始拖动时的源节点
          gjoCopy        : TJsonObject;
     public

          //
          function  GetNodeFromPos(mX,mY:Integer):TTreeNode;  //根据鼠标位置得到节点
          procedure UpdateChart;        //用于流程图刷新后重绘流程图
          //
          procedure AddModule(Sender: TObject);
          procedure OnPropertyChange(Sender:TObject);
     end;

var
     MainForm       : TMainForm;
     //
     gsMainDir      : string;      //主程序目录

     //用于在浏览中切换到以前查看来的节点
     gbAutoChange   : Boolean=False;
     giNodeChange   : Integer;


     //




implementation

uses  About;


{$R *.dfm}

function  teModuleNameToImageIndex(AName:string):Integer;
const
     miiFile        = 1;
     miiFunction    = 2;
     miiBlock       = 3;
     miiCode        = 4;
     miiSet         = 5;
     miiIf          = 6;
     miiTrue        = 7;
     miiElif        = 8;
     miiElse        = 9;
     miiFor         = 10;
     miiWhile       = 11;
     miiBreak       = 12;
     miiContinue    = 13;
     miiTry         = 14;
     miiExcept      = 15;
     miiClass       = 16;
     miiTk_Window   = 20;
     miiTk_Label    = 21;
     miiTk_Button   = 22;
     miiTk_Entry    = 23;
     miiTk_Check    = 24;
     miiTk_Radio    = 25;
     miiTk_Listbox  = 26;
     miiTk_Text     = 27;
     miiTk_Scale    = 28;
begin
     Result    := 0;
     if AName = 'file' then begin
          Result    := miiFile;
     end else if AName = 'function' then begin
          Result    := miiFunction;
     end else if AName = 'set' then begin
          Result    := miiSet;
     end else if AName = 'if' then begin
          Result    := miiIf;
     end else if AName = 'elif' then begin
          Result    := miiElif;
     end else if AName = 'if_yes' then begin
          Result    := miiTrue;
     end else if AName = 'if_else' then begin
          Result    := miiElse;
     end else if AName = 'code' then begin
          Result    := miiCode;
     end else if AName = 'for' then begin
          Result    := miiFor;
     end else if AName = 'while' then begin
          Result    := miiWhile;
     end else if AName = 'try' then begin
          Result    := miiTry;
     end else if AName = 'try_except' then begin
          Result    := miiExcept;
     end else if AName = 'try_else' then begin
          Result    := miiElse;
     end else if AName = 'try_body' then begin
          Result    := miiBlock;
     end else if AName = 'block' then begin
          Result    := miiBlock;
     end else if AName = 'break' then begin
          Result    := miiBreak;
     end else if AName = 'continue' then begin
          Result    := miiContinue;
     end else if AName = 'class' then begin
          Result    := miiClass;
     end else if AName = 'tk_window' then begin
          Result    := miiTk_Window;
     end else if AName = 'tk_label' then begin
          Result    := miiTk_Label;
     end else if AName = 'tk_button' then begin
          Result    := miiTk_Button;
     end else if AName = 'tk_entry' then begin
          Result    := miiTk_Entry;
     end else if AName = 'tk_check' then begin
          Result    := miiTk_Check;
     end else if AName = 'tk_radio' then begin
          Result    := miiTk_Radio;
     end else if AName = 'tk_listbox' then begin
          Result    := miiTk_Listbox;
     end else if AName = 'tk_text' then begin
          Result    := miiTk_Text;
     end else if AName = 'tk_scale' then begin
          Result    := miiTk_Scale;
     end;
end;


procedure TMainForm.PopMenu_DeleteClick(Sender: TObject);
var
     //
     joNode    : TJsonObject;
     joModule  : TJsonObject;
     joParent  : TJsonObject;
     //
     tnNode    : TTreeNode;
     tnPar     : TTreeNode;
begin
     //得到相应的树节点
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          ShowMessage('Please selected a node at first!');
          Exit;
     end;
     joNode    := teTreeToJson(tnNode);

     //<异常检查
     //检查节点不能为nil
     if joNode=nil then begin
          ShowMessage('Please selected a node at first!');
          Exit;
     end;

     //不允许删除根节点
     if tnNode.Level = 0 then begin
          ShowMessage('Cannot delete the root node!');
          Exit;
     end;

     //不允许删除一些特定节点
     joModule  := teFindModule(joNode.S['_m_']);

     if teInNames(joModule.S['mode'],['only child','as fixed child','as optional child']) then begin
          ShowMessage('Cannot delete the neccessary node!');
          Exit;
     end;
     //>


     //确认删除
     if MessageDlg(#13+'Are you really want to delete the node named "' +tnNode.Text+'" ?'+#13,
               mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
     begin
          Exit;
     end;

     //删除json节点
     joParent  := teTreeToJson(tnNode.Parent);
     joParent.A['items'].Delete(tnNode.Index);

     //删除树节点， 并设其父节点为当前节点
     tnPar     := tnNode.Parent;
     tnPar.Selected   := True;
     tnNode.Destroy;

     //
     Memo_Code.Text   := JsonToPython(gjoProject);

     //设置已修改标识
     gbModified     := True;
end;



procedure TMainForm.FormCreate(Sender: TObject);
var
     iPage     : Integer;
     iItem     : Integer;
     //
     oPopItem  : TMenuItem;
     //
     joModule  : TJsonObject;
     joProperty: TJsonObject;
begin
     //得到程序运行目录
     gsMainDir := ExtractFilePath(Application.ExeName);


     //生成菜单项 Load modules json for popmenu of treeview
     gjoModules     := TJsonObject.Create;
     gjoModules.LoadFromFile(gsMainDir+'modules.json');
     for iItem := 0 to gjoModules.A['items'].Count-1 do begin
          joModule  := gjoModules.A['items'][iItem];
          //
          oPopItem  := TMenuItem.Create(PopupMenu_TreeView);
          PopupMenu_TreeView.Items.Add(oPopItem);
          oPopItem.MenuIndex       := iItem;
          oPopItem.AutoHotkeys     := maManual;
          oPopItem.Caption         := joModule.S['_m_'];
          if  joModule.S['_m_']<>'-' then begin
               oPopItem.OnClick         := AddModule;
          end;

          //
          //
          oPopItem  := TMenuItem.Create(PopupMenu_TreeView);
          MenuItem_Edit.Add(oPopItem);
          oPopItem.MenuIndex       := iItem;
          oPopItem.AutoHotkeys     := maManual;
          oPopItem.Caption         := joModule.S['_m_'];
          if  joModule.S['_m_']<>'-' then begin
               oPopItem.OnClick         := AddModule;
          end;
     end;

     //生成工程JSON
     gjoProject     := TJsonObject.Create;
     gjoProject.S['_m_']     := 'root';
     gjoProject.A['items']    := TJsonArray.Create;

     //初始化树
     TreeView.Items[0].ImageIndex       := teModuleNameToImageIndex('file');
     TreeView.Items[0].SelectedIndex    := TreeView.Items[0].ImageIndex
end;



procedure TMainForm.PopMenu_CopyClick(Sender: TObject);
var
     joNode    : TJsonObject;
begin
     if TreeView.Selected = nil then begin
          ShowMessage('Please selected a node at first!');
          Exit;
     end;

     joNode    := teTreeToJson(TreeView.Selected);

     //
     if joNode=nil then begin
          ShowMessage('Please selected a node at first!');
          Exit;
     end;


     //将源节点保存到XML中
     gjoCopy   := TJsonObject.Create;
     gjoCopy.FromJSON(joNode.ToString);

     //
     gjoCopySource  := joNode;

     //
     PopMenu_Paste.Enabled    := gjoCopy<>nil;


end;

procedure TMainForm.PopMenu_PasteClick(Sender: TObject);
var
     //
     tnNode    : TTreeNode;
     tnNew     : TTreeNode;
     //
     iIndex    : Integer;
     //
     joNode    : TJsonObject;
     joNew     : TJsonObject;
     joParent  : TJsonObject;
     //
     oAddMode  : TTEAddMode;
begin
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     joNode    := teTreeToJson(tnNode);

     //得到当前节点的Index
     iIndex    := tnNode.Index;


     //
     TreeView.Items.BeginUpdate;
     bIsCreating    := True;
     oAddMode  := teGetAddMode(gjoCopy.S['_m_'],joNode.S['_m_']);
     case oAddMode of
          amNone : begin
               ShowMessage('Cannot paste node here!');
          end;
          amNextSibling : begin    //追加模式
               joParent  := teTreeToJson(tnNode.Parent);
               joNew     := joParent.A['items'].InsertObject(tnNode.Index+1);
               joNew.FromJSON(gjoCopy.ToString);
               //
               tnNew     := TreeView.Items.AddChild(tnNode.Parent,joNew.S['caption']);
               tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
               tnNew.SelectedIndex := tnNew.ImageIndex;
               tnNew.Selected      := True;
               //调整位置
               if tnNode.Index <> tnNode.Parent.Count-1 then begin
                    tnNew.MoveTo(tnNode.Parent.Item[tnNode.Index+1],naInsert);
               end;
               //
               teAddChild(tnNew,joNew);
               //
               teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
          end;
          amOptionalSibling : begin
               //
               if tnNode.Index = 0 then begin
                    joParent  := teTreeToJson(tnNode.Parent);
                    joNew     := joParent.A['items'].InsertObject(1);
                    joNew.FromJSON(gjoCopy.ToString);
                    //
                    tnNew     := TreeView.Items.AddChild(tnNode.Parent,joNew.S['caption']);
                    tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                    tnNew.SelectedIndex := tnNew.ImageIndex;
                    tnNew.Selected      := True;
                    //
                    tnNew.MoveTo(tnNode.Parent.Item[tnNode.Index+1],naInsert);
               end else begin
                    joParent  := teTreeToJson(tnNode.Parent);
                    joNew     := joParent.A['items'].InsertObject(tnNode.Index);
                    joNew.FromJSON(gjoCopy.ToString);
                    //
                    tnNew     := TreeView.Items.AddChild(tnNode.Parent,joNew.S['caption']);
                    tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                    tnNew.SelectedIndex := tnNew.ImageIndex;
                    tnNew.Selected      := True;
                    //调整位置
                    tnNew.MoveTo(tnNode,naInsert);
               end;
               //
               teAddChild(tnNew,joNew);
               //
               teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
          end;
          amLastChild : begin
               joNew     := joNode.A['items'].AddObject;
               joNew.FromJSON(gjoCopy.ToString);
               //
               tnNew     := TreeView.Items.AddChild(tnNode,joNew.S['caption']);
               tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
               tnNew.SelectedIndex := tnNew.ImageIndex;
               tnNew.Selected      := True;
               //
               teAddChild(tnNew,joNew);
               //
               teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
          end;
          amPrevLastChild : begin
               joNew     := joNode.A['items'].AddObject;
               joNew.FromJSON(gjoCopy.ToString);
               //
               tnNew     := TreeView.Items.AddChild(tnNode,joNew.S['caption']);
               tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
               tnNew.SelectedIndex := tnNew.ImageIndex;
               tnNew.Selected      := True;
               //调整位置
               tnNew.MoveTo(tnNode.Item[tnNode.Count-1],naInsert);
               //
               teAddChild(tnNew,joNew);
               //
               teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
          end;
     end;
     TreeView.Items.EndUpdate;
     bIsCreating    := False;

     //
     Memo_Code.Text   := JsonToPython(gjoProject);

     //设置已修改标识
     gbModified     := True;
end;

procedure TMainForm.MenuItem_ExpandAllClick(Sender: TObject);
begin
     if TreeView.Items.Count>0 then begin
          TreeView.Items.BeginUpdate;
          TreeView.Items[0].Expand(True);
          TreeView.Items.EndUpdate;
     end;
end;

procedure TMainForm.MenuItem_CloseAllClick(Sender: TObject);
begin
     if TreeView.Items.Count>0 then begin
          TreeView.Items.BeginUpdate;
          TreeView.Items[0].Collapse(True);
          TreeView.Items[0].Expand(False);
          TreeView.Items.EndUpdate;
     end;
end;

procedure TMainForm.MenuItem_ExpandSelClick(Sender: TObject);
begin
     if TreeView.Selected<>nil then begin
          TreeView.Items.BeginUpdate;
          TreeView.Selected.Expand(True);
          TreeView.Items.EndUpdate;
     end;
end;

procedure TMainForm.ToolButton_GenerateCodeClick(Sender: TObject);
var
     oNode     : TTreeNode;
     oOldNode  : TTreeNode;
     slCode    : TStringList;
     //
     sFileName : string;
     sCaption  : string;
     sStart    : string;
     sEnd      : string;
     sLn       : string;
     I,J       : Integer;
     iBeg,iEnd : Integer;
     iTime     : Integer;
begin
     //
     DeleteFile(gsMainDir+'python\output.ap');

     //生成代码
     grOption.AddCaption := grConfig.AddCaption;
     grOption.AddComment := grConfig.AddComment;
     grOption.Indent     := grConfig.Indent;
     Memo_Code.Text    := JsonToPython(gjoProject);

     //
     Memo_Code.Lines.SaveToFile(gsMainDir+'python\_temp_.py',TEncoding.UTF8);

     //
     ChDir(gsMainDir+'python\');
     WinExecAndWait32('auto.bat',0);

     //
     Memo_Messages.Lines.Clear;
     for iTime := 0 to 29 do begin
          if FileExists(gsMainDir+'python\output.ap') then begin
               Memo_Messages.Lines.LoadFromFile(gsMainDir+'python\output.ap');
               Memo_Messages.Lines.Insert(0,FormatDateTime('yyyy-MM-dd hh:mm:ss zzz',Now)+ ' Compile ...');
               Memo_Messages.Lines.Insert(1,'');
               Break;
          end else begin
               Sleep(10);
          end;
     end;


end;


procedure TMainForm.PopupMenu_TreeViewPopup(Sender: TObject);
var
     iModule   : Integer;
     //
     sName     : string;
     //
     tnNode    : TTreeNode;
     //
     joNode    : TJsonObject;
     joModule  : TJsonObject;
     joSelMdl  : TJsonObject; //current node -> module
     jaAlwSib  : TJsonArray;  //allow sibling
     jaAlwChd  : TJsonArray;  //allow child
begin

     //get selected treenode
     if TreeView.Selected = nil then begin
          TreeView.Items[0].Selected    := True;
     end;
     tnNode    := TreeView.Selected ;

     //get current project jsonnode
     joNode    := teTreeToJson(tnNode);
     if joNode = nil then begin
          Exit;
     end;
     sName     := joNode.S['_m_'];
     joSelMdl  := teFindModule(sName);
     jaAlwSib  := joSelMdl.A['allowsibling'];
     jaAlwChd  := joSelMdl.A['allowchild'];

     //Dynamic hide/view the module menuitem 动态菜单处理
     for iModule := 0 to gjoModules.A['items'].Count-1 do begin
          joModule  := gjoModules.A['items'][iModule];
          PopupMenu_TreeView.Items[iModule].Visible    :=
               (teInModules(joModule.S['_m_'],jaAlwSib)) or (teInModules(joModule.S['_m_'],jaAlwChd));
     end;

end;


procedure TMainForm.TreeViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
     tnNode    : TTreeNode;
begin
     //右键直接选择节点
     tnNode     := TreeView.GetNodeAt(X, Y);
     if tnNode<>nil then begin
          tnNode.Selected := True;
     end;
end;

procedure TMainForm.MenuItem_EditClick(Sender: TObject);
var
     iModule   : Integer;
     //
     sName     : string;
     //
     tnNode    : TTreeNode;
     //
     joNode    : TJsonObject;
     joModule  : TJsonObject;
     joSelMdl  : TJsonObject; //current node -> module
     jaAlwSib  : TJsonArray;  //allow sibling
     jaAlwChd  : TJsonArray;  //allow child
begin

     //get selected treenode
     if TreeView.Selected = nil then begin
          TreeView.Items[0].Selected    := True;
     end;
     tnNode    := TreeView.Selected ;

     //get current project jsonnode
     joNode    := teTreeToJson(tnNode);
     if joNode = nil then begin
          Exit;
     end;
     sName     := joNode.S['_m_'];
     joSelMdl  := teFindModule(sName);
     jaAlwSib  := joSelMdl.A['allowsibling'];
     jaAlwChd  := joSelMdl.A['allowchild'];

     //Dynamic hide/view the module menuitem 动态菜单处理
     for iModule := 0 to gjoModules.A['items'].Count-1 do begin
          joModule  := gjoModules.A['items'][iModule];
          MenuItem_Edit.Items[iModule].Visible    :=
               (teInModules(joModule.S['_m_'],jaAlwSib)) or (teInModules(joModule.S['_m_'],jaAlwChd));
     end;
end;

procedure TMainForm.MenuItem_ExitClick(Sender: TObject);
begin
     Close;
end;
procedure TMainForm.ToolButton_TkinterWindowClick(Sender: TObject);
var
     tnNode    : TTreeNode;
     joNode    : TJsonObject;
begin
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     joNode    := teTreeToJson(tnNode);

     //
     if joNode.S['_m_'] <> 'tk_window' then begin
          joNode    := teTreeToJson(tnNode.Parent);
     end;
     //Form_TkinterEditor.gjoWindow  := TJsonObject.Create;
     //Form_TkinterEditor.gjoWindow.FromUtf8JSON(joNode.ToUtf8JSON);
     //Form_TkinterEditor.ShowModal;
end;

procedure TMainForm.ToolButton_ExpandClick(Sender: TObject);
begin
     if TreeView.Selected<>nil then begin
          TreeView.Items.BeginUpdate;
          TreeView.Selected.Expand(True);
          TreeView.Selected.MakeVisible;
          TreeView.Items.EndUpdate;
          //
          UpdateChart;
          //TreeView.OnClick(Self);
     end;
end;

procedure TMainForm.ToolButton_CollapseClick(Sender: TObject);
begin
     if TreeView.Selected<>nil then begin
          TreeView.Selected.Collapse(True);
          //
          UpdateChart;
          //TreeView.OnClick(Self);
     end;

end;

procedure TMainForm.ToolButton_UpClick(Sender: TObject);
begin
     teMoveTreeNodeUp(TreeView.Selected);
     //
     teSetUpDownEnable(TreeView.Selected,ToolButton_Down,ToolButton_Up);
     //
     Memo_Code.Text   := JsonToPython(gjoProject);
end;

procedure TMainForm.ToolButton_DownClick(Sender: TObject);
begin
     //
     teMoveTreeNodeDown(TreeView.Selected);
     //
     teSetUpDownEnable(TreeView.Selected,ToolButton_Down,ToolButton_Up);
     //
     Memo_Code.Text   := JsonToPython(gjoProject);
end;



procedure TMainForm.ToolButton_SaveClick(Sender: TObject);
var
     tnNode    : TTreeNode;
     joNode    : TJsonObject;
begin
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     joNode    := teTreeToJson(tnNode);
     //
     teSaveNodeProperty(joNode,Panel_LeftBottom);

     //
     if gsProjectName = '' then begin
          if SaveDialog.Execute then begin
               gsProjectName  := SaveDialog.FileName;
               gjoProject.SaveToFile(SaveDialog.FileName,False);
               gsProjectName  := SaveDialog.FileName;
               //设置为未修改状态
               gbModified     := False;
          end ;
     end else begin
          gjoProject.SaveToFile(gsProjectName,False);
          //设置为未修改状态
          gbModified     := False;
     end;
end;

procedure TMainForm.ToolButton_OpenClick(Sender: TObject);
var
     iRes      : Integer;
begin
     //退出时如果当前文档已修改，则提示是否保存/取消退出
     if gbModified then begin
          iRes := MessageDlg('The file has been modified, do you save it ?',mtConfirmation,[mbYes,mbNO,mbCancel],0);
          Case iRes of
               mrYes : begin
                    ToolButton_Save.OnClick(Self);
               end;
               mrCancel : begin
                    Exit;
               end;
          end;
     end;

     if OpenDialog.Execute then begin
          gjoProject     := TJsonObject.Create;
          gjoProject.LoadFromFile(OpenDialog.FileName);
          //
          gsProjectName  := OpenDialog.FileName;

          //根据XML创建树
          bIsCreating    := True;
          teJsonToTree(TreeView);
          bIsCreating    := False;
          //
          TreeView.Items[0].Expand(False);
          TreeView.Items[0].Selected    := True;

          //一些必要的工作
          gjoCopySource  := nil;   //清空

          //
          Memo_Code.Text   := JsonToPython(gjoProject);

          //设置为未修改状态
          gbModified     := False;
     end;
end;

procedure TMainForm.ImageDblClick(Sender: TObject);
var
     tnCur     : TTreeNode;
begin
     //得到树节点
     tnCur    := GetNodeFromPos(iMoveX,iMoveY);

     //如果没找到树节点,则退出
     if tnCur=nil then begin
          Exit;
     end;

     //更改开合状态
     if tnCur.Count>0 then begin
          tnCur.Expanded := not tnCur.Expanded;
     end else begin
          if tnCur<>TreeView.Selected then begin
               tnCur.Parent.Expanded    := False;
               tnCur     := tnCur.Parent;
          end;
     end;


     //
     UpdateChart;

     //更新当前选择的树节点
     //tnCur.Selected := True;

end;

procedure TMainForm.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
     L,T,W,H,E : Single;
     tnCur     : TTreeNode;
begin

     //记录下位置,以用于移动
     iMoveX  := X;
     iMoveY  := Y;


end;

procedure TMainForm.ImageMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
     if iMoveX<>-1 then begin
          if iMoveX<>-9999 then begin
               ScrollBox.ScrollBy(X-iMoveX,Y-iMoveY);
          end;
          iMoveX  := X;
          iMoveY  := Y;
     end;

end;

function TMainForm.GetNodeFromPos(mX, mY: Integer): TTreeNode;
var
     tnNode    : TTreeNode;
     I         : Integer;
     L,T,W,H,E : Integer;
     joNode    : TJsonObject;
     bFound    : Boolean;
begin
     //默认返回值
     Result    := nil;
     //
     tnNode    := TreeView.Items[0];
     while True do begin
          //查找到
          if (tnNode.Count=0)or(not tnNode.Expanded) then begin
               Result    := tnNode;
               Break;
          end;

          //
          bFound    := False;
          for I:=0 to tnNode.Count-1 do begin
               joNode    := teTreeToJson(tnNode.Item[I]);
               L    := joNode.I['X'];
               T    := joNode.I['Y'];
               W    := joNode.I['W'];
               H    := joNode.I['H'];
               E    := joNode.I['E'];
               //
               L    := L-E-Round(grConfig.BaseWidth*grConfig.Scale);
               W    := W+E;

               //判断是否在当前节点内
               if (mX>=L)and(mX<=L+W)and(mY>=T)and(mY<=T+H) then begin
                    tnNode    := tnNode.Item[I];
                    Result    := tnNode;
                    bFound    := True;
                    Break;
               end;
          end;

          //如果没发现,则返回nil
          if not bFound then begin
               Break;
          end;
     end;
end;





procedure TMainForm.PopMenu_SetRootClick(Sender: TObject);
var
     tnCur     : TTreeNode;
     xnCur     : TJsonObject;
     bDefault  : Boolean;      
     tnNode    : TTreeNode;
     joNode    : TJsonObject;
begin
{     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     joNode    := GetXMLNodeFromTreeNode(gxdXML,TreeView.Selected);
     if joNode<>nil then begin
          xnCur          := joNode;    //GetXMLNodeFromTreeNode(gxdXML,gtnCurNode);
          gxnRootNode    := xnCur;
          joNode        := xnCur;
          //
          UpdateChart;
          //TreeView.OnClick(Self);
          //TreeView.OnCustomDrawItem(nil,tnCur,[],bDefault);
          TreeView.Refresh;
     end;
}
end;

procedure TMainForm.PopMenu_tkinterwindowClick(Sender: TObject);
var
     tnNode    : TTreeNode;
     tnPar     : TTreeNode;
     tnNew     : TTreeNode;
     //
     joNode    : TJsonObject;      //当前节点
     joParent  : TJsonObject;      //拟新增节点的父节点
     joNew     : TJsonObject;      //新增节点
     oAddMode  : TTEAddMode;
     joTkinter : TJsonObject;
begin
{     //
     if Form_TkinterWindow.ShowModal = mrOK then begin
          //得到当前节点
          tnNode    := TreeView.Selected;
          if tnNode=nil then begin
               Exit;
          end;
          joNode    := teTreeToJson(tnNode);

          //
          oAddMode  := teGetAddMode('code',joNode.S['_m_']);

          //
          case oAddMode of
               amNone : begin
                    ShowMessage('Cannot create node here!');
               end;
               amNextSibling : begin    //追加模式
                    joParent  := teTreeToJson(tnNode.Parent);
                    joNew     := joParent.A['items'].InsertObject(tnNode.Index+1);
                    joNew.FromJSON(gjoCopy.ToString);
                    //
                    tnNew     := TreeView.Items.AddChild(tnNode.Parent,joNew.S['caption']);
                    tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                    tnNew.SelectedIndex := tnNew.ImageIndex;
                    tnNew.Selected      := True;
                    //调整位置
                    if tnNode.Index <> tnNode.Parent.Count-1 then begin
                         tnNew.MoveTo(tnNode.Parent.Item[tnNode.Index+1],naInsert);
                    end;
                    //
                    teAddChild(TreeView,tnNew,joNew);
                    //
                    teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
               end;
               amOptionalSibling : begin
                    //
                    if tnNode.Index = 0 then begin
                         joParent  := teTreeToJson(tnNode.Parent);
                         joNew     := joParent.A['items'].InsertObject(1);
                         joNew.FromJSON(gjoCopy.ToString);
                         //
                         tnNew     := TreeView.Items.AddChild(tnNode.Parent,joNew.S['caption']);
                         tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                         tnNew.SelectedIndex := tnNew.ImageIndex;
                         tnNew.Selected      := True;
                         //
                         tnNew.MoveTo(tnNode.Parent.Item[tnNode.Index+1],naInsert);
                    end else begin
                         joParent  := teTreeToJson(tnNode.Parent);
                         joNew     := joParent.A['items'].InsertObject(tnNode.Index);
                         joNew.FromJSON(gjoCopy.ToString);
                         //
                         tnNew     := TreeView.Items.AddChild(tnNode.Parent,joNew.S['caption']);
                         tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                         tnNew.SelectedIndex := tnNew.ImageIndex;
                         tnNew.Selected      := True;
                         //调整位置
                         tnNew.MoveTo(tnNode,naInsert);
                    end;
                    //
                    teAddChild(TreeView,tnNew,joNew);
                    //
                    teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
               end;
               amLastChild : begin
                    joNew     := joNode.A['items'].AddObject;
                    joNew.FromJSON(gjoCopy.ToString);
                    //
                    tnNew     := TreeView.Items.AddChild(tnNode,joNew.S['caption']);
                    tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                    tnNew.SelectedIndex := tnNew.ImageIndex;
                    tnNew.Selected      := True;
                    //
                    teAddChild(TreeView,tnNew,joNew);
                    //
                    teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
               end;
               amPrevLastChild : begin
                    joNew     := joNode.A['items'].AddObject;
                    joNew.FromJSON(gjoCopy.ToString);
                    //
                    tnNew     := TreeView.Items.AddChild(tnNode,joNew.S['caption']);
                    tnNew.ImageIndex    := teModuleNameToImageIndex(gjoCopy.S['_m_']);
                    tnNew.SelectedIndex := tnNew.ImageIndex;
                    tnNew.Selected      := True;
                    //调整位置
                    tnNew.MoveTo(tnNode.Item[tnNode.Count-1],naInsert);
                    //
                    teAddChild(TreeView,tnNew,joNew);
                    //
                    teSetUpDownEnable(tnNew,ToolButton_Down,ToolButton_Up);
               end;
          end;


          //根据当前节点类型确定父节点
          if InModes(joNode.Attributes['Mode'],gForceChildSet) then begin
               xnPar     := joNode;
               tnPar     := tnNode;
          end else begin
               xnPar     := joNode.ParentNode;
               tnPar     := tnNode.Parent;
          end;

          //<新增XML节点
          //CODE
          joNew     := xnPar.AddChild('CODE');
          joNew.Attributes['Mode']      := rtBlock_Code;
          joNew.Attributes['Caption']   := '';
          joNew.Attributes['Source']    := Form_TkinterWindow.PythonCode;
          joNew.Attributes['Comment']   := '';
          joNew.Attributes['Enabled']   := True;
          //>

          //设置上移下称可用性
          ToolButton_Down.Enabled  := joNew.NextSibling<>nil;
          ToolButton_Up.Enabled    := joNew.PreviousSibling<>nil;

          //<新增树节点
          //CODE
          tnNew     := TreeView.Items.AddChild(tnPar,'tkineter window');
          tnNew.ImageIndex    := ModeToImageIndex(rtBlock_Code);
          tnNew.SelectedIndex := tnNew.ImageIndex;
          tnNew.MakeVisible;

          //>

          //显示新增树节点的属性
          tnNew.Selected := True;
          //ShowNodeAttributes(joNew);
          //
          joNode   := joNew;
          //刷新流程图
          UpdateChart;
          //设置已修改标识
          gbModified     := True;

          //刷新显示
          TreeView.OnClick(TreeView);
     end;
}
end;

procedure TMainForm.UpdateChart;
var
     tnRoot    : TTreeNode;
     L,T,E,W,H : Integer;
     bPar      : Boolean;
     xnTmp     : TJsonObject;
     tnCur     : TTreeNode;

     tnNode    : TTreeNode;
     joNode    : TJsonObject;
begin

     //
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     joNode    := teTreeToJson(tnNode);

     //
     if gjoChartRoot=nil then begin
          gjoChartRoot   := gjoProject;
     end;

     //得到相应树节点
     tnRoot    := TreeView.Items[0];
     if tnRoot=nil then begin
          ShowMessage('Error when UpdateChart! ');
          Exit;
     end;

     //设置各XML节点的Expanded属性
     SetNodeStatus(tnRoot);

     //重绘流程图
     JsonToFlowChart(gjoChartRoot,Image,grConfig);

     //如果当前无节点或当前节点为流程图根节点，则退出
     if ( joNode = nil ) or ( gjoChartRoot = joNode) then begin
          Exit;
     end;

     //如果当前节点不是流程图根节点的子孙节点，则退出
//     xnTmp     := joNode;
//     bPar      := False;
//     while xnTmp<>nil do begin
//          if xnTmp=gjoChartRoot then begin
//               bPar := True;
//               Break;
//          end else begin
//               xnTmp     := xnTmp.ParentNode;
//          end;
//     end;
//     if not bPar then begin
//          Exit;
//     end;



     //<绘制当前节点图
     //
     L    := joNode.I['X'];
     T    := joNode.I['Y'];
     W    := joNode.I['W'];
     H    := joNode.I['H'];
     E    := joNode.I['E'];

     //得到区域信息
     L    := Round(L-E-grConfig.BaseWidth*grConfig.Scale);
     W    := W+E;

     //绘制
     SelectRect.Left     := Round(L-grConfig.SpaceHorz*grConfig.Scale/2);
     SelectRect.Top      := Round(T-grConfig.SpaceVert*grConfig.Scale/2);
     SelectRect.Right    := Round(L+W+grConfig.SpaceHorz*grConfig.Scale/2);
     SelectRect.Bottom   := Round(T+H-grConfig.SpaceVert*grConfig.Scale/2);

     with Image.Canvas do begin
          Brush.Style    := bsSolid;
          Brush.Color    := clWhite-grConfig.SelectColor;// clWhite-Color_Selected;
          Pen.Color      := clWhite-grConfig.SelectColor;//clWhite-Color_Selected;
          Pen.Mode       := pmXor;
          Rectangle(SelectRect.Left,SelectRect.Top ,SelectRect.Right ,SelectRect.Bottom);
     end;
     //>

end;


procedure TMainForm.TreeViewMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
     tnNode    : TTreeNode;
     rConfig   : TWWConfig;
     joNode    : TJsonObject;
begin
     Exit;
{
     //
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     joNode    := GetXMLNodeFromTreeNode(gxdXML,TreeView.Selected);
     try
          tnNode    := TreeView.Selected;
          if tnNode= nil then Exit;

          //得到XML节点
          joNode   := GetXMLNodeFromTreeNode(gxdXML,tnNode);

          //检测
          if joNode=nil then begin
               ShowMessage('Error because GetXMLNodeFromTreeNode return nil when TreeViewChange');
               Exit;
          end;

          //根据树节点，设置XML节点的开合状态
          SetNodeStatus(tnNode,joNode);

          //清除记忆的老选择数据
          SelectRect.Left     := -1;

          //
          //ShowNodeAttributes(joNode);

          //恢复位置
          Image.Top      := 10;
          Image.Left     := 10;

          //刷新流程图
          UpdateChart;
     except
     end;
}
end;

procedure TMainForm.TreeViewStartDrag(Sender: TObject; var DragObject: TDragObject);
begin
     gtnDragSource  := TreeView.Selected;
end;

procedure TMainForm.ToolButton_ZoomInClick(Sender: TObject);
begin
     //
     if grConfig.Scale<4/1.2 then begin
          grConfig.Scale := grConfig.Scale * 1.2;
          //
          UpdateChart;
     end;
end;

procedure TMainForm.ToolButton_ZoomOutClick(Sender: TObject);
begin
     //
     if grConfig.Scale>0.24 then begin
          grConfig.Scale := grConfig.Scale / 1.2;
     end;
     //
     UpdateChart;
end;

procedure TMainForm.ImageClick(Sender: TObject);
var
     tnCur     : TTreeNode;
     joNode    : TJsonObject;
begin

     //得到树节点
     tnCur    := GetNodeFromPos(iMoveX,iMoveY);

     //如果没找到树节点,则退出
     if tnCur=nil then begin
          joNode   := nil;

          //刷新显示
          UpdateChart;

     end else begin
          //
          tnCur.Selected := True;

          //得到XML节点
          joNode   := teTreeToJson(tnCur);

          //显示当前树节点信息
          //teShowNodeProperty(joNode,TreeView,Panel_LeftBottom);

          //刷新显示
          UpdateChart;

     end;
end;

procedure TMainForm.ToolButton_NewProjectClick(Sender: TObject);
var
     iRes      : Integer;
begin
     if gbModified then begin
          iRes := MessageDlg('The file has been modified, do you save it ?',mtConfirmation,[mbYes,mbNO,mbCancel],0);
          case iRes of
               mrYes : begin
                    ToolButton_Save.OnClick(Self);
               end;
               mrCancel : begin
                    Exit;
               end;
          end;
     end;

     //
     //
     gjoProject     := TJsonObject.Create;
     gjoProject.S['_m_']     := 'root';
     gjoProject.A['items']    := TJsonArray.Create;

     //
     TreeView.Items[0].DeleteChildren;
     TreeView.Items[0].Text   := '';

     //
     Memo_Code.Text   := '';

     //
     UpdateChart;

     //
     gsProjectName  := '';
     gbModified     := False;

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
     iRes : Integer;
begin
     //退出时如果当前文档已修改，则提示是否保存/取消退出
     if gbModified then begin
          iRes := MessageDlg('The file has been modified, do you save it ?',mtConfirmation,[mbYes,mbNO,mbCancel],0);
          Case iRes of
               mrYes : begin
                    ToolButton_Save.OnClick(Self);
               end;
               mrCancel : begin
                    CanClose  := False;
               end;
          end;
     end;

end;

procedure TMainForm.ToolButton_OptionClick(Sender: TObject);
begin
     Form_Options.ShowModal;
     //
     UpdateChart;
end;

procedure TMainForm.ToolButton_RunWithWindowClick(Sender: TObject);
var
     oNode     : TTreeNode;
     oOldNode  : TTreeNode;
     slCode    : TStringList;
     //
     sFileName : string;
     sCaption  : string;
     sStart    : string;
     sEnd      : string;
     sLn       : string;
     I,J       : Integer;
     iBeg,iEnd : Integer;
     iTime     : Integer;
begin

     //生成代码
     grOption.AddCaption := grConfig.AddCaption;
     grOption.AddComment := grConfig.AddComment;
     grOption.Indent     := grConfig.Indent;
     Memo_Code.Text      := JsonToPython(gjoProject);

     //
     Memo_Code.Lines.SaveToFile(gsMainDir+'python\_temp_.py',TEncoding.UTF8);

     //
     ChDir(gsMainDir+'python\');
     WinExecAndWait32('debug.bat',1);


end;

procedure TMainForm.ToolButton_ExportToFileClick(Sender: TObject);
var
     sRegName  : string;
     sRegCode  : string;
     I         : Integer;

begin

     //

     //
     if (TreeView.Items.Count=1) then begin
          ShowMessage('Can not export to file when only one node! ');
          Exit;
     end else begin
          if Trim(Memo_Code.Lines.Text)='' then begin
               ToolButton_GenerateCode.OnClick(Self);
          end;
     end;


     //
     if SaveDialog_ExportToFile.Execute then begin
          Memo_Code.Lines.SaveToFile(SaveDialog_ExportToFile.FileName);
     end;
end;

procedure TMainForm.ToolButton_SaveToBmpClick(Sender: TObject);
var
     sRegName  : string;
     sRegCode  : string;
     I         : Integer;

begin

     //
     if SavePictureDialog.Execute then begin
          Image.Picture.SaveToFile(SavePictureDialog.FileName);
     end;


end;

procedure TMainForm.ToolButton_SaveToWordClick(Sender: TObject);
var
     sRegName  : string;
     sRegCode  : string;
     I         : Integer;

begin

     //
     if SaveDialog_Word.Execute then begin
          MainForm.Update;
          Application.ProcessMessages;
          //Form_ExportWord.ExportToWord(gjoChartRoot,SaveDialog_Word.FileName,grConfig);
     end;
end;

procedure TMainForm.ToolButton_SaveToVisioClick(Sender: TObject);
var
     sRegName  : string;
     sRegCode  : string;
     I         : Integer;

begin

     if SaveVisioDialog.Execute then begin
          MainForm.Update;
          Application.ProcessMessages;
          //Form_ExportVisio.ExportToVisio(gjoChartRoot, SaveVisioDialog.FileName, grConfig);
     end;

end;

procedure TMainForm.ToolButton_SaveToSVGClick(Sender: TObject);
var
     sRegName  : string;
     sRegCode  : string;
     I         : Integer;

begin

     if SaveDialog_SVG.Execute then begin
          MainForm.Update;
          Application.ProcessMessages;
          //ExportFlowToSVG(gjoChartRoot,SaveDialog_SVG.FileName,grConfig);
     end;

end;

procedure TMainForm.MenuItem_OptionClick(Sender: TObject);
begin
     Form_Options.ShowModal;
     //
     UpdateChart;

end;

procedure TMainForm.OnPropertyChange(Sender: TObject);
var
     tnNode    : TTreeNode;
     joNode    : TJsonObject;
begin
     //
     tnNode    := TreeView.Selected;
     if tnNode = nil then begin
          Exit;
     end;
     //
     joNode    := teTreeToJson(tnNode);

     //
     if Sender.ClassType = TSpeedButton then begin
          if FontDialog.Execute then begin
               TSpeedButton(Sender).Font     := FontDialog.Font;
          end;
     end;

     //
     teSaveNodeProperty(joNode,Panel_LeftBottom);

     //
     tnNode.Text    := joNode.S['caption'];

     //
     Memo_Code.Lines.Text     := JsonToPython(gjoProject);
end;

procedure TMainForm.MenuItem_HomePageClick(Sender: TObject);
begin
     ShellExecute(Handle,'open',Pchar(gsHomePage),'','',SW_SHOWDEFAULT);

end;

procedure TMainForm.MenuItem_AboutClick(Sender: TObject);
begin
     Form_About.ShowModal;
end;

procedure TMainForm.AddModule(Sender: TObject);
var
     I         : Integer;
     tnNode    : TTreeNode;
     joNode    : TJsonObject;
begin
     //
     bIsCreating    := True;

     //新增节点
     teAddModule(TreeView.Selected,TMenuItem(Sender).MenuIndex);


     //
     Memo_Code.Text   := JsonToPython(gjoProject);
     //
     UpdateChart;
     //
     bIsCreating    := False;

     TreeView.OnChange(TreeView,TreeView.Selected);

end;


procedure TMainForm.Copyselectedcode1Click(Sender: TObject);
begin
     //
     clipboard.AsText    := Memo_Code.SelText;
end;



procedure TMainForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
var
     joNode    : TJsonObject;
     iProp     : Integer;
     joModule  : TJsonObject;
     joProp    : TJsonObject;
     oPanel    : TPanel;
     oControl  : TControl;
begin
     if bIsCreating then begin
          Exit;
     end;
     //
     teSetUpDownEnable(Node,ToolButton_Down,ToolButton_Up);

     //
     joNode    := teTreeToJson(Node);

     //显示详细信息
     teShowNodeProperty(joNode,Panel_LeftBottom);

     //增加信息控件的事件
     joModule  := teFindModule(joNode.S['_m_']);
     for iProp := 0 to joModule.A['property'].Count-1 do begin
          joProp    := joModule.A['property'][iProp];
          oControl  := TPanel(Panel_LeftBottom.Controls[iProp]).Controls[1];
          //
          if joProp.S['type'] = 'string' then begin
               TEdit(oControl).OnChange := OnPropertyChange;
          end else if joProp.S['type'] = 'memo' then begin
               TMemo(oControl).OnChange := OnPropertyChange
          end else if joProp.S['type'] = 'integer' then begin
               TSpinEdit(oControl).OnChange  := OnPropertyChange
          end else if joProp.S['type'] = 'source' then begin
               TMemo(oControl).OnChange   := OnPropertyChange
          end else if joProp.S['type'] = 'boolean' then begin
               TCheckBox(oControl).OnClick   := OnPropertyChange
          end else if joProp.S['type'] = 'list' then begin
               TComboBox(oControl).OnChange  := OnPropertyChange
          end else if joProp.S['type'] = 'color' then begin
               TColorBox(oControl).OnChange       := OnPropertyChange
          end else if joProp.S['type'] = 'font' then begin
               TSpeedButton(oControl).OnClick   := OnPropertyChange
          end else if joProp.S['type'] = 'float' then begin
               TFloatSpinEdit(oControl).OnChange  := OnPropertyChange
          end;
     end;



     //
     joNode    := teTreeToJson(Node);
     ToolButton_TkinterWindow.Enabled   := False;
     if Copy(joNode.S['_m_'],1,3) = 'tk_' then begin
          ToolButton_TkinterWindow.Enabled   := True;
     end;

     //
     UpdateChart;
end;

procedure TMainForm.TreeViewCollapsed(Sender: TObject; Node: TTreeNode);
begin
     if bIsCreating then begin
          Exit;
     end;
     //
     UpdateChart;
end;

procedure TMainForm.TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
var
     joSource  : TJsonObject;
     joDest    : TJsonObject;
     joParSrc  : TJsonObject;
     joParDest : TJsonObject;

     //
     sNameSrc  : string;
     sNameDest : string;
     //
     tnDest    : TTreeNode;
     tnTemp    : TTreeNode;

     //
     iIdSrc    : Integer;
     iIdDest   : Integer;

     //
     oAddMode  : TTEAddMode;
begin
     //
     tnDest    := Treeview.GetNodeAt( X, Y );
     if tnDest = nil then begin
          Exit;
     end;

     if joSource = gjoProject then begin
          Exit;
     end;


     //
     joSource  := teTreeToJson(gtnDragSource);
     joDest    := teTreeToJson(tnDest);
     iIdSrc    := gtnDragSource.Index;
     iIdDest   := tnDest.Index;
     joParSrc  := teTreeToJson(gtnDragSource.Parent);  //得到父节点备用
     if tnDest.Level > 0 then begin
          joParDest := teTreeToJson(tnDest.Parent);
     end else begin
          joParDest := nil
     end;

     if joDest = nil then begin
          Exit;
     end;

     //
     sNameSrc  := joSource.S['_m_'];
     sNameDest := joDest.S['_m_'];

     //检查父子关系（父节点不能拖动到子节点,也就是不能：gtnDragSource是tnDest的祖先）
     if tnDest.Level>gtnDragSource.Level then begin
          tnTemp    := tnDest;
          while tnTemp.Level >= gtnDragSource.Level do begin
               if tnTemp = gtnDragSource then begin
                    Exit;
               end else begin
                    tnTemp    := tnTemp.Parent;
               end;
          end;
     end;

     //
     oAddMode  := teGetAddMode(sNameSrc,sNameDest);
     //
     bIsCreating    := True;
     case oAddMode of
          amNone : begin

          end;
          amNextSibling : begin    //拖动到当前节点的后面
               if tnDest.getNextSibling<>nil then begin
                    //移动树节点
                    gtnDragSource.MoveTo(tnDest.getNextSibling,naInsert);

                    //创建新JSON节点
                    joParDest.A['items'].InsertObject(iIdDest+1).FromUtf8JSON(joSource.ToUtf8JSON);

                    //删除旧JSON节点
                    joParSrc.A['items'].Delete(iIdSrc);
               end else begin
                    //移动树节点
                    gtnDragSource.MoveTo(tnDest,naAdd);

                    //创建新JSON节点
                    joParDest.A['items'].AddObject.FromUtf8JSON(joSource.ToUtf8JSON);

                    //删除旧JSON节点
                    joParSrc.A['items'].Delete(iIdSrc);
               end;
          end;

          amOptionalSibling : begin     //作为当前的sibling, 如果当前节点为第一子固定节点, 则位置为下一个;如果当前为最后固定节点,则为倒数第二个
               if tnDest.Index = 0 then begin     //当前节点为第一子固定节点
                    //移动树节点
                    if tnDest.getNextSibling<>nil then begin
                         gtnDragSource.MoveTo(tnDest.getNextSibling,naInsert);
                    end else begin
                         gtnDragSource.MoveTo(tnDest,naAdd);
                    end;

                    //创建新JSON节点
                    joParDest.A['items'].InsertObject(1).FromUtf8JSON(joSource.ToUtf8JSON);

                    //删除旧JSON节点
                    joParSrc.A['items'].Delete(iIdSrc);
               end else begin      //当前为最后固定节点
                    //移动树节点
                    gtnDragSource.MoveTo(tnDest,naInsert);

                    //创建新JSON节点
                    joParDest.A['items'].InsertObject(iIdDest).FromUtf8JSON(joSource.ToUtf8JSON);

                    //删除旧JSON节点
                    joParSrc.A['items'].Delete(iIdSrc);
               end;
          end;
          amLastChild : begin
               //移动树节点
               gtnDragSource.MoveTo(tnDest,naAddChild);

               //创建新JSON节点
               joDest.A['items'].AddObject.FromUtf8JSON(joSource.ToUtf8JSON);

               //删除旧JSON节点
               joParSrc.A['items'].Delete(iIdSrc);
          end;
          amPrevLastChild : begin
               //移动树节点
               gtnDragSource.MoveTo(tnDest.GetLastChild,naInsert);

               //创建新JSON节点
               joDest.A['items'].InsertObject(tnDest.Count-2).FromUtf8JSON(joSource.ToUtf8JSON);

               //删除旧JSON节点
               joParSrc.A['items'].Delete(iIdSrc);
          end;
     end;
     //
     bIsCreating    := False;
     //
     gtnDragSource.Selected   := True;
     Memo_Code.Lines.Text := gjoProject.ToJSON(False);
end;

procedure TMainForm.TreeViewDragOver(Sender, Source: TObject; X, Y: Integer; State: TDragState; var Accept: Boolean);
var
     joSource  : TJsonObject;
     joDest    : TJsonObject;
     //
     sNameSrc  : string;
     sNameDest : string;
     //
     tnDest    : TTreeNode;
     tnTemp    : TTreeNode;
begin
     //
     tnDest    := Treeview.GetNodeAt( X, Y );
     if tnDest = nil then begin
          Accept    := False;
          Exit;
     end;
     if joSource = gjoProject then begin
          Accept    := False;
          Exit;
     end;

     //
     joSource  := teTreeToJson(gtnDragSource);
     joDest    := teTreeToJson(tnDest);

     if joDest = nil then begin
          Accept    := False;
          Exit;
     end;

     //
     sNameSrc  := joSource.S['_m_'];
     sNameDest := joDest.S['_m_'];

     //检查父子关系（父节点不能拖动到子节点,也就是不能：gtnDragSource是tnDest的祖先）
     if tnDest.Level>gtnDragSource.Level then begin
          tnTemp    := tnDest;
          while tnTemp.Level >= gtnDragSource.Level do begin
               if tnTemp = gtnDragSource then begin
                    Accept    := False;
                    Exit;
               end else begin
                    tnTemp    := tnTemp.Parent;
               end;
          end;
     end;

     //
     Accept    := teGetAddMode(sNameSrc,sNameDest) <> amNone;
     //
     //Caption   := IntToStr(Integer(teGetAddMode(sNameSrc,sNameDest)));
end;

procedure TMainForm.TreeViewExpanded(Sender: TObject; Node: TTreeNode);
begin
     if bIsCreating then begin
          Exit;
     end;
     //
     UpdateChart;
end;

end.

