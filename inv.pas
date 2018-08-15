procedure TForm1.Button1Click(Sender: TObject);
var
  V     : Variant;    // ����������, � ������� �������� ������ MATLAB

  MReal : OleVariant; // ��� ������ � ��������� ������������
  MImage: OleVariant; // ����������� ���������
  // ����� �� ��������� ��� OleVariant ��� ���-��������������� ������

  i,j   : Integer;    // i - ����� ������, j - ����� �������
begin
  try
    V:=CreateOLEObject('Matlab.Application'); // �������� OLE-�������

    // �������� ������� 3x3 �������� ���� Double, ����� ������ � �������
    // �������� �� 0 �� 2. ��� ������� ����� �������� ������������ ������
    // ����������, ������������� MATLAB, � ��� ����� ����������� ��������
    // ������� A
    MReal  := VarArrayCreate([0, 2, 0, 2], varDouble);

    // ������ ����� ��� �� �����������, �� ��� ����� ��� ������� GetFullMatrix
    MImage := VarArrayCreate([0, 2, 0, 2], varDouble);

    // ���������� ������� ���������� ������������, ������� �����
    // �������������� ��� ������������� ��������� ����������� �������
    // ���������� � ������� ��
    V.Execute('A=[0.4 0.6 0; 0 0.4 0.6; 0 0 1]; A=inv(A)');

    // ����� ������� �������� ������ GetFullMatrix, ������ � ����� ������������
    // ������ MATLAB MathWorks Inc.
    // www.mathworks.com/access/helpdesk/help/techdoc/apiref/getfullmatrix.html

    {

    GetFullMatrix(varname As String, workspace As String, [out] MReal As
    Double, [out] MImage As Double)

    GetFullMatrix gets the matrix stored in the variable varname from the
    specified workspace of the MATLAB server and returns the real part in MReal
    and the imaginary part in MImage. The workspace argument can be either base
    or global.

    Example: assign a 5-by-5 real matrix to the variable A in the base
    workspace of the server, and then read it back with GetFullMatrix.

    Visual Basic Client

    Dim MatLab As Object
    Dim Result As String
    Dim MReal(4,4) As Double
    Dim MImage(4,4) As Double

    MatLab = CreateObject("matlab.application")
    Result = MatLab.Execute("A = rand(5);")
    MatLab.GetFullMatrix("A","base",MReal,MImage)

    }

    // ������� VarArrayRef ���������� ������ �� ������ �������� ���� Variant
    V.GetFullMatrix('A','base',VarArrayRef(MReal),VarArrayRef(MImage));

    for i := 0 to 2 do
      for j := 0 to 2 do
        StringGrid1.Cells[j,i] := MReal[i,j];

    V.Quit; // �������� MATLAB
    V := Unassigned
  except
    // ���, ����������� � ������ ��������� ����������
  end
end;
