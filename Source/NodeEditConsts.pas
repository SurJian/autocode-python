unit NodeEditConsts;

interface

uses
     SysConsts;

const
     //����ͼ����
     cmFlowchart    = 0;
     cmNsChart      = 1;
     cmPAD          = 2;
const     //�¼�ģʽ
     nmAppend       = 0;
     nmChild        = 1;
     nmInsert       = 2;
     nmLastPrev     = 3;
     nmRootAppend   = 4;
     nmFuncAppend   = 5;

     //ֻ�ܲ����ӽڵ�Ľڵ�����
     gForceChildSet : array[0..13] of Integer= (
               rtFile,rtFunc,rtClass,
               rtIF_Yes,rtIF_ELSE,rtIF_ELSEIF,
               rtTry_Except,rtTry_Body,rtTry_Finally,
               rtCase_Item,rtCase_Default,
               rtFOR_Body,rtBlock_Body,rtFile);
     gHasChildSet : array[0..0] of Integer= (rtBlock_Set);

const     //TreeView���Ҽ��˵�
     pmProject      = 1;
     pmImportFile   = 2;
     pmSeparate1    = 3;
     pmFunc         = 4;
     pmSET          = 5;
     pmIF           = 6;
     pmFOR          = 7;
     pmCODE         = 8;
     pmSeparate2    = 9;
     pmCASE         = 10;
     pmCASEItem     = 11;
     pmSeparate3    = 12;
     pmWHILE        = 13;
     pmREPEAT       = 14;
     pmSeparate4    = 15;
     pmBREAK        = 16;
     pmContinue     = 17;
     pmEXIT         = 18;
     pmSeparate5    = 19;
     pmCopy         = 20;
     pmPaste        = 21;
     pmDelete       = 22;
     pmTry          = 23;
     pmExtra        = 24;
     pmHeader       = 25;
     pmLibrary      = 26;



const     //ע�͸�ʽ
     cfNone         = 0; //��ע��
     cfStar         = 1; // �����Ƶ�/**/��ע��
     cfBrief        = 2; // �����Ƶ�//��ע��
     cfAFSformat    = 3; // AFS��ר������/*>  <*/,�������ڴӴ���-->���̻��ļ�


implementation

end.
 