unit ExportSVG;

interface

uses
     //�Ա�ģ��
     SysRecords,SysConsts,SysVars,SysUnits,

     //�������ؼ�
     GDIPAPI,

     //ϵͳ�Դ�
     XMLDoc,XMLIntf,
     Windows, Messages, SysUtils,  Dialogs, Math, Classes;

procedure ExportFlowToSVG(Node:IXMLNode;FileName:String;Config:TWWConfig);
procedure ExportNSToSVG(  Node:IXMLNode;FileName:String;Config:TWWConfig);
var
     SVGConfig : TWWConfig;
const
     _FontScale     = 0.4;    //������BH�ı���

implementation

procedure ExportFlowToSVG(  Node:IXMLNode;FileName:String;Config:TWWConfig);
type
     TNodeWHE = record
          W,H,E     : Integer;
     end;
var
     I,J, PID       : Integer;
     iCount         : Integer;
     S              : string;
     Closed         : Boolean;
     Ids            : array of integer;
     BH,BW,SH,SV    : Single;           //����ͼ��֮��ļ��
     X,Y,W,H,E      : Single;
     xnChild        : IXMLNode;
     xnExtra        : IXMLNode;
     bTmp           : Boolean;
     iTmp           : Single;
     xdSVG          : IXMLDocument;
     xnRoot         : IXMLNode;
     xnNew          : IXMLNode;
     // ���ư�Բ������(X,YΪ�м䶥��)
     procedure DrawRoundRect(iX,iY:Single;Text:String);
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" rx="%d" ry="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW*0.75),Round(iY),Round(BW*1.5),Round(BH),Round(BH/2),Round(BH/2)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX-BW*0.75);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(BW*1.5);
          xnNew.Attributes['height']    := Round(BH);
          xnNew.Attributes['rx']        := Round(BH/2);
          xnNew.Attributes['ry']        := Round(BH/2);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
          //
          //slSVG.Add(Format('<text x="%d" y="%d"  style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(iX),Round(iY+BH*0.75),Round(BH*_FontScale),Text]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX);
          xnNew.Attributes['y']         := Round(iY+BH*0.75);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := Text;
     end;
     // ���ƶ������
     procedure DrawPoints(Pts:array of double);
     var
          sTmp : String;
          II   : Integer;
     begin
          sTmp := '';//<polyline points="';
          for II:=0 to High(Pts) do begin
               sTmp := sTmp+IntToStr(Round(Pts[II]))+',';
          end;
          Delete(sTmp,Length(sTmp),1);
          sTmp := sTmp+'" fill="none" stroke="black" stroke-width="2"/>';
          //
          xnNew     := xnRoot.AddChild('polyline');
          xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['points']    := sTmp;
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
     end;
     // ����һ���
     procedure DrawBlock(iX,iY,iW,iH:Single;Text:String;Collapsed:Boolean);
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW),Round(iY),Round(BW*2),Round(BH)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX-BW);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(BW*2);
          xnNew.Attributes['height']    := Round(BH);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
          //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(iX),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX);
          xnNew.Attributes['y']         := Round(iY+BH*0.7);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := Text;
     end;
     // ���ƴ����
     procedure DrawCodeBlock(iX,iY,iW,iH:Single;Text:String);
     var
          I,iTop    : Integer;
          slTmp     : TStringList;
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW),Round(iY),Round(iW),Round(iH)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX-BW);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(iW);
          xnNew.Attributes['height']    := Round(iH);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;

          slTmp     := TStringList.Create;
          slTmp.Text     := Text;
          iTop := Round(iY+(iH-BH*_FontScale*slTmp.Count)/2)-3;
          for I:=0 to slTmp.Count-1 do begin
               iTop := iTop+Round(BH*_FontScale);
               //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:Left" font-size="%d">%s</text>',
               //          [Round(iX-BW+4),iTop,Round(BH*_FontScale),slTmp[I]]));
               xnNew     := xnRoot.AddChild('text');
               xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
               xnNew.Attributes['x']         := Round(iX-BW+4);
               xnNew.Attributes['y']         := iTop;
               xnNew.Attributes['width']     := iW;
               xnNew.Attributes['height']    := iH;
               xnNew.Attributes['style']     := 'text-anchor:left';
               xnNew.Attributes['font-size'] := Round(BH*_FontScale);
               xnNew.Text                    := slTmp[I];
          end;
          slTmp.Destroy;
          //
     end;
     // ��������
     procedure DrawText(S:String;X,Y,W,H:Single);
     begin
          //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(X+W/2),Round(Y+H*0.7),Round(BH*_FontScale),S]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(X+W/2);
          xnNew.Attributes['y']         := Round(Y+H*0.7);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := S;
     end;
     // �������ο�,iX,iYΪ�϶�������
     procedure DrawDiamond(iX,iY:Single;Text:String);
     begin
          //slSVG.Add(Format('<polygon points="%d,%d,%d,%d,%d,%d,%d,%d" fill="none" stroke="black" stroke-width="2" />',
          //          [Round(iX),Round(iY),  Round(iX+BW),Round(iY+BH),  Round(iX),Round(iY+BH*2),  Round(iX-BW),Round(iY+BH)]));
          xnNew     := xnRoot.AddChild('polygon');
          xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['points']    := Format('%d,%d, %d,%d, %d,%d, %d,%d',[Round(iX),Round(iY),  Round(iX+BW),Round(iY+BH),  Round(iX),Round(iY+BH*2),  Round(iX-BW),Round(iY+BH)]);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
          //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(iX),Round(iY+BH*1.2),Round(BH*_FontScale),Text]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX);
          xnNew.Attributes['y']         := Round(iY+BH*1.2);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := Text;
     end;
     // ���Ƽ�ͷ
     procedure DrawArrow(iX,iY:Single;bDown:Boolean);
     begin
          if bDown then begin
               iY   := iY+iDeltaY/2;
               DrawPoints([iX,iY,  iX-iDeltaX,iY-iDeltaY,  iX+iDeltaX,iY-iDeltaY,  iX,iY,  iX,iY-iDeltaY]);
          end else begin
               iY   := iY-iDeltaY/2;
               DrawPoints([iX,iY,  iX-iDeltaX,iY+iDeltaY,  iX+iDeltaX,iY+iDeltaY,  iX,iY,  iX,iY+iDeltaY]);
          end;
     end;
     procedure DrawTry(iX,iY:Single;Text:String;Collapsed:Boolean;Mode:Integer);
     var
          BW,BH     : Single;
          SH,SV     : Single;
     begin
          BW   := SVGConfig.BaseWidth*SVGConfig.Scale;
          BH   := SVGConfig.BaseHeight*SVGConfig.Scale;
          SV   := SVGConfig.SpaceVert*SVGConfig.Scale;
          SH   := SVGConfig.SpaceHorz*SVGConfig.Scale;
          //
          case mode of
               0 : begin
                    //����Try
                    DrawPoints([iX-BW,iY,  iX+BW,iY,  iX+BW-BH,iY+BH,  iX-BW,iY+BH,  iX-BW,iY]);
                    //
                    //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
                    //          [Round(iX),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
                    xnNew     := xnRoot.AddChild('text');
                    xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
                    xnNew.Attributes['x']         := Round(iX);
                    xnNew.Attributes['y']         := Round(iY+BH*0.7);
                    xnNew.Attributes['style']     := 'text-anchor:middle';
                    xnNew.Attributes['font-size'] := Round(BH*_FontScale);
                    xnNew.Text                    := Text;

                    //�½���
                    DrawPoints([iX,iY+BH,  iX,iY+BH+SV]);
               end;
               1 : begin
                    //����except/finally
                    DrawPoints([iX-BW,iY,  iX+BW-BH,iY,  iX+BW-BH-BH/2,iY+BH/2,  iX+BW-BH,iY+BH,  iX-BW,iY+BH,  iX-BW,iY]);
                    //
                    //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
                    //          [Round(iX-BH/4),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
                    xnNew     := xnRoot.AddChild('text');
                    xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
                    xnNew.Attributes['x']         := Round(iX-BH/4);
                    xnNew.Attributes['y']         := Round(iY+BH*0.7);
                    xnNew.Attributes['style']     := 'text-anchor:middle';
                    xnNew.Attributes['font-size'] := Round(BH*_FontScale);
                    xnNew.Text                    := Text;

                    //
                    if Collapsed then begin
                         //��������
                         DrawPoints([iX-BW+5,iY,  iX-BW+5,iY+BH]);
                    end;
                    //�½���
                    DrawPoints([iX,iY+BH,  iX,iY+BH+SV]);
               end;
               2 : begin
                    //����end of Try
                    DrawPoints([iX-BW,iY,  iX+BW-BH,iY,  iX+BW,iY+BH,  iX-BW,iY+BH,  iX-BW,iY]);
                    //
                    //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
                    //          [Round(iX),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
                    xnNew     := xnRoot.AddChild('text');
                    xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
                    xnNew.Attributes['x']         := Round(iX);
                    xnNew.Attributes['y']         := Round(iY+BH*0.7);
                    xnNew.Attributes['style']     := 'text-anchor:middle';
                    xnNew.Attributes['font-size'] := Round(BH*_FontScale);
                    xnNew.Text                    := Text;

                    //�½���
                    DrawPoints([iX,iY+BH,  iX,iY+BH+SV]);
               end;
          end;
     end;
     procedure DrawNodeFlowchart(Node:IXMLNode);
     var
          II,JJ     : Integer;
     begin
          //�����򵥱����Ա�����д
          X    := Node.Attributes['X'];
          Y    := Node.Attributes['Y'];
          E    := Node.Attributes['E'];
          W    := Node.Attributes['W'];
          H    := Node.Attributes['H'];

          //
          if Node.Attributes['W']=-1 then begin
               Exit;
          end;

          //<�����ӽڵ���Ϊ0�Ľڵ�ͺ�£�Ľڵ�
          if (Node.ChildNodes.Count=0) then begin
               //�������ӿ�ڵ�(��������ת����֧)
               if (Node.Attributes['Mode']=rtBlock_Code)
                         and((Node.Attributes['ShowDetailCode']=1)or(grConfig.ShowDetailCode and (Node.Attributes['ShowDetailCode']<>2))) then begin
                    //�ڵ�(����)
                    DrawCodeBlock(X,Y,W,H-SV,Node.Attributes['Text']);
                    //�½���
                    DrawPoints([X,Y+H-SV,  X,Y+H]);
                    //
                    Exit;
               end else if not InModes(Node.Attributes['Mode'],[rtCase_Item,rtCase_Default,rtTry_Except,rtTry_Finally]) then begin
                    if InModes(_M(Node),[rtIF_Else,rtIF_Elseif]) then begin

                         //�½���
                         DrawPoints([X,Y,  X,Y+BH+SV]);
                         //
                         Exit;
                    end else begin
                         //�ڵ�(����)
                         DrawBlock(X,Y,W,H,RTtoStr(Node.Attributes['Mode']),False);
                         //�½���
                         DrawPoints([X,Y+BH,  X,Y+BH+SV]);
                         //
                         Exit;
                    end;
               end;
          end else if (Node.Attributes['Expanded']=False) then begin
               //������£�Ľڵ�(��������֧)
               if not InModes(Node.Attributes['Mode'],[rtCase_Item,rtCase_Default,rtTry_Except,rtTry_Finally]) then begin
                    //��£�ڵ�(����)
                    DrawBlock(X,Y,W,H, RTtoStr(Node.Attributes['Mode']),False);
                    //�½���
                    DrawPoints([X,Y+BH,  X,Y+BH+SV]);
                    //
                    Exit;
               end;
          end;
          //>


          //
          case Node.Attributes['Mode'] of
               //
               rtIF : begin
                    //���ο�
                    DrawDiamond(X,Y,Format('%s',[GetNodeText(Node)]));
                    DrawPoints([X,Y+BH*2,  X,Y+BH*2+SV]); //������
                    //���ο�����������
                    xnChild   := Node.ChildNodes[0];
                    if _M(Node.ChildNodes[1]) = rtIF_ElseIf then begin
                         DrawPoints([_X(xnChild)+BW,Y+BH,  _EL(xnChild.NextSibling),Y+BH]);
                    end else begin
                         DrawPoints([_X(xnChild)+BW,Y+BH,  _X(xnChild.NextSibling),Y+BH]);
                    end;

                    //
                    for JJ:=1 to Node.ChildNodes.Count-1 do begin
                         xnChild   := Node.ChildNodes[JJ];
                         if _M(xnChild) = rtIF_ElseIf then begin
                              //���ο�
                              DrawDiamond(_X(xnChild),_Y(xnChild)-BH*2-SV,GetNodeText(xnChild));
                              DrawPoints([_X(xnChild),_Y(xnChild)-SV,_X(xnChild),_Y(xnChild)]); //���ο�������
                              DrawPoints([_X(xnChild)+BW,_Y(xnChild)-SV-BH,_EL(xnChild.NextSibling),_Y(xnChild)-SV-BH]);  //���ο�����������

                         end else begin
                              DrawPoints([_L(xnChild),_Y(xnChild)-SV-BH,_X(xnChild),_Y(xnChild)-SV-BH]);  //����ģ�����ο�����������
                              DrawPoints([_X(xnChild),_Y(xnChild)-SV-BH,_X(xnChild),_Y(xnChild)]); //�����ο�������
                         end;
                              DrawPoints([_X(xnChild),_B(xnChild),_X(xnChild),_EB(xnChild.ParentNode)]); //ģ��������½���
                    end;

                    //�����ģ���½���
                    DrawPoints([X,Y+H-SV,_X(Node.ChildNodes.Last),Y+H-SV]);
                    //YES����½���
                    DrawPoints([X,_B(Node.ChildNodes.First),  X,Y+H]);
               end;

               //
               rtFOR : begin
                    //���ο�
                    DrawPoints([X-BW,Y,  X+W-BW-Sh-BH,Y,  X+W-BW-Sh,Y+BH/2,  X+W-BW-Sh-BH,Y+BH,  X-BW,Y+BH,  X-BW,Y]);
                    DrawText(Format('for %s',[Node.Attributes['Caption']]),X-BW,Y,W-Sh-BH/2,BH);
                    DrawPoints([X,Y+BH,  X,Y+BH+SV]);
                    //�õ��ӿ�
                    xnChild   := Node.ChildNodes.First;
                    //�˳�ѭ����
                    DrawPoints([X+W-BW-Sh,Y+BH/2,  X+W-BW,Y+BH/2,  X+W-BW,Y+H-SV,  X,Y+H-SV,  X,Y+H]);
                    DrawArrow(X+W-BW,Y+H / 2, True);
                    //����ѭ����
                    DrawPoints([X,Y+H-SV*3,  X,Y+H-SV*2,  X-BW-E,Y+H-SV*2,  X-BW-E,Y+BH/2,  X-BW,Y+BH/2]);
                    DrawArrow(X-BW-E,Y+H / 2, False);
               end;

               //
               rtWhile : begin
                    //���ο�
                    DrawDiamond(X,Y+SV,Format('%s',[GetNodeText(Node)]));
                    DrawPoints([X,Y+BH*2+SV,  X,Y+BH*2+SV*2]);
                    //�õ��ӿ�
                    xnChild   := Node.ChildNodes.First;
                    //�˳�ѭ����
                    DrawPoints([X+BW,Y+BH+SV,  X+W-BW,Y+BH+SV,  X+W-BW,Y+H-SV,  X,Y+H-SV,  X,Y+H]);
                    DrawArrow(X+W-BW,Y+H / 2, True);
                    //����ѭ����
                    DrawPoints([X,StrToFloat(xnChild.Attributes['Y'])+xnChild.Attributes['H'],
                              X,Y+H-SV*2,  X-BW-E,Y+H-SV*2,  X-BW-E,Y,  X,Y,  X,Y+SV]);
                    DrawArrow(X-BW-E,Y+H / 2, False);
               end;

               //
               rtRepeat : begin
                    //�õ��ӿ�
                    xnChild   := Node.ChildNodes.First;
                    //���ο�
                    DrawDiamond(X,StrToFloat(xnChild.Attributes['Y'])+xnChild.Attributes['H'],
                              Format('%s',[Node.Attributes['Caption']]));
                    DrawPoints([X,StrToFloat(xnChild.Attributes['Y'])+xnChild.Attributes['H']+BH*2,
                              X,StrToFloat(xnChild.Attributes['Y'])+xnChild.Attributes['H']+BH*2+SV]);
                    //�˳�ѭ����
                    DrawPoints([X+BW,Y+H-SV*3-BH,  X+W-BW,Y+H-SV*3-BH,  X+W-BW,Y+H-SV,  X,Y+H-SV,  X,Y+H]);
                    DrawArrow(X+W-BW,Y+H-SV*2-BH/2, True);
                    //����ѭ����
                    DrawPoints([X,Y+H-SV*3,  X,Y+H-SV*2,  X-BW-E,Y+H-SV*2,  X-BW-E,Y,  X,Y,  X,Y+SV]);
                    DrawArrow(X-BW-E,Y+(H-SV*2)/2, False);
               end;

               //
               rtCase : begin
                    //�����ӿ�
                    bTmp := False; //��¼�Ƿ��������ת����һ��֧����

                    //
                    for JJ:=0 to Node.ChildNodes.Count-1 do begin
                         //�õ���Ӧ�ӿ�
                         xnChild   := Node.ChildNodes[JJ];

                         //�õ��ӿ����Ϣ
                         X    := xnChild.Attributes['X'];
                         Y    := xnChild.Attributes['Y'];
                         E    := xnChild.Attributes['E'];
                         W    := xnChild.Attributes['W'];
                         H    := xnChild.Attributes['H'];

                         //���ο�
                         DrawDiamond(X,Y-BH*2-SV*2,xnChild.Attributes['Caption']);
                         //���ο��½���
                         DrawPoints([X,Y-SV*2,  X,Y]);

                         //�����һ����ת������, ����Ҫ������ת��
                         if bTmp then begin
                              DrawPoints([X,Y-SV,  X-BW-E,Y-SV]);
                         end;
                         //
                         bTmp := False; //��¼�Ƿ��������ת����һ��֧����

                         //����ǵ�һ��֦, ���������һ�������ߵı����ڲ���
                         if J>0 then begin
                              DrawPoints([X-BW,Y-BH-SV*2,  X-BW-E,Y-BH-SV*2]);
                         end;

                         //����һ���ڵ����(��),���п�����ת����һ��֧����
                         if JJ<>Node.ChildNodes.Count-1 then begin
                              //����(ֻ���Ʊ����зֽ粿��)
                              DrawPoints([X+BW,Y-BH-SV*2,  X+W-BW+SH*2,Y-BH-SV*2]);

                              if InModes(Config.Language,[loC,loCpp]) then begin
                                   //������һ���ӿ鲻����ת, �����һ����ת����һ��֧����(����λ�ڱ����ڵĲ���)
                                   if Config.Language in [loC,loCpp] then begin
                                        if xnChild.HasChildNodes then begin
                                             xnChild   := xnChild.ChildNodes.Last;
                                             if not InModes(xnChild.Attributes['Mode'],[rtJUMP_Break,rtJUMP_Continue,rtJUMP_Exit,rtJUMP_Goto]) then begin
                                                  DrawPoints([X,Y+H,  X+W-BW+SH,Y+H,  X+W-BW+SH,Y-SV,  X+W-BW+SH*2,Y-SV]);
                                                  bTmp := True;
                                             end;
                                        end else begin
                                             //�����ǰ��֧û���ӿ�,��ֱ����ת����һ��
                                             DrawPoints([X,Y,  X+W-BW+SH,Y,  X+W-BW+SH,Y-SV,  X+W-BW+SH*2,Y-SV]);
                                             bTmp := True;
                                        end;
                                   end;
                              end;
                         end else begin     //�����һ���ӿ����SWITCH�Ķ��֧��ͳһ������
                              DrawPoints([X,StrToFloat(Node.Attributes['Y'])+Node.Attributes['H']-SV,
                                        Node.Attributes['X'], StrToFloat(Node.Attributes['Y'])+Node.Attributes['H']-SV,
                                        Node.Attributes['X'], StrToFloat(Node.Attributes['Y'])+Node.Attributes['H']]);
                         end;

                         //���û�л�������ת����һ��֧����,����Ƶ���ǰ��������������ӵ���
                         if not bTmp then begin
                              DrawPoints([X,Y+H,  X,StrToFloat(Node.Attributes['Y'])+Node.Attributes['H']-SV]);
                         end;

                         //����ײ�����һ�����¼�ͷ
                         DrawArrow(X,Y+H-iDeltaY/2,True);

                    end;

                    //
               end;

               rtCase_Item,rtCase_Default : begin
                    //�����ǰ�ӿ�δչ��,�����һ��
                    if (Node.Attributes['Expanded']=False) then begin
                         if Node.HasChildNodes then begin
                              iTmp := Y;
                              DrawBlock(x,iTmp,W,H,'... ...',True);
                              //�½���
                              DrawPoints([X,iTmp+BH,  X,iTmp+BH+SV]);

                         end;
                    end ;
               end;

               //
               rtTry : begin
                    //����Try
                    DrawTry(X,Y,RTtoStr(Node.Attributes['Mode']),True,0);

                    //����End of Try
                    //iTmp := Y+H-BH-SV;
                    //DrawTry(X,iTmp,'TRY END',True,2);
               end;
               //
               rtTry_Except,rtTry_Finally,rtTry_Else : begin
                    //����
                    DrawTry(X,Y,RTtoStr(Node.Attributes['Mode']),not Node.Attributes['Expanded'],1);
               end;

          else

          end;
          //�ݹ�������ӽڵ�
          if Node.Attributes['Expanded'] then begin
               for II:=0 to Node.ChildNodes.Count-1 do begin
                    DrawNodeFlowchart(Node.ChildNodes[II]);
               end;
          end;
     end;
begin

     //<�õ�����ͼ����
     SVGConfig := Config;
     BW   := Config.BaseWidth*Config.Scale;
     BH   := Config.BaseHeight*Config.Scale;
     SH   := Config.SpaceHorz*Config.Scale;
     SV   := Config.SpaceVert*Config.Scale;
     if BW=0 then begin
          BW   := 50;
     end;
     if BH=0 then begin
          BH   := 30;
     end;
     if SH=0 then begin
          SH   := 20;
     end;
     if SV=0 then begin
          SV   := 20;
     end;
     //>

     //�����ļ�
     xdSVG     := TXMLDocument.Create(nil);
     xdSVG.Active   := True;
     xdSVG.Version  := '1.0';
     xdSVG.Encoding := 'UTF-8';
     xnRoot    := xdSVG.AddChild('svg');
     xnRoot.Attributes['width']    := Node.Attributes['E']+0+Node.Attributes['W']+SH*2;
     xnRoot.Attributes['height']   := Node.Attributes['H']+BH*2+SV*3+4;
     xnRoot.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';



     //--------------------------���λ�������ͼ(�˺�Ĵ���Ӧ�ܹ���)-------------------------------//
     //<���ƿ�ʼ�ͽ�����־
     //��ʼ��־
     X    := Node.Attributes['X'];
     Y    := SV;
     DrawRoundRect(X,Y,'START');
     //�½���
     DrawPoints([X,Y+BH,  X,Y+BH+SV]);
     //������־
     X    := Node.Attributes['X'];
     Y    := Round(StrToFloat(Node.Attributes['Y']))+Round(StrToFloat(Node.Attributes['H']));
     DrawRoundRect(X,Y,'END');
     //>

     //�ݹ��������ͼ
     DrawNodeFlowchart(Node);
     //-------------------------��������----------------------------------------------------------//


     xdSVG.SaveToFile(FileName);
     //slSVG.Destroy;

     //
     MessageDlg(#13'   ---   Export SVG successfully!   ---   '#13,mtInformation,[mbOK],0);
end;

procedure ExportNSToSVG(Node:IXMLNode;FileName:String;Config:TWWConfig);
type
     TNodeWHE = record
          W,H,E     : Integer;
     end;
var
     I,J, PID       : Integer;
     iCount         : Integer;
     S              : string;
     Closed         : Boolean;
     Ids            : array of integer;
     BH,BW,SH,SV    : Single;           //����ͼ��֮��ļ��
     X,Y,W,H,E      : Single;
     xnChild        : IXMLNode;
     xnExtra        : IXMLNode;
     bTmp           : Boolean;
     iTmp           : Single;
     sTxt           : String;
     xdSVG          : IXMLDocument;
     xnRoot         : IXMLNode;
     xnNew          : IXMLNode;
     // ���ư�Բ������(X,YΪ�м䶥��)
     procedure DrawRoundRect(iX,iY:Single;Text:String);
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" rx="%d" ry="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW*0.75),Round(iY),Round(BW*1.5),Round(BH),Round(BH/2),Round(BH/2)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX-BW*0.75);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(BW*1.5);
          xnNew.Attributes['height']    := Round(BH);
          xnNew.Attributes['rx']        := Round(BH/2);
          xnNew.Attributes['ry']        := Round(BH/2);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
          //
          //slSVG.Add(Format('<text x="%d" y="%d"  style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(iX),Round(iY+BH*0.75),Round(BH*_FontScale),Text]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX);
          xnNew.Attributes['y']         := Round(iY+BH*0.75);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := Text;
     end;
     // ���ƶ������
     procedure DrawPoints(Pts:array of double);
     var
          sTmp : String;
          II   : Integer;
     begin
          sTmp := '';//<polyline points="';
          for II:=0 to High(Pts) do begin
               sTmp := sTmp+IntToStr(Round(Pts[II]))+',';
          end;
          Delete(sTmp,Length(sTmp),1);
          sTmp := sTmp+'" fill="none" stroke="black" stroke-width="2"/>';
          //
          xnNew     := xnRoot.AddChild('polyline');
          xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['points']    := sTmp;
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
     end;
     // ����һ���
     procedure DrawBlock(iX,iY,iW,iH:Single;Text:String;Collapsed:Boolean);
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW),Round(iY),Round(BW*2),Round(BH)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX-BW);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(BW*2);
          xnNew.Attributes['height']    := Round(BH);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;
          //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(iX),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX);
          xnNew.Attributes['y']         := Round(iY+BH*0.7);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := Text;
     end;
     // ���ƴ����
     procedure DrawCodeBlock(iX,iY,iW,iH:Single;Text:String);
     var
          I,iTop    : Integer;
          slTmp     : TStringList;
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW),Round(iY),Round(iW),Round(iH)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX-BW);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(iW);
          xnNew.Attributes['height']    := Round(iH);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;

          slTmp     := TStringList.Create;
          slTmp.Text     := Text;
          iTop := Round(iY+(iH-BH*_FontScale*slTmp.Count)/2)-3;
          for I:=0 to slTmp.Count-1 do begin
               iTop := iTop+Round(BH*_FontScale);
               //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:Left" font-size="%d">%s</text>',
               //          [Round(iX-BW+4),iTop,Round(BH*_FontScale),slTmp[I]]));
               xnNew     := xnRoot.AddChild('text');
               xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
               xnNew.Attributes['x']         := Round(iX-BW+4);
               xnNew.Attributes['y']         := iTop;
               xnNew.Attributes['width']     := iW;
               xnNew.Attributes['height']    := iH;
               xnNew.Attributes['style']     := 'text-anchor:left';
               xnNew.Attributes['font-size'] := Round(BH*_FontScale);
               xnNew.Text                    := slTmp[I];
          end;
          slTmp.Destroy;
          //
     end;
     // ��������
     procedure DrawText(S:String;X,Y,W,H:Single);
     begin
          //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(X+W/2),Round(Y+H*0.7),Round(BH*_FontScale),S]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(X+W/2);
          xnNew.Attributes['y']         := Round(Y+H*0.7);
          xnNew.Attributes['style']     := 'text-anchor:middle';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := S;
     end;
     procedure DrawTry(iX,iY:Single;Text:String;Collapsed:Boolean;Mode:Integer);
     var
          BW,BH     : Single;
          SH,SV     : Single;
     begin
          BW   := SVGConfig.BaseWidth*SVGConfig.Scale;
          BH   := SVGConfig.BaseHeight*SVGConfig.Scale;
          SV   := SVGConfig.SpaceVert*SVGConfig.Scale;
          SH   := SVGConfig.SpaceHorz*SVGConfig.Scale;
          //
          case mode of
               0 : begin
                    //����Try
                    DrawPoints([iX-BW,iY,  iX+BW,iY,  iX+BW-BH,iY+BH,  iX-BW,iY+BH,  iX-BW,iY]);
                    //
                    //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
                    //          [Round(iX),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
                    xnNew     := xnRoot.AddChild('text');
                    xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
                    xnNew.Attributes['x']         := Round(iX);
                    xnNew.Attributes['y']         := Round(iY+BH*0.7);
                    xnNew.Attributes['style']     := 'text-anchor:middle';
                    xnNew.Attributes['font-size'] := Round(BH*_FontScale);
                    xnNew.Text                    := Text;

                    //�½���
                    DrawPoints([iX,iY+BH,  iX,iY+BH+SV]);
               end;
               1 : begin
                    //����except/finally
                    DrawPoints([iX-BW,iY,  iX+BW-BH,iY,  iX+BW-BH-BH/2,iY+BH/2,  iX+BW-BH,iY+BH,  iX-BW,iY+BH,  iX-BW,iY]);
                    //
                    //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
                    //          [Round(iX-BH/4),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
                    xnNew     := xnRoot.AddChild('text');
                    xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
                    xnNew.Attributes['x']         := Round(iX-BH/4);
                    xnNew.Attributes['y']         := Round(iY+BH*0.7);
                    xnNew.Attributes['style']     := 'text-anchor:middle';
                    xnNew.Attributes['font-size'] := Round(BH*_FontScale);
                    xnNew.Text                    := Text;

                    //
                    if Collapsed then begin
                         //��������
                         DrawPoints([iX-BW+5,iY,  iX-BW+5,iY+BH]);
                    end;
                    //�½���
                    DrawPoints([iX,iY+BH,  iX,iY+BH+SV]);
               end;
               2 : begin
                    //����end of Try
                    DrawPoints([iX-BW,iY,  iX+BW-BH,iY,  iX+BW,iY+BH,  iX-BW,iY+BH,  iX-BW,iY]);
                    //
                    //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
                    //          [Round(iX),Round(iY+BH*0.7),Round(BH*_FontScale),Text]));
                    xnNew     := xnRoot.AddChild('text');
                    xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
                    xnNew.Attributes['x']         := Round(iX);
                    xnNew.Attributes['y']         := Round(iY+BH*0.7);
                    xnNew.Attributes['style']     := 'text-anchor:middle';
                    xnNew.Attributes['font-size'] := Round(BH*_FontScale);
                    xnNew.Text                    := Text;

                    //�½���
                    DrawPoints([iX,iY+BH,  iX,iY+BH+SV]);
               end;
          end;
     end;

     // ����һ���
     procedure NSDrawBlock(iX,iY,iW,iH:Single;Text:String;Collapsed:Boolean);
     var
          slTmp     : TStringList;
          iTop      : Integer;
          II        : Integer;
     begin
          //slSVG.Add(Format('<rect x="%d" y="%d" width="%d" height="%d" fill="none" stroke="black" stroke-width="2"/>',
          //          [Round(iX-BW),Round(iY),Round(iW),Round(iH)]));
          xnNew     := xnRoot.AddChild('rect');
          xnNew.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(iX);
          xnNew.Attributes['y']         := Round(iY);
          xnNew.Attributes['width']     := Round(iW);
          xnNew.Attributes['height']    := Round(iH);
          xnNew.Attributes['fill']      := 'none';
          xnNew.Attributes['stroke']    := 'black';
          xnNew.Attributes['stroke-width']   := 2;

          slTmp     := TStringList.Create;
          slTmp.Text     := Text;
          iTop := Round(iY+(iH-BH*_FontScale*slTmp.Count)/2)-3;
          for II:=0 to slTmp.Count-1 do begin
               iTop := iTop+Round(BH*_FontScale);
               //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:Left" font-size="%d">%s</text>',
               //          [Round(iX-BW+4),iTop,Round(BH*_FontScale),slTmp[I]]));
               xnNew     := xnRoot.AddChild('text');
               xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
               xnNew.Attributes['x']         := Round(iX+4);
               xnNew.Attributes['y']         := iTop;
               xnNew.Attributes['width']     := iW;
               xnNew.Attributes['height']    := iH;
               xnNew.Attributes['style']     := 'text-anchor:left';
               xnNew.Attributes['font-size'] := Round(BH*_FontScale);
               xnNew.Text                    := slTmp[II];
          end;
          slTmp.Destroy;
          //
     end;
     procedure ClearLastColor;
     begin
     end;
     procedure DrawString(S:String;Rect:TGPRectF);
     begin
          //slSVG.Add(Format('<text x="%d" y="%d" style="text-anchor:middle" font-size="%d">%s</text>',
          //          [Round(Rect.X+Rect.Width/2),Round(Rect.Y+Rect.Height/2+BH*0.2),Round(BH*_FontScale),S]));
          xnNew     := xnRoot.AddChild('text');
          xnNew.Attributes['xmlns']     := 'http://www.w3.org/2000/svg';
          xnNew.Attributes['x']         := Round(Rect.X+Rect.Width/2);
          xnNew.Attributes['y']         := Round(Rect.Y+Rect.Height/2+BH*0.2);
          xnNew.Attributes['style']     := 'text-anchor:left';
          xnNew.Attributes['font-size'] := Round(BH*_FontScale);
          xnNew.Text                    := S;
     end;
     function GetNodeWHE(Node:IXMLNode):TNodeWHE;
     var
          iiCode    : Integer;
          KK        : Integer;
          xnFirst   : IXMLNode;
          xnNext    : IXMLNode;
          rChild    : TNodeWHE;
          rExtra    : TNodeWHE;
     begin
          //����Ѽ����,��ֱ�ӳ����
          if Node.HasAttribute('W') then begin
               Result.W  := Node.Attributes['W'];
               Result.H  := Node.Attributes['H'];
               Result.E  := Node.Attributes['E'];
               //
               Exit;
          end else begin
               ShowMessage('Export to Visio Error when GetNodeWHE !'#13+Node.NodeName);
          end;
     end;
     procedure DrawNodeNSchart(Node:IXMLNode);
     var
          II,JJ     : Integer;
          rChild    : TNodeWHE;
          rExtra    : TNodeWHE;
     begin
          //�����򵥱����Ա�����д
          X    := Node.Attributes['X'];
          Y    := Node.Attributes['Y'];
          E    := 0;//Node.Attributes['E'];
          W    := Node.Attributes['W'];
          H    := Node.Attributes['H'];

          //
          if Node.Attributes['W']=-1 then begin
               Exit;
          end;

          //
          if Node.Attributes['Mode']=rtCase_Item then begin
               sTxt := Node.Attributes['Caption'];
          end else begin
               sTxt := RTtoStr(Node.Attributes['Mode']);
          end;

          //<�����ӽڵ���Ϊ0�Ľڵ�ͺ�£�Ľڵ�
          if (Node.ChildNodes.Count=0) then begin
               //�������ӿ�ڵ�(��������ת����֧)
               if (Node.Attributes['Mode']=rtBlock_Code)
                         and((Node.Attributes['ShowDetailCode']=1)or(grConfig.ShowDetailCode and (Node.Attributes['ShowDetailCode']<>2))) then begin
                    //�ڵ�(����)
                    NSDrawBlock(X,Y,W,H,Node.Attributes['Text'],False);
                    //
                    Exit;
               end else begin
                    if not InModes(Node.Attributes['Mode'],[rtCase_Item,rtCase_Default,rtTry_Except,rtTry_Finally]) then begin
                         //�ڵ�(����)
                         NSDrawBlock(X,Y,W,H,sTxt,False);
                         //
                         Exit;
                    end;
               end;
          end else if (not Node.Attributes['Expanded']) then begin
               //������£�Ľڵ�(��������֧)
               if not InModes(Node.Attributes['Mode'],[rtCase_Item,rtCase_Default,rtTry_Except,rtTry_Finally]) then begin
                    //��£�ڵ�(����)
                    NSDrawBlock(X,Y,W,H,sTxt,False);
                    //
                    Exit;
               end;
          end;
          //>

          //
          case Node.Attributes['Mode'] of
               //
               rtIF : begin
                    xnChild   := Node.ChildNodes[0];
                    rChild    := GetNodeWHE(xnChild);
                    //�������
                    DrawPoints([X,Y,  X+W,Y,  X+W,Y+BH,  X,Y+BH,  X,Y, X+rChild.W,Y+BH, X+W,Y]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(sTxt,MakeRect(X,Y,rChild.W*2,BH));
               end;

               //
               rtFOR : begin
                    //�������
                    DrawPoints([X,Y+H,  X,Y,  X+W,Y,  X+W,Y+H,  X+W-SH,Y+H]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(sTxt,MakeRect(X,Y,W,BH));
               end;

               //
               rtWhile : begin
                    //�������
                    DrawPoints([X+SH,Y+H,  X,Y+H,  X,Y,  X+W,Y,  X+W,Y+BH]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(sTxt,MakeRect(X,Y,W,BH));
               end;

               //
               rtRepeat : begin
                    //�������
                    DrawPoints([X+W-SH,Y,  X+W,Y,  X+W,Y+H,  X,Y+H,  X,Y+H-H]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(sTxt,MakeRect(X,Y+H-BH,W,BH));
               end;

               //
               rtCase : begin
                    //����
                    DrawPoints([X,Y,  X+W,Y,  X+W,Y+BH,  X,Y+BH,  X,Y]);
                    //д����
                    //SetLastText(sTxt);
                    //����б��
                    DrawPoints([X,Y,  X+BH,Y+BH]);
                    DrawPoints([X+W,Y,  X+W-BH,Y+BH]);
                    //
                    DrawString(sTxt+' '+Node.Attributes['Caption'],MakeRect(X,Y,W,BH));
               end;

               rtCase_Item,rtCase_Default : begin
                    //�������
                    DrawPoints([X,Y,  X+W,Y,  X+W,Y+BH,  X,Y+BH,  X,Y]);
                    //���ӿ�Ŀ�
                    DrawPoints([X,Y,  X+W,Y,  X+W,Y+H,  X,Y+H,  X,Y]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(Node.Attributes['Caption'],MakeRect(X,Y,W,BH));
               end;

               //
               rtTry : begin
                    //�������
                    DrawPoints([X,Y,  X+W,Y,  X+W,Y+H,  X,Y+H,  X,Y]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(sTxt,MakeRect(X,Y,W,BH));
               end;
               //
               rtTry_Except,rtTry_Finally : begin
                    //�������
                    DrawPoints([X+W,Y,  X+W,Y+BH]);
                    //���ӿ�Ŀ�
                    DrawPoints([X,Y+BH,  X+W,Y+BH,  X+W,Y+H,  X,Y+H,  X,Y+BH]);
                    //д����
                    //SetLastText(sTxt);
                    DrawString(sTxt,MakeRect(X,Y,W,BH));
               end;
          else

          end;
          //>

          //�ݹ�������ӽڵ�
          if Node.Attributes['Expanded'] then begin
               for II:=0 to Node.ChildNodes.Count-1 do begin
                    DrawNodeNSchart(Node.ChildNodes[II]);
               end;
          end;
     end;
begin


     //<�õ�����ͼ����
     SVGConfig := Config;
     BW   := Config.BaseWidth*Config.Scale;
     BH   := Config.BaseHeight*Config.Scale;
     SH   := Config.SpaceHorz*Config.Scale;
     SV   := Config.SpaceVert*Config.Scale;
     if BW=0 then begin
          BW   := 50;
     end;
     if BH=0 then begin
          BH   := 30;
     end;
     if SH=0 then begin
          SH   := 20;
     end;
     if SV=0 then begin
          SV   := 20;
     end;
     //>

     //�����ļ�
     xdSVG     := TXMLDocument.Create(nil);
     xdSVG.Active   := True;
     xdSVG.Version  := '1.0';
     xdSVG.Encoding := 'UTF-8';
     xnRoot    := xdSVG.AddChild('svg');
     xnRoot.Attributes['width']    := Node.Attributes['E']+0+Node.Attributes['W']+SH*2;
     xnRoot.Attributes['height']   := Node.Attributes['H']+BH*2+SV*3+4;
     xnRoot.Attributes['xmlns']    := 'http://www.w3.org/2000/svg';



     //--------------------------���λ�������ͼ(�˺�Ĵ���Ӧ�ܹ���)-------------------------------//
     //<���ƿ�ʼ�ͽ�����־
     //��ʼ��־
     X    := Node.Attributes['X']+0+Node.Attributes['W'] / 2;
     Y    := SV;
     DrawRoundRect(X,Y,'START');
     //�½���
     DrawPoints([X,Y+BH,  X,Y+BH+SV]);
     //������־
     X    := Node.Attributes['X']+0+Node.Attributes['W'] / 2;
     Y    := Node.Attributes['Y']+0+Node.Attributes['H']+SV;
     //�½���
     DrawPoints([X,Y-SV,  X,Y]);
     DrawRoundRect(X,Y,'END');
     //>

     //�ݹ��������ͼ
     DrawNodeNSchart(Node);
     //-------------------------��������----------------------------------------------------------//


     xdSVG.SaveToFile(FileName);
     //slSVG.Destroy;

     //
     MessageDlg(#13'   ---   Export SVG successfully!   ---   '#13,mtInformation,[mbOK],0);
end;



end.